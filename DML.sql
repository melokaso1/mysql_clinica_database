INSERT INTO personas (cod_persona, nombres, apellidos, tel_contacto) VALUES
('PX104','Maria','Lopez','600-444'),
('PX105','Carlos','Gomez','600-555'),
('PX106','Luisa','Fernandez','600-666'),
('PX107','Pedro','Martinez','600-777'),
('PX108','Sofia','Ramirez','600-888');

INSERT INTO sedes_atencion (cod_sede, nombre_sede, direccion_sede) VALUES
('SD03','Clínica Sur','Cra 15 #20-30'),
('SD04','Centro Docente','Calle 45 #30-20');

INSERT INTO facultades_academicas (cod_facultad, nombre_facultad, nombre_decano) VALUES
('FC03','Odontología','Dra. Salazar'),
('FC04','Enfermería','Dra. Molina');

INSERT INTO areas_clinicas (cod_area, nombre_area) VALUES
('AR04','Pediatría'),
('AR05','Dermatología'),
('AR06','Neurología');

INSERT INTO profesionales (cod_profesional, nombre_profesional, id_area, id_facultad) VALUES
('PR40','Dr. Morales', 4, 3),
('PR50','Dra. Pineda', 5, 4),
('PR60','Dr. Castaño', 6, 2);

INSERT INTO catalogo_diagnosticos (cod_diag, descripcion_diag) VALUES
('DG05','Hipertensión'),
('DG06','Dermatitis'),
('DG07','Asma'),
('DG08','Otitis');

INSERT INTO catalogo_medicamentos (cod_medicamento, nombre_medicamento) VALUES
('MD06','Losartán'),
('MD07','Salbutamol'),
('MD08','Cetirizina'),
('MD09','Amoxiclav'),
('MD10','Loratadina');

INSERT INTO turnos (cod_turno, fecha_turno, id_persona, id_profesional, id_sede) VALUES
('T-005','2024-05-16', 4, 1, 1),
('T-006','2024-05-17', 5, 2, 2),
('T-007','2024-05-18', 6, 3, 2),
('T-008','2024-05-19', 7, 4, 3),
('T-009','2024-05-20', 8, 5, 3),
('T-010','2024-05-21', 1, 6, 4);

INSERT INTO turno_diagnostico (id_turno, cod_turno, id_diagnostico) VALUES
(5, 'T-005', 5),
(6, 'T-006', 6),
(7, 'T-007', 7),
(8, 'T-008', 8),
(9, 'T-009', 1),
(10,'T-010', 2);

INSERT INTO turno_medicamento (id_turno, cod_turno, id_medicamento, dosis) VALUES
(5, 'T-005', 6, '50mg'),
(6, 'T-006', 8, '10mg'),
(7, 'T-007', 7, '2puff'),
(8, 'T-008', 9, '875mg'),
(9, 'T-009', 10, '10mg'),
(10,'T-010', 1, '500mg');
