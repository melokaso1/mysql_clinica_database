CREATE DATABASE IF NOT EXISTS MediSistema;
USE MediSistema;
CREATE TABLE Trabajadores (
    id_trabajador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    tipo_empleado ENUM('titular', 'interino', 'sustituto', 'ATS', 'auxiliar_enfermeria', 'celador', 'administrativo') NOT NULL,
    especialidad VARCHAR(100) NULL,
    fecha_alta DATE NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE Pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(200),
    id_medico_asignado INT NOT NULL,
    FOREIGN KEY (id_medico_asignado) REFERENCES Trabajadores(id_trabajador)
);


CREATE TABLE Horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    id_medico INT NOT NULL,
    dia_semana ENUM('lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado', 'domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES Trabajadores(id_trabajador)
);


CREATE TABLE Sustituciones (
    id_sustitucion INT PRIMARY KEY AUTO_INCREMENT,
    id_medico_titular INT NOT NULL,
    id_medico_sustituto INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo VARCHAR(200),
    FOREIGN KEY (id_medico_titular) REFERENCES Trabajadores(id_trabajador),
    FOREIGN KEY (id_medico_sustituto) REFERENCES Trabajadores(id_trabajador)
);


CREATE TABLE Vacaciones (
    id_vacacion INT PRIMARY KEY AUTO_INCREMENT,
    id_trabajador INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tipo_vacacion ENUM('planificadas', 'disfrutadas') NOT NULL,
    dias_totales INT NOT NULL,
    FOREIGN KEY (id_trabajador) REFERENCES Trabajadores(id_trabajador)
);