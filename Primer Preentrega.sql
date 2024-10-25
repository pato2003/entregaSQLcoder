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
legajo_profesor int primary key,
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

