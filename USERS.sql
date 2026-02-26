SELECT user, host FROM mysql.user;

CREATE USER 'adminCentro'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON centro_salud_universitario.* TO 'adminCentro'@'localhost' WITH GRANT OPTION;

CREATE USER 'operadorTurnos'@'localhost' IDENTIFIED BY 'opTurnos123';
REVOKE ALL PRIVILEGES ON *.* FROM 'operadorTurnos'@'localhost';
GRANT SELECT, INSERT, UPDATE ON centro_salud_universitario.personas TO 'operadorTurnos'@'localhost';
GRANT SELECT, INSERT, UPDATE ON centro_salud_universitario.turnos TO 'operadorTurnos'@'localhost';
GRANT SELECT ON centro_salud_universitario.profesionales TO 'operadorTurnos'@'localhost';

CREATE USER 'medicoApp'@'localhost' IDENTIFIED BY 'medico123';
REVOKE ALL PRIVILEGES ON *.* FROM 'medicoApp'@'localhost';
GRANT SELECT ON centro_salud_universitario.personas TO 'medicoApp'@'localhost';
GRANT SELECT ON centro_salud_universitario.turnos TO 'medicoApp'@'localhost';
GRANT SELECT, INSERT ON centro_salud_universitario.turno_diagnostico TO 'medicoApp'@'localhost';
GRANT SELECT, INSERT ON centro_salud_universitario.turno_medicamento TO 'medicoApp'@'localhost';

CREATE USER 'auditorCentro'@'localhost' IDENTIFIED BY 'auditor123';
REVOKE ALL PRIVILEGES ON *.* FROM 'auditorCentro'@'localhost';
GRANT SELECT ON centro_salud_universitario.* TO 'auditorCentro'@'localhost';

SHOW GRANTS FOR 'adminCentro'@'localhost';
SHOW GRANTS FOR 'operadorTurnos'@'localhost';
SHOW GRANTS FOR 'medicoApp'@'localhost';
SHOW GRANTS FOR 'auditorCentro'@'localhost';

DROP USER 'auditorCentro'@'localhost';
ALTER USER 'adminCentro'@'localhost' IDENTIFIED BY 'Admin321.';
SET PASSWORD FOR 'medicoApp'@'localhost' = 'Medico321.';
FLUSH PRIVILEGES;

SET @v_persona_id = 1;
PREPARE q_turnos_persona FROM
'SELECT t.cod_turno, t.fecha_turno, s.nombre_sede
 FROM turnos t
 JOIN sedes_atencion s ON t.id_sede = s.id
 WHERE t.id_persona = ?';
EXECUTE q_turnos_persona USING @v_persona_id;
DEALLOCATE PREPARE q_turnos_persona;

SET @v_turno_id = 1;
PREPARE q_meds_turno FROM
'SELECT m.nombre_medicamento, tm.dosis
 FROM turno_medicamento tm
 JOIN catalogo_medicamentos m ON tm.id_medicamento = m.id
 WHERE tm.id_turno = ?';
EXECUTE q_meds_turno USING @v_turno_id;
DEALLOCATE PREPARE q_meds_turno;
