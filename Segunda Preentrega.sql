/*--------------Segunda Pre-entrega--------*/


/*La insercion de los datos fue por importacion de tablas con datos creados aleatoriamente para agilizar el proceso de creacion de los datos a cargar*/


/*----------Creacion de Vistas-----------*/

CREATE OR REPLACE VIEW cant_alumnos_profesores_vw AS
	(select p.nombre, p.apellido, count(*) as cant_alumnos, p.email
	from profesores_alumnos pya
	inner join profesores p on (p.legajo_profesor=pya.legajo_profesor)
	group by p.legajo_profesor);
    
select * from cant_alumnos_profesores_vw;
    
CREATE OR REPLACE VIEW cant_profesores_facultad_vw AS
	(select f.nombre, f.direccion, count(*) as cant_profesores, f.telefono
	from profesores_facultades pyf
	inner join facultad f on (pyf.id_facultad=f.id_facultad)
	group by f.id_facultad);
    
select * from cant_profesores_facultad_vw;
    


/*----------Creacion de Funciones-----------*/
delimiter $$
CREATE FUNCTION edad_persona (fecha_nac date)
RETURNS INTEGER
not deterministic
reads sql data
BEGIN
	DECLARE edad INT ;
    SET edad = floor(datediff(now(), fecha_nac)/365);


RETURN edad;
END $$
delimiter ;


select edad_persona('2003-3-20');


delimiter $$
create function cant_materias (legajo int)
returns int
not deterministic
reads sql data
begin
	declare cant_materias int;
	select count(*) into cant_materias
    from materias_alumnos
    where materias_alumnos.legajo_alumno = legajo;
    return cant_materias;
end $$
delimiter ;


select cant_materias (3) as cantidad_materias;




/*----------Creacion de SP-----------*/
DELIMITER //
create procedure lista_alumnos (IN legajo_prof INT)
BEGIN
	SELECT a.*
    FROM profesores_alumnos pya
    JOIN alumnos a ON pya.legajo_alumno = a.legajo_alumno
    WHERE pya.legajo_profesor = 3;
END //
DELIMITER ;


call lista_alumnos(3);

DELIMITER //
create procedure inscribir_alumno (IN nom VARCHAR(255), IN apel VARCHAR(255), IN fecha DATE)
BEGIN
	IF (nom <> '' AND apel <> '') THEN
		INSERT INTO alumnos (nombre, apellido, fecha_nac) values (nom, apel, fecha);
	ELSE 
		SELECT 'ERROR: Los datos ingresados no son validos';
    END IF;
END //
DELIMITER ;

call inscribir_alumno ('Patricio', 'Ferreyra', '2003-3-20');





