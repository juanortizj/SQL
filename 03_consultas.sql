-- Desde esta parte se comienza a hacer lo pedido en la guia
SELECT marca_carro, promedio_co2, ranking
FROM (
    SELECT marca_carro,
           ROUND(AVG(valor_co2), 2) AS promedio_co2,
           RANK() OVER (ORDER BY AVG(valor_co2) DESC) AS ranking
    FROM Medicion_co2
    WHERE fecha >= ADD_MONTHS(TO_DATE('20-05-2026','DD-MM-YYYY'), -3)
    GROUP BY marca_carro
) WHERE ranking <= 5;

-- Evolución mensual por vehículo
SELECT marca_carro,
       EXTRACT(YEAR FROM fecha) AS anio,
       EXTRACT(MONTH FROM fecha) AS mes,
       ROUND(AVG(valor_co2), 2) AS promedio_co,
       ROUND(AVG(valor_co2) - LAG(AVG(valor_co2), 1, 0) OVER (PARTITION BY marca_carro ORDER BY EXTRACT(YEAR FROM fecha), EXTRACT(MONTH FROM fecha)), 2) AS diferencia_mes_anterior,
       ROUND(AVG(AVG(valor_co2)) OVER (PARTITION BY marca_carro ORDER BY EXTRACT(YEAR FROM fecha), EXTRACT(MONTH FROM fecha) ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS promedio_movil_3_meses
FROM Medicion_co2
GROUP BY marca_carro, EXTRACT(YEAR FROM fecha), EXTRACT(MONTH FROM fecha);

-- vehiculos con mejora post-mantenimiento
WITH Ventana_Mantenimiento AS (
    SELECT m.ID_mantenimiento,
           m.marca_carro,
           (SELECT AVG(m1.valor_co2) FROM Medicion_co2 m1 WHERE m1.ID_mantenimiento = m.ID_mantenimiento AND m1.fecha BETWEEN t.fecha_mantenimiento - 30 AND t.fecha_mantenimiento - 1) AS antes,
           (SELECT AVG(m2.valor_co2) FROM Medicion_co2 m2 WHERE m2.ID_mantenimiento = m.ID_mantenimiento AND m2.fecha BETWEEN t.fecha_mantenimiento + 1 AND t.fecha_mantenimiento + 30) AS despues
    FROM Medicion_co2 m
    JOIN Mantenimiento t ON m.ID_mantenimiento = t.ID_mantenimiento
)
SELECT DISTINCT marca_carro, ROUND(antes, 2) AS co2_antes, ROUND(despues, 2) AS co2_despues,
       ROUND(((antes - despues) / antes) * 100, 2) AS porcentaje_mejora
FROM Ventana_Mantenimiento
WHERE antes IS NOT NULL AND despues IS NOT NULL AND ((antes - despues) / antes) > 0.10
ORDER BY porcentaje_mejora DESC;

-- Acá se saca el orcentaje de vehículos fuera de norma por ciudad
WITH Infractores AS (
    SELECT DISTINCT m.marca_carro, m.ciudad
    FROM Medicion_co2 m
    JOIN Vehiculos v ON m.marca_carro = v.marca
    JOIN Normas_Ambientales n ON v.ID_normas_ambientales = n.ID_normas_ambientales
    WHERE m.valor_co2 > n.co2_max_permitido
),
Totales_Ciudad AS (
    SELECT c.nombre_ciudad AS ciudad_nombre,
           (SELECT COUNT(DISTINCT m1.marca_carro) FROM Medicion_co2 m1 WHERE m1.ciudad = c.nombre_ciudad) AS total_carros,
           COUNT(inf.marca_carro) AS total_infractores
    FROM Ciudades c
    LEFT JOIN Infractores inf ON c.nombre_ciudad = inf.ciudad
    GROUP BY c.nombre_ciudad
)
SELECT ciudad_nombre, total_carros, total_infractores,
       CASE WHEN total_carros = 0 THEN 0 
       ELSE ROUND((total_infractores / total_carros) * 100, 2) END AS porcentaje_fuera_norma
FROM Totales_Ciudad;