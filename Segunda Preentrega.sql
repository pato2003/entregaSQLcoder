/*           Primer Preentrega              */

drop schema if exists universidad;

create schema if not exists universidad;

use universidad;



create table if not exists facultad
(
id_facultad int auto_increment primary key,
nombre varchar (255) not null,
direccion varchar (255) not null,
telefono int
);


create table if not exists aula
(
id_aula int auto_increment primary key, 
id_facultad int not null,
nombre varchar (255) not null,
ubicacion varchar (255) not null,
capacidad int,
foreign key (id_facultad) references facultad(id_facultad)
);




create table if not exists profesores
(
legajo_profesor int auto_increment primary key,
nombre varchar (255) not null,
apellido varchar (255) not null,
email varchar (255)

);



create table if not exists profesores_facultades
(
legajo_profesor int not null,
id_facultad int not null,
foreign key (id_facultad) references facultad(id_facultad),
foreign key (legajo_profesor) references profesores(legajo_profesor)
);



create table if not exists materias
(
id_materia int auto_increment primary key,
nombre varchar (255) not null

);



create table if not exists alumnos
(
legajo_alumno int primary key,
nombre varchar (255) not null,
apellido varchar (255) not null,
fecha_nac date not null
);



create table if not exists profesores_materias
(
legajo_profesor int not null,
id_materia int not null,
foreign key (id_materia) references materias(id_materia),
foreign key (legajo_profesor) references profesores(legajo_profesor)
);



create table if not exists materias_alumnos
(
legajo_alumno int not null,
id_materia int not null,
foreign key (id_materia) references materias(id_materia),
foreign key (legajo_alumno) references alumnos(legajo_alumno)
);

create table if not exists profesores_alumnos
(
legajo_profesor int not null,
legajo_alumno int not null,
foreign key (legajo_alumno) references alumnos(legajo_alumno),
foreign key (legajo_profesor) references profesores(legajo_profesor)
);





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
    
    
CREATE OR REPLACE VIEW cant_alumnos_facultad_vw AS
	(select f.nombre, f.direccion, count(*) as cant_alumnos, f.telefono
	from profesores_facultades pyf
	left join facultad f on (pyf.id_facultad=f.id_facultad)
    left join profesores_alumnos pya on (pyf.legajo_profesor = pya.legajo_profesor)
	group by f.id_facultad);

select * from cant_alumnos_facultad_vw;


CREATE OR REPLACE VIEW cant_materias_alumno_vw AS
	(select a.legajo_alumno, a.nombre, a.apellido, count(*) as cant_materias
	from materias_alumnos mya
	inner join alumnos a on (a.legajo_alumno = mya.legajo_alumno)
	group by a.legajo_alumno);
    
select * from cant_materias_alumno_vw;



CREATE OR REPLACE VIEW cant_aulas_facultad_vw AS
	(select f.nombre, f.direccion, count(*) as cant_aulas
	from facultad f
	inner join aula a on (a.id_facultad = f.id_facultad)
	group by f.id_facultad);
    
select * from cant_aulas_facultad_vw;

CREATE OR REPLACE VIEW info_facultades_vw AS
	(select f.nombre, cauf.cant_aulas, calf.cant_alumnos, cpf.cant_profesores
	from facultad f
	left join cant_aulas_facultad_vw cauf on (f.nombre = cauf.nombre)
    left join cant_alumnos_facultad_vw calf on (f.nombre = calf.nombre)
    left join cant_profesores_facultad_vw cpf on (f.nombre = cpf.nombre));
    
select * from info_facultades_vw;
    

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

call inscribir_alumno ('Victoria', 'Freires', '1999-9-8');



/*-----------CREACION DE TRIGGERS------------*/

CREATE TABLE log_alumnos (
  log_id int not null auto_increment primary key, 
  legajo_alumno int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  fecha_nac date NOT NULL,
  fecha datetime not null,
  accion varchar(50) not null
)

CREATE TABLE log_profesores (
  log_id int not null auto_increment primary key, 
  legajo_profesor int NOT NULL,
  nombre varchar(255) NOT NULL,
  apellido varchar(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  fecha datetime not null,
  accion varchar(50) not null
)


DELIMITER //
CREATE TRIGGER log_insertar_alumno
AFTER INSERT ON alumnos
FOR EACH ROW 
BEGIN
	INSERT INTO log_alumnos (legajo_alumno, nombre, apellido, fecha_nac, fecha, accion)
    VALUES (NEW.legajo_alumno, NEW.nombre, NEW.apellido, NEW.fecha_nac, NOW(), 'INSERT');

END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER log_insertar_profesor
AFTER INSERT ON profesores
FOR EACH ROW 
BEGIN
	INSERT INTO log_profesores (legajo_profesor, nombre, apellido, email, fecha, accion)
    VALUES (NEW.legajo_profesor, NEW.nombre, NEW.apellido, NEW.email, NOW(), 'INSERT');

END //
DELIMITER ;

/*PRUEBA DE LOS TRIGGERS*/
INSERT INTO alumnos(nombre, apellido, fecha_nac) VALUES ('Martin', 'Ferraro', '1999-7-1');                
SELECT * FROM log_alumnos;

INSERT INTO profesores(nombre, apellido, email) VALUES ('Profesor', 'Prueba', 'profesor@prueba.com');                
SELECT * FROM log_profesores;





