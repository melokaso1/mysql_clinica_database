CREATE DATABASE IF NOT EXISTS centro_salud_universitario;
USE centro_salud_universitario;

CREATE TABLE personas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_persona VARCHAR(6) NOT NULL UNIQUE,
    nombres VARCHAR(50),
    apellidos VARCHAR(50),
    tel_contacto VARCHAR(20)
);

CREATE TABLE sedes_atencion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_sede VARCHAR(6) NOT NULL UNIQUE,
    nombre_sede VARCHAR(100),
    direccion_sede VARCHAR(100)
);

CREATE TABLE facultades_academicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_facultad VARCHAR(6) NOT NULL UNIQUE,
    nombre_facultad VARCHAR(50),
    nombre_decano VARCHAR(50)
);

CREATE TABLE areas_clinicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_area VARCHAR(6) NOT NULL UNIQUE,
    nombre_area VARCHAR(50)
);

CREATE TABLE profesionales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_profesional VARCHAR(4) NOT NULL UNIQUE,
    nombre_profesional VARCHAR(50),
    id_area INT,
    id_facultad INT,
    FOREIGN KEY (id_area) REFERENCES areas_clinicas(id),
    FOREIGN KEY (id_facultad) REFERENCES facultades_academicas(id)
);

CREATE TABLE turnos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_turno VARCHAR(6) NOT NULL UNIQUE,
    fecha_turno DATE,
    id_persona INT,
    id_profesional INT,
    id_sede INT,
    FOREIGN KEY (id_persona) REFERENCES personas(id),
    FOREIGN KEY (id_profesional) REFERENCES profesionales(id),
    FOREIGN KEY (id_sede) REFERENCES sedes_atencion(id)
);

CREATE TABLE catalogo_diagnosticos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_diag VARCHAR(6) NOT NULL UNIQUE,
    descripcion_diag VARCHAR(100)
);

CREATE TABLE turno_diagnostico (
    id_turno INT,
    cod_turno VARCHAR(6) NOT NULL,
    id_diagnostico INT,
    PRIMARY KEY (id_turno, id_diagnostico),
    FOREIGN KEY (id_turno) REFERENCES turnos(id),
    FOREIGN KEY (cod_turno) REFERENCES turnos(cod_turno),
    FOREIGN KEY (id_diagnostico) REFERENCES catalogo_diagnosticos(id)
);

CREATE TABLE catalogo_medicamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cod_medicamento VARCHAR(6) NOT NULL UNIQUE,
    nombre_medicamento VARCHAR(50)
);

CREATE TABLE turno_medicamento (
    id_turno INT,
    cod_turno VARCHAR(6) NOT NULL,
    id_medicamento INT,
    dosis VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_turno, id_medicamento),
    FOREIGN KEY (cod_turno) REFERENCES turnos(cod_turno),
    FOREIGN KEY (id_medicamento) REFERENCES catalogo_medicamentos(id),
    FOREIGN KEY (id_turno) REFERENCES turnos(id)
);

CREATE TABLE bitacora_errores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rutina VARCHAR(100),
    tabla_afectada VARCHAR(100),
    codigo_error INT,
    detalle_error TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
