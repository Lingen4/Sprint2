SELECT apellido1, apellido2, nombre FROM persona WHERE persona.tipo = 'Alumno' ORDER BY apellido1,apellido2,nombre;
SELECT nombre, apellido1, apellido2  FROM persona WHERE persona.telefono IS NULL AND persona.tipo = 'Alumno';
SELECT * from persona WHERE persona.tipo = 'Alumno' AND persona.fecha_nacimiento LIKE '%1999%';
SELECT * FROM persona WHERE persona.telefono IS NULL AND persona.tipo = 'Profesor' AND persona.nif LIKE "%K";
SELECT * FROM asignatura INNER JOIN grado ON asignatura.id_grado = grado.id WHERE asignatura.cuatrimestre = '1' AND asignatura.curso = '3' AND grado.id = '7';
SELECT persona.apellido1,persona.apellido2, persona.nombre, departamento.nombre from persona INNER JOIN profesor ON persona.id = profesor.id_profesor INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY persona.apellido1;
SELECT asignatura.nombre, curso_escolar.* FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';
SELECT departamento.nombre,COUNT(departamento.id) AS 'Asignaturas con profesor' FROM departamento RIGHT JOIN profesor ON profesor.id_departamento = departamento.id INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.id = '4';
SELECT persona.*, COUNT(alumno_se_matricula_asignatura.id_asignatura) AS 'Asignaturas matriculadas curso 2018-2019' FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.id = '5' GROUP BY persona.id;
-- LEFT JOIN / RIGHT JOIN
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN persona ON persona.id = profesor.id_profesor ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT departamento.nombre AS 'Departamento', persona.apellido1, persona.apellido2, persona.nombre FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento RIGHT JOIN persona ON persona.id = profesor.id_profesor WHERE departamento.nombre IS NULL ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN persona ON persona.id = profesor.id_profesor WHERE persona.apellido1 IS NULL ORDER BY departamento.nombre;
SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.tipo FROM persona RIGHT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL GROUP BY persona.apellido1;