drop database if exists db_sistema_notas;

create database if not exists db_sistema_notas;

use db_sistema_notas;

create table permissions (
	id INT primary key auto_increment,
	name VARCHAR(100) not null,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW()
);

create table user_groups (
	id INT primary key auto_increment,
	name VARCHAR(100) not null,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW()
);

create table group_permissions (
	id INT primary key auto_increment,
	id_user_group INT not null,
	id_permission INT not null,
	status tinyint default 1,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW(),
	foreign key (id_user_group) references user_groups(id),
	foreign key (id_permission) references permissions(id)
);

create table users (
	id INT primary key auto_increment,
	username VARCHAR(255) not null,
	password VARCHAR(255) not null,
	nombres VARCHAR(255) not null,
	apellidos VARCHAR(255) not null,
	imagen VARCHAR(255) not null,
	carnet VARCHAR(10) not null,
	id_user_group INT not null,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW(),
	foreign key (id_user_group) references user_groups(id)
);

create table asignaturas (
	id INT primary key auto_increment,
	name VARCHAR(100) not null,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW()
);

create table asignaturas_docentes (
	id INT primary key auto_increment,
	id_asignatura INT not null,
	id_user_docente INT not null,
	ciclo VARCHAR(1) not null,
	year INT not null,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW(),
	foreign key (id_asignatura) references asignaturas(id),
	foreign key (id_user_docente) references users(id)
);

create table matriculas (
	id INT primary key auto_increment,
	id_asignatura INT not null,
	id_user_estudiante INT not null,
	ciclo VARCHAR(1) not null,
	year INT not null,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW(),
	foreign key (id_asignatura) references asignaturas(id),
	foreign key (id_user_estudiante) references users(id)
);

create table computos (
	id INT primary key auto_increment,
	fecha_inicio DATE null,
	fecha_fin DATE null,
	id_asignatura INT not null,
	id_user_docente INT not null,
	ciclo VARCHAR(1) not null,
	year INT not null,
	created_at DATETIME default NOW(),
	updated_at DATETIME default NOW(),
	foreign key (id_asignatura) references asignaturas(id),
	foreign key (id_user_docente) references users(id)
);


