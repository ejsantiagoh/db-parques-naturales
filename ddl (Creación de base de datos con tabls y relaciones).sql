create database if not exists parques_naturales;
use parques_naturales;

-- tabla de entidades responsables
create table if not exists entidad_responsable (
    id int auto_increment primary key,
    nombre varchar(255) not null
);

-- tabla de departamentos
create table if not exists departamento (
    id int auto_increment primary key,
    nombre varchar(255) not null,
    id_ent_responsable int not null,
    foreign key (id_ent_responsable) references entidad_responsable(id) on delete cascade
);

-- tabla de parques naturales
create table if not exists parque_natural (
    id int auto_increment primary key,
    nombre varchar(255) not null,
    fecha_declaracion date not null
);

-- tabla intermedia para la relación entre parque y departamento
create table if not exists parque_departamento (
    id_parque int not null,
    id_departamento int not null,
    primary key (id_parque, id_departamento),
    foreign key (id_parque) references parque_natural(id) on delete cascade,
    foreign key (id_departamento) references departamento(id) on delete cascade
);

-- tabla de áreas dentro de un parque
create table if not exists area (
    id int auto_increment primary key,
    nombre varchar(255) not null,
    extension float not null,
    id_parque int not null,
    foreign key (id_parque) references parque_natural(id) on delete cascade
);

-- tabla de especies en cada área
create table if not exists especie (
    id int auto_increment primary key,
    denominacion_cientifica varchar(255) not null,
    denominacion_vulgar varchar(255),
    tipo enum('vegetal', 'animal', 'mineral') not null,
    id_area int not null,
    foreign key (id_area) references area(id) on delete cascade
);

-- tabla general de personal
create table if not exists personal (
    id int auto_increment primary key,
    cedula int unique not null,
    nombre varchar(255) not null,
    direccion varchar(255) not null,
    telefono varchar(20) not null,
    telefono_movil varchar(20),
    sueldo decimal(10,2) not null
);

-- tipos de personal con campos específicos
create table if not exists personal_gestion (
    id int primary key,
    rol varchar(255) not null,
    oficina varchar(255) not null,
    foreign key (id) references personal(id) on delete cascade
);

create table if not exists personal_vigilancia (
    id int primary key,
    rango varchar(255) not null,
    horario_patrulla varchar(255) not null,
    id_area int not null,
    foreign key (id) references personal(id) on delete cascade,
    foreign key (id_area) references area(id) on delete cascade
);

create table if not exists personal_conservacion (
    id int primary key,
    especialidad varchar(255) not null,
    anios_experiencia int not null,
    id_area int not null,
    foreign key (id) references personal(id) on delete cascade,
    foreign key (id_area) references area(id) on delete cascade
);

create table if not exists personal_investigador (
    id int primary key,
    campo_investigacion varchar(255) not null,
    publicaciones int not null,
    foreign key (id) references personal(id) on delete cascade
);

-- tabla de vehículos para el personal de vigilancia
create table if not exists vehiculo_vigilancia (
    id int auto_increment primary key,
    tipo enum('moto', 'automovil', 'camioneta 4x4') not null,
    marca varchar(255) not null,
    id_vigilante int not null,
    foreign key (id_vigilante) references personal_vigilancia(id) on delete cascade
);

-- tabla de proyectos de investigación
create table if not exists proyecto_investigacion (
    id int auto_increment primary key,
    nombre varchar(255) not null,
    presupuesto float not null,
    fecha_inicio date not null,
    fecha_fin date not null
);

-- relación proyecto - especie - investigador
create table if not exists proyecto_especie_investigador (
    id_proyecto int,
    id_especie int,
    id_investigador int,
    primary key (id_proyecto, id_especie, id_investigador),
    foreign key (id_proyecto) references proyecto_investigacion(id) on delete cascade,
    foreign key (id_especie) references especie(id) on delete cascade,
    foreign key (id_investigador) references personal_investigador(id) on delete cascade
);

-- tabla de visitantes
create table if not exists visitante (
    cedula int primary key,
    nombre varchar(255) not null,
    direccion varchar(255) not null,
    profesion varchar(255)
);

-- tabla de registro de entradas de visitantes a parques
create table if not exists registro_entrada (
    id int auto_increment primary key,
    cedula_visitante int not null,
    id_parque int not null,
    fecha_visita date not null,
    id_personal_gestion int not null, 
    foreign key (cedula_visitante) references visitante(cedula) on delete cascade,
    foreign key (id_parque) references parque_natural(id) on delete cascade,
    foreign key (id_personal_gestion) references personal_gestion(id) on delete cascade
);

-- tabla de alojamientos en los parques
create table if not exists alojamiento (
    id int auto_increment primary key,
    nombre varchar(255) not null,
    capacidad int not null,
    categoria enum('sencillo', 'standard', 'premium') not null,
    id_parque int not null,
    foreign key (id_parque) references parque_natural(id) on delete cascade
);

-- tabla de estancia de visitantes en alojamientos
create table if not exists estancia_visitante (
    id int auto_increment primary key,
    cedula_visitante int not null,
    id_alojamiento int not null,
    fecha_entrada date not null,
    fecha_salida date not null,
    foreign key (cedula_visitante) references visitante(cedula) on delete cascade,
    foreign key (id_alojamiento) references alojamiento(id) on delete cascade
);


