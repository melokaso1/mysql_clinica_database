-- consulta 1
SELECT 
    Trabajadores.id_trabajador,
    CONCAT(Trabajadores.nombre, ' ', Trabajadores.apellidos) AS medico,
    Trabajadores.especialidad,
    COUNT(Pacientes.id_paciente) AS total_pacientes
FROM Trabajadores

INNER JOIN Pacientes ON Trabajadores.id_trabajador = Pacientes.id_medico_asignado
GROUP BY Trabajadores.id_trabajador, Trabajadores.nombre, Trabajadores.apellidos, Trabajadores.especialidad
ORDER BY total_pacientes DESC;

-- consulta 2

select 
	count(*) as total, 
    tipo_vacacion
from Vacaciones
where tipo_vacacion = 'planificadas'

union 

select 
	count(*) as total,
    tipo_vacacion
from Vacaciones
where tipo_vacacion = 'disfrutadas';

-- consulta 3

SELECT 
    Trabajadores.id_trabajador,
    CONCAT(Trabajadores.nombre, ' ', Trabajadores.apellidos) AS medico,
    Trabajadores.especialidad,
    SUM(TIMESTAMPDIFF(HOUR, Horarios.hora_inicio, Horarios.hora_fin)) AS horas_semanales
FROM Trabajadores
INNER JOIN Horarios ON Trabajadores.id_trabajador = Horarios.id_medico
GROUP BY Trabajadores.id_trabajador, Trabajadores.nombre, Trabajadores.apellidos, Trabajadores.especialidad
ORDER BY horas_semanales DESC;

-- consultas 4

SELECT 
    Trabajadores.id_trabajador,
    CONCAT(Trabajadores.nombre, ' ', Trabajadores.apellidos) AS medico_sustituto,
    COUNT(Sustituciones.id_sustitucion) AS total_sustituciones
FROM Trabajadores
LEFT JOIN Sustituciones ON Trabajadores.id_trabajador = Sustituciones.id_medico_sustituto
WHERE Trabajadores.tipo_empleado = 'sustituto'
GROUP BY Trabajadores.id_trabajador, Trabajadores.nombre, Trabajadores.apellidos
ORDER BY total_sustituciones DESC;

-- consultas 5

SELECT COUNT(DISTINCT Sustituciones.id_medico_sustituto) AS medicos_sustituyendo_ahora
FROM Sustituciones
WHERE CURDATE() BETWEEN Sustituciones.fecha_inicio AND Sustituciones.fecha_fin;

-- consulta 6

SELECT 
    Trabajadores.id_trabajador,
    CONCAT(Trabajadores.nombre, ' ', Trabajadores.apellidos) AS medico,
    Horarios.dia_semana,
    TIMESTAMPDIFF(HOUR, Horarios.hora_inicio, Horarios.hora_fin) AS horas_consulta
FROM Trabajadores
INNER JOIN Horarios ON Trabajadores.id_trabajador = Horarios.id_medico
ORDER BY Trabajadores.id_trabajador, 
    FIELD(Horarios.dia_semana, 'lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado', 'domingo');
    
-- consulta 7

SELECT 
    Trabajadores.id_trabajador,
    CONCAT(Trabajadores.nombre, ' ', Trabajadores.apellidos) AS medico,
    Trabajadores.especialidad,
    COUNT(Pacientes.id_paciente) AS total_pacientes
FROM Trabajadores
INNER JOIN Pacientes  ON Trabajadores.id_trabajador = Pacientes.id_medico_asignado
GROUP BY Trabajadores.id_trabajador, Trabajadores.nombre, Trabajadores.apellidos, Trabajadores.especialidad
ORDER BY total_pacientes DESC
LIMIT 1;