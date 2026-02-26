DELIMITER $$
CREATE PROCEDURE sp_persona_insertar(
    IN v_cod_persona VARCHAR(6),
    IN v_nombres VARCHAR(50),
    IN v_apellidos VARCHAR(50),
    IN v_telefono VARCHAR(20)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO bitacora_errores(nombre_rutina, tabla_afectada, codigo_error, detalle_error)
        VALUES ('sp_persona_insertar', 'personas', 100, 'Fallo al insertar registro de persona');
    END;
    INSERT INTO personas(cod_persona, nombres, apellidos, tel_contacto)
    VALUES (v_cod_persona, v_nombres, v_apellidos, v_telefono);
END$$
DELIMITER ;

CREATE PROCEDURE sp_persona_listar()
SELECT * FROM personas;

DELIMITER $$
CREATE PROCEDURE sp_persona_actualizar(
    IN v_id INT,
    IN v_nombres VARCHAR(50)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO bitacora_errores(nombre_rutina, tabla_afectada, codigo_error, detalle_error)
        VALUES ('sp_persona_actualizar', 'personas', 200, 'Fallo al actualizar persona');
    END;
    UPDATE personas SET nombres = v_nombres WHERE id = v_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_persona_eliminar(
    IN v_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO bitacora_errores(nombre_rutina, tabla_afectada, codigo_error, detalle_error)
        VALUES ('sp_persona_eliminar', 'personas', 300, 'Fallo al eliminar persona');
    END;
    DELETE FROM personas WHERE id = v_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_turno_insertar(
    IN v_cod_turno VARCHAR(6),
    IN v_fecha DATE,
    IN v_id_persona INT,
    IN v_id_profesional INT,
    IN v_id_sede INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO bitacora_errores(nombre_rutina, tabla_afectada, codigo_error, detalle_error)
        VALUES ('sp_turno_insertar','turnos',100,'Fallo al registrar turno');
    END;
    INSERT INTO turnos(cod_turno, fecha_turno, id_persona, id_profesional, id_sede)
    VALUES (v_cod_turno, v_fecha, v_id_persona, v_id_profesional, v_id_sede);
END$$
DELIMITER ;

CREATE PROCEDURE sp_turno_listar()
SELECT 
    t.cod_turno,
    t.fecha_turno,
    per.nombres,
    per.apellidos,
    prof.nombre_profesional,
    s.nombre_sede
FROM turnos t
JOIN personas per ON t.id_persona = per.id
JOIN profesionales prof ON t.id_profesional = prof.id
JOIN sedes_atencion s ON t.id_sede = s.id;

DELIMITER $$
CREATE PROCEDURE sp_turno_actualizar(
    IN v_id INT,
    IN v_fecha DATE,
    IN v_id_persona INT,
    IN v_id_profesional INT,
    IN v_id_sede INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO bitacora_errores(nombre_rutina, tabla_afectada, codigo_error, detalle_error)
        VALUES ('sp_turno_actualizar','turnos',200,'Fallo al actualizar turno');
    END;
    UPDATE turnos
    SET fecha_turno = v_fecha,
        id_persona = v_id_persona,
        id_profesional = v_id_profesional,
        id_sede = v_id_sede
    WHERE id = v_id;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_turno_eliminar(
    IN v_id INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        INSERT INTO bitacora_errores(nombre_rutina, tabla_afectada, codigo_error, detalle_error)
        VALUES ('sp_turno_eliminar','turnos',300,'Fallo al eliminar turno');
    END;
    DELETE FROM turnos WHERE id = v_id;
END$$
DELIMITER ;

CREATE FUNCTION fn_total_profesionales_por_area(p_area_id INT)
RETURNS INT
DETERMINISTIC
RETURN (
    SELECT COUNT(*) FROM profesionales WHERE id_area = p_area_id
);

CREATE FUNCTION fn_total_personas_por_profesional(p_profesional_id INT)
RETURNS INT
DETERMINISTIC
RETURN (
    SELECT COUNT(DISTINCT id_persona) FROM turnos WHERE id_profesional = p_profesional_id
);

CREATE FUNCTION fn_total_personas_por_sede(p_sede_id INT)
RETURNS INT
DETERMINISTIC
RETURN (
    SELECT COUNT(DISTINCT id_persona) FROM turnos WHERE id_sede = p_sede_id
);
