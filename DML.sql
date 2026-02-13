INSERT INTO Trabajadores (nombre, apellidos, tipo_empleado, especialidad, fecha_alta) VALUES
('Carlos', 'García Pérez', 'titular', 'Medicina General', '2020-01-15'),
('Ana', 'Martínez López', 'titular', 'Pediatría', '2019-03-20'),
('Luis', 'Rodríguez Sánchez', 'sustituto', 'Medicina General', '2023-06-01'),
('Carmen', 'López Vega', 'ATS', null, '2021-05-10'),
('Javier', 'Muñoz Ortiz', 'auxiliar_enfermeria', null, '2022-02-15'),
('Isabel', 'Sánchez Romero', 'celador', null,'2020-08-20'),
('Jose', 'Peréz Goméz', 'administrativo', null, '2023-08-03');

INSERT INTO Pacientes (nombre, apellidos, fecha_nacimiento, telefono, email, direccion, id_medico_asignado) VALUES
('Juan', 'Pérez Martínez', '1985-04-12', '600123456', 'juan.perez@email.com', 'Calle Mayor 10', 1),
('María', 'González López', '1990-07-23', '600234567', 'maria.gonzalez@email.com', 'Avenida Principal 25', 3),
('Pedro', 'Sánchez Torres', '1978-11-15', '600345678', 'pedro.sanchez@email.com', 'Plaza España 5', 2); 

INSERT INTO Horarios (id_medico, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'lunes', '08:00:00', '14:00:00'),
(1, 'martes', '08:00:00', '14:00:00'),
(1, 'miercoles', '08:00:00', '14:00:00'),
(1, 'jueves', '08:00:00', '14:00:00'),
(1, 'viernes', '08:00:00', '14:00:00'),
(2, 'lunes', '09:00:00', '15:00:00'),
(2, 'martes', '09:00:00', '15:00:00'),
(2, 'miercoles', '09:00:00', '15:00:00'),
(2, 'jueves', '09:00:00', '15:00:00'),
(2, 'viernes', '09:00:00', '13:00:00'),
(3, 'lunes', '15:00:00', '21:00:00'),
(3, 'miercoles', '15:00:00', '21:00:00'),
(3, 'viernes', '15:00:00', '21:00:00');

INSERT INTO Sustituciones (id_medico_titular, id_medico_sustituto, fecha_inicio, fecha_fin, motivo) VALUES
(1, 3, '2025-12-15', '2025-12-31', 'Vacaciones');

INSERT INTO Vacaciones (id_trabajador, fecha_inicio, fecha_fin, tipo_vacacion, dias_totales) VALUES
(1, '2025-12-15', '2025-12-31', 'disfrutadas', 17),
(4, '2025-07-01', '2025-07-15', 'disfrutadas', 15);





