-- Acá se crean las tablas
CREATE TABLE Tipo_combustible (
    ID_tipo_combustible NUMBER PRIMARY KEY,
    tipo_combustible VARCHAR2(50)
);

CREATE TABLE Mantenimiento (
    ID_mantenimiento NUMBER PRIMARY KEY,
    tipo_mantenimiento VARCHAR2(100),
    fecha_mantenimiento DATE DEFAULT TRUNC(SYSDATE),
    costo NUMBER(12,2) DEFAULT 300000              
);

CREATE TABLE Ciudades (
    ID_ciudades NUMBER PRIMARY KEY,
    nombre_ciudad VARCHAR2(100)
);

CREATE TABLE Propietarios (
    ID_propietarios NUMBER PRIMARY KEY,
    nombre_propietario VARCHAR2(100),
    tipo_motor VARCHAR2(100),
    compuestos VARCHAR2(100)
);

CREATE TABLE Normas_Ambientales (
    ID_normas_ambientales NUMBER PRIMARY KEY,
    calidad_aire VARCHAR2(100),
    residuos VARCHAR2(100),
    agua_potable VARCHAR2(100),
    co2_max_permitido NUMBER(6,2) DEFAULT 160.00,
    ID_ciudades NUMBER
);

CREATE TABLE Vehiculos (
    ID_vehiculos NUMBER PRIMARY KEY,
    marca VARCHAR2(100),
    ID_normas_ambientales NUMBER,
    ID_propietarios NUMBER
);

CREATE TABLE Tipo_vehiculo (
    ID_tipo_vehiculo NUMBER PRIMARY KEY,
    descripcion VARCHAR2(100),
    ID_tipo_combustible NUMBER,
    ID_mantenimiento NUMBER,
    ID_vehiculos NUMBER
);

CREATE TABLE Medicion_co2 (
    ID_medicion_co2 NUMBER,
    fecha DATE NOT NULL,                         
    valor_co2 NUMBER(6,2) NOT NULL,              
    calidad_humo VARCHAR2(100),
    tipo_motor VARCHAR2(100),
    compuestos VARCHAR2(100),
    ID_mantenimiento NUMBER,
    ciudad VARCHAR2(50),
    marca_carro VARCHAR2(50),
    CONSTRAINT pk_medicion_co2 PRIMARY KEY (ID_medicion_co2, fecha)
)
PARTITION BY RANGE (fecha) (
    PARTITION p_2026_q1 VALUES LESS THAN (TO_DATE('01-04-2026', 'DD-MM-YYYY')),
    PARTITION p_2026_q2 VALUES LESS THAN (TO_DATE('01-07-2026', 'DD-MM-YYYY')),
    PARTITION p_2026_q3 VALUES LESS THAN (TO_DATE('01-10-2026', 'DD-MM-YYYY')),
    PARTITION p_2026_q4 VALUES LESS THAN (TO_DATE('01-01-2027', 'DD-MM-YYYY')),
    PARTITION p_futuro VALUES LESS THAN (MAXVALUE)
);

--Acá se hace la creación de las secuancias
CREATE SEQUENCE seq_combustible START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_mantenimiento START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_ciudades START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_propietarios START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_normas_ambientales START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_vehiculos START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_tipo_vehiculo START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_medicion_co2 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_tipo_combustible START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- En sta parte se crean las llaves foraneas
ALTER TABLE Tipo_vehiculo ADD CONSTRAINT FK_tipo_combustible FOREIGN KEY (ID_tipo_combustible) REFERENCES Tipo_combustible(ID_tipo_combustible);
ALTER TABLE Tipo_vehiculo ADD CONSTRAINT FK_mantenimiento FOREIGN KEY (ID_mantenimiento) REFERENCES Mantenimiento(ID_mantenimiento);
ALTER TABLE Tipo_vehiculo ADD CONSTRAINT FK_vehiculos FOREIGN KEY (ID_vehiculos) REFERENCES Vehiculos(ID_vehiculos);
ALTER TABLE Normas_Ambientales ADD CONSTRAINT FK_ID_ciudades FOREIGN KEY (ID_ciudades) REFERENCES Ciudades(ID_ciudades);
ALTER TABLE Vehiculos ADD CONSTRAINT FK_ID_normas_ambientales FOREIGN KEY (ID_normas_ambientales) REFERENCES Normas_Ambientales(ID_normas_ambientales);
ALTER TABLE Vehiculos ADD CONSTRAINT FK_ID_propietarios FOREIGN KEY (ID_propietarios) REFERENCES Propietarios(ID_propietarios);
ALTER TABLE Medicion_co2 ADD CONSTRAINT FK_ID_medicion_co2 FOREIGN KEY (ID_mantenimiento) REFERENCES Mantenimiento(ID_mantenimiento);

-- Acá se crean los indices
CREATE INDEX idx_normas_ciudades ON Normas_Ambientales(ID_ciudades);
CREATE INDEX idx_vehiculos_normas ON Vehiculos(ID_normas_ambientales);
CREATE INDEX idx_medicion_mantenimiento ON Medicion_co2(ID_mantenimiento);
CREATE INDEX idx_tipovehiculo_combustible ON Tipo_vehiculo(ID_tipo_combustible);
CREATE INDEX idx_medicion_fecha_perf ON Medicion_co2(fecha);