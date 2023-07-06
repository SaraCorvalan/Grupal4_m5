create database tarea4_grupal_M5;
use tarea4_grupal_M5;

create table usuarios (
	id_usuario int not null primary key,
    nombre varchar(15),
    apellido varchar(15),
    contrasena varchar(8),
    zona_horaria varchar(5) default "UTC-3",
    genero int,
    telefono varchar(12)
);
/* genero: 1=masculino, 2=femenino, 3=otro */

create table ingreso_usuarios (
	id_ingreso int auto_increment primary key,
    id_usuario int not null,
    fecha_ingreso datetime default now(),
    CONSTRAINT usuarios_ingreso_fk FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono) value(100, 'Javier', 'Hernández', 'javi#100', 1, '56988888880');
insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono) value(101, 'Eduardo', 'Bermúdez', 'edua#101', 1, '56988888881');
insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono)  value(102, 'Daniela', 'Alvarado', 'dany#102', 2, '56988888882');
insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono)  value(103, 'María Francisca', 'Olmedo', 'fran#103', 3, '56988888883');
insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono)  value(104, 'Cayetana', 'Aránguiz', 'caye#104', 2, '56988888884');
insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono)  value(105, 'Rosario', 'Díaz', 'rosa#105', 2, '56988888885');
insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono)  value(106, 'Benjamín', 'Rodríguez', 'benj#106', 1, '56988888886');
insert into usuarios(id_usuario, nombre, apellido, contrasena, genero, telefono)  value(107, 'Daniel', 'Moyano', 'dani#107', 3, '56988888887');
select * from usuarios;


insert into ingreso_usuarios(id_usuario) value(100);
insert into ingreso_usuarios(id_usuario) value(101);
insert into ingreso_usuarios(id_usuario) value(102);
insert into ingreso_usuarios(id_usuario) value(103);
insert into ingreso_usuarios(id_usuario) value(104);
insert into ingreso_usuarios(id_usuario) value(105);
insert into ingreso_usuarios(id_usuario) value(106);
insert into ingreso_usuarios(id_usuario) value(107);
select * from ingreso_usuarios;

alter table usuarios modify column zona_horaria varchar(5) default "UTC-2";

create table contactos (
	id_contacto int auto_increment primary key,
    id_usuario int not null,
    telefono varchar(12),
    correo varchar(45),
    CONSTRAINT usuarios_contactos_fk FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

/* Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.*/
/*** hacer esto implicaría eliminar los datos de la tabla "usuarios", luego modificar la tabla */
/*** eliminado la primary key actual, en campo id_usuario, y agregandola al campo teléfono del usuario. */
/*** Esto porque el SBD nos exije la aplicación de la "Regla de integridad referencial".  */
/*** Luego podríamos hacer el ALTER TABLE, como se indica a continuación: */
ALTER TABLE contactos ADD CONSTRAINT usuarios_contactos_telefono_fk FOREIGN KEY (telefono) REFERENCES usuarios(telefono);






