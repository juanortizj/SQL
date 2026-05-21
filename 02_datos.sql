-- De aca para abajo se introducen los valores a las tablas
INSERT INTO Tipo_combustible VALUES (1, 'Gasolina');
INSERT INTO Tipo_combustible VALUES (2, 'Diesel');
INSERT INTO Tipo_combustible VALUES (3, 'Gas Natural');
INSERT INTO Tipo_combustible VALUES (4, 'Electrico');
INSERT INTO Tipo_combustible VALUES (5, 'Hibrido');

--Estos datos sirven para el ejercico del mantenimiento
insert into Medicion_co2 values (201, to_date('10-01-2026','dd-mm-yyyy'), 180.00, 'Alta', 'Gasolina', 'CO2', 1, 'Cali', 'Mazda');
insert into Medicion_co2 values (202, to_date('12-01-2026','dd-mm-yyyy'), 175.00, 'Alta', 'Gasolina', 'CO2', 1, 'Cali', 'Mazda');
insert into Medicion_co2 values (203, to_date('13-01-2026','dd-mm-yyyy'), 178.00, 'Alta', 'Gasolina', 'CO2', 1, 'Cali', 'Mazda');
insert into Medicion_co2 values (204, to_date('20-01-2026','dd-mm-yyyy'), 95.00, 'Baja', 'Gasolina', 'CO2', 1, 'Cali', 'Mazda');
insert into Medicion_co2 values (205, to_date('25-01-2026','dd-mm-yyyy'), 90.00, 'Baja', 'Gasolina', 'CO2', 1, 'Cali', 'Mazda');
insert into Medicion_co2 values (206, to_date('01-02-2026','dd-mm-yyyy'), 88.00, 'Baja', 'Gasolina', 'CO2', 1, 'Cali', 'Mazda');
insert into Medicion_co2 values (207, to_date('05-02-2026','dd-mm-yyyy'), 200.00, 'Alta', 'Diesel', 'NOx', 2, 'Bogota', 'Chevrolet');
insert into Medicion_co2 values (208, to_date('10-02-2026','dd-mm-yyyy'), 195.00, 'Alta', 'Diesel', 'NOx', 2, 'Bogota', 'Chevrolet');
insert into Medicion_co2 values (209, to_date('15-02-2026','dd-mm-yyyy'), 198.00, 'Alta', 'Diesel', 'NOx', 2, 'Bogota', 'Chevrolet');
insert into Medicion_co2 values (210, to_date('25-02-2026','dd-mm-yyyy'), 110.00, 'Media', 'Diesel', 'NOx', 2, 'Bogota', 'Chevrolet');
insert into Medicion_co2 values (211, to_date('05-03-2026','dd-mm-yyyy'), 105.00, 'Media', 'Diesel', 'NOx', 2, 'Bogota', 'Chevrolet');
insert into Medicion_co2 values (212, to_date('10-03-2026','dd-mm-yyyy'), 108.00, 'Media', 'Diesel', 'NOx', 2, 'Bogota', 'Chevrolet');
commit;


INSERT INTO Mantenimiento VALUES (1, 'Cambio de aceite', TO_DATE('15-01-2026','DD-MM-YYYY'), 150000);
INSERT INTO Mantenimiento VALUES (2, 'Revision de frenos', TO_DATE('20-02-2026','DD-MM-YYYY'), 220000);
INSERT INTO Mantenimiento VALUES (3, 'Cambio de llantas', TO_DATE('10-03-2026','DD-MM-YYYY'), 850000);
INSERT INTO Mantenimiento VALUES (4, 'Alineacion', TO_DATE('05-04-2026','DD-MM-YYYY'), 90000);
INSERT INTO Mantenimiento VALUES (5, 'Balanceo', TO_DATE('05-04-2026','DD-MM-YYYY'), 60000);
INSERT INTO Mantenimiento VALUES (6, 'Cambio de bateria', TO_DATE('12-05-2026','DD-MM-YYYY'), 400000);
INSERT INTO Mantenimiento VALUES (7, 'Revision electrica', TO_DATE('13-05-2026','DD-MM-YYYY'), 120000);
INSERT INTO Mantenimiento VALUES (8, 'Cambio de filtros', TO_DATE('14-05-2026','DD-MM-YYYY'), 80000);
INSERT INTO Mantenimiento VALUES (9, 'Lavado de motor', TO_DATE('15-05-2026','DD-MM-YYYY'), 70000);
INSERT INTO Mantenimiento VALUES (10, 'Revision de suspension', TO_DATE('16-05-2026','DD-MM-YYYY'), 250000);
INSERT INTO Mantenimiento VALUES (11, 'Cambio de bujias', TO_DATE('17-05-2026','DD-MM-YYYY'), 130000);
INSERT INTO Mantenimiento VALUES (12, 'Revision de luces', TO_DATE('18-05-2026','DD-MM-YYYY'), 50000);
INSERT INTO Mantenimiento VALUES (13, 'Cambio de radiador', TO_DATE('19-05-2026','DD-MM-YYYY'), 600000);
INSERT INTO Mantenimiento VALUES (14, 'Mantenimiento preventivo', TO_DATE('20-05-2026','DD-MM-YYYY'), 300000);
INSERT INTO Mantenimiento VALUES (15, 'Mantenimiento correctivo', TO_DATE('20-05-2026','DD-MM-YYYY'), 1200000);

INSERT INTO Ciudades VALUES (1, 'Cali');
INSERT INTO Ciudades VALUES (2, 'Bogota');
INSERT INTO Ciudades VALUES (3, 'Medellin');
INSERT INTO Ciudades VALUES (4, 'Barranquilla');
INSERT INTO Ciudades VALUES (5, 'Cartagena');

INSERT INTO Propietarios VALUES (1, 'Juan Perez', 'Gasolina', 'CO2');
INSERT INTO Propietarios VALUES (2, 'Maria Gomez', 'Diesel', 'NOx');
INSERT INTO Propietarios VALUES (3, 'Carlos Ruiz', 'Electrico', 'Bajas emisiones');

INSERT INTO Normas_Ambientales VALUES (1, 'Buena', 'Controlados', 'Apta', 110.00, 1);
INSERT INTO Normas_Ambientales VALUES (2, 'Moderada', 'Reciclaje active', 'Apta', 140.00, 2);
INSERT INTO Normas_Ambientales VALUES (3, 'Buena', 'Tratamiento especial', 'Apta', 120.00, 3);
INSERT INTO Normas_Ambientales VALUES (4, 'Regular', 'Controlados', 'En revision', 170.00, 4);
INSERT INTO Normas_Ambientales VALUES (5, 'Excelente', 'Reciclaje completo', 'Apta', 75.00, 5);

INSERT INTO Vehiculos VALUES (1, 'Toyota', 1, 1);
INSERT INTO Vehiculos VALUES (2, 'Chevrolet', 2, 2);
INSERT INTO Vehiculos VALUES (3, 'Mazda', 3, 1);
INSERT INTO Vehiculos VALUES (4, 'Renault', 4, 3);
INSERT INTO Vehiculos VALUES (5, 'Kia', 5, 2);
INSERT INTO Vehiculos VALUES (6, 'Ford', 1, 1);
INSERT INTO Vehiculos VALUES (7, 'Nissan', 2, 3);
INSERT INTO Vehiculos VALUES (8, 'Hyundai', 3, 2);
INSERT INTO Vehiculos VALUES (9, 'BMW', 4, 1);
INSERT INTO Vehiculos VALUES (10, 'Tesla', 5, 3);

INSERT INTO Tipo_vehiculo VALUES (1, 'Automovil', 1, 1, 1);
INSERT INTO Tipo_vehiculo VALUES (2, 'Camioneta', 2, 2, 2);
INSERT INTO Tipo_vehiculo VALUES (3, 'Motocicleta', 1, 3, 3);
INSERT INTO Tipo_vehiculo VALUES (4, 'Bus', 3, 4, 4);


BEGIN
    FOR i IN 1..50 LOOP
        INSERT INTO Medicion_co2 VALUES (i, TO_DATE('12-02-2026','DD-MM-YYYY'), 75.00 + i, 'Baja', 'Gasolina', 'CO2', 1, 'Cali', 'Mazda');
        INSERT INTO Medicion_co2 VALUES (i+50, TO_DATE('18-05-2026','DD-MM-YYYY'), 160.00 + i, 'Alta', 'Diesel', 'NOx', 2, 'Bogota', 'Chevrolet');
    END LOOP;
    COMMIT;
END;
/


MERGE INTO Medicion_co2 destino
USING (
    SELECT 101 AS id_nuevo, TO_DATE('20-05-2026','DD-MM-YYYY') AS fecha_nueva, 145.00 AS co2_nuevo,
           'Alta' AS cal_nueva, 'Gasolina' AS mot_nuevo, 'CO2' AS comp_nuevo, 1 AS mant_id,
           'Cali' AS ciu_nueva, 'Mazda' AS mrc_nueva FROM DUAL
) origen
ON (destino.ID_mantenimiento = origen.mant_id AND destino.fecha = origen.fecha_nueva)
WHEN MATCHED THEN
    UPDATE SET 
        destino.calidad_humo = origen.cal_nueva,
        destino.tipo_motor   = origen.mot_nuevo,
        destino.compuestos   = origen.comp_nuevo,
        destino.ciudad       = origen.ciu_nueva,
        destino.marca_carro  = origen.mrc_nueva,
        destino.valor_co2    = origen.co2_nuevo
WHEN NOT MATCHED THEN
    INSERT (ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro)
    VALUES (origen.id_nuevo, origen.fecha_nueva, origen.co2_nuevo, origen.cal_nueva, origen.mot_nuevo, origen.comp_nuevo, origen.mant_id, origen.ciu_nueva, origen.mrc_nueva);
COMMIT;

-- En esta parte se comienza a hacer lo del multicondicional INSERT ALL
CREATE TABLE medicion_baja AS SELECT * FROM Medicion_co2 WHERE 1=0;
CREATE TABLE medicion_media AS SELECT * FROM Medicion_co2 WHERE 1=0;
CREATE TABLE medicion_alta AS SELECT * FROM Medicion_co2 WHERE 1=0;

INSERT ALL
   WHEN (valor_co2 < 100) THEN 
      INTO medicion_baja (ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro)
      VALUES (ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro)
   WHEN (valor_co2 BETWEEN 100 AND 200) THEN 
      INTO medicion_media (ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro)
      VALUES (ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro)
   WHEN (valor_co2 > 200) THEN 
      INTO medicion_alta (ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro)
      VALUES (ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro)
SELECT ID_medicion_co2, fecha, valor_co2, calidad_humo, tipo_motor, compuestos, ID_mantenimiento, ciudad, marca_carro FROM Medicion_co2;
COMMIT;
