-- Procedimientos almacenados:

use parques_naturales;

-- 1. registrar un nuevo parque natural
-- registra un nuevo parque en la base de datos con su nombre y fecha de declaración.

delimiter //
create procedure registrar_parque(
    in p_nombre varchar(255),
    in p_fecha_declaracion date
)
begin
    insert into parque_natural (nombre, fecha_declaracion)
    values (p_nombre, p_fecha_declaracion);
end //
delimiter ;


call registrar_parque('parque nacional sierra verde', '2024-03-06');

-- 2. actualizar datos de un parque
-- permite actualizar el nombre y la fecha de declaración de un parque existente.

delimiter //
create procedure actualizar_parque(
    in p_id int,
    in p_nombre varchar(255),
    in p_fecha_declaracion date
)
begin
    update parque_natural 
    set nombre = p_nombre, fecha_declaracion = p_fecha_declaracion
    where id = p_id;
end //
delimiter ;

call actualizar_parque(1, 'parque nacional sierra azul', '2023-05-12');

-- 3. registrar un área en un parque
-- agrega una nueva área dentro de un parque con su nombre y extensión.

delimiter //
create procedure registrar_area(
    in p_nombre varchar(255),
    in p_extension float,
    in p_id_parque int
)
begin
    insert into area (nombre, extension, id_parque)
    values (p_nombre, p_extension, p_id_parque);
end //
delimiter ;


call registrar_area('zona de protección especial', 150.5, 1);

-- 4. actualizar información de un área
-- modifica los datos de un área específica dentro de un parque.

delimiter //
create procedure actualizar_area(
    in p_id int,
    in p_nombre varchar(255),
    in p_extension float
)
begin
    update area
    set nombre = p_nombre, extension = p_extension
    where id = p_id;
end //
delimiter ;

call actualizar_area(3, 'bosque nuboso', 175.2);

-- 5. registrar una nueva especie en un área
-- registra una especie en un área de un parque natural.

delimiter //
create procedure registrar_especie(
    in p_denominacion_cientifica varchar(255),
    in p_denominacion_vulgar varchar(255),
    in p_tipo enum('vegetal', 'animal', 'mineral'),
    in p_id_area int
)
begin
    insert into especie (denominacion_cientifica, denominacion_vulgar, tipo, id_area)
    values (p_denominacion_cientifica, p_denominacion_vulgar, p_tipo, p_id_area);
end //
delimiter ;


call registrar_especie('felis concolor', 'puma', 'animal', 2);

-- procesamiento de datos de visitantes y asignación de alojamientos.

-- 6. registrar un nuevo visitante
-- este procedimiento almacena la información de un visitante en la base de datos.

delimiter //
create procedure registrar_visitante(
    in p_cedula int,
    in p_nombre varchar(255),
    in p_direccion varchar(255),
    in p_profesion varchar(255)
)
begin
    insert into visitante (cedula, nombre, direccion, profesion)
    values (p_cedula, p_nombre, p_direccion, p_profesion);
end //
delimiter ;

call registrar_visitante(2000100, 'carlos pérez', 'av. siempre viva 123', 'biólogo');

-- 7. actualizar datos de un visitante
-- este procedimiento permite modificar la información de un visitante ya registrado.

delimiter //
create procedure actualizar_visitante(
    in p_cedula int,
    in p_nombre varchar(255),
    in p_direccion varchar(255),
    in p_profesion varchar(255)
)
begin
    update visitante
    set nombre = p_nombre, direccion = p_direccion, profesion = p_profesion
    where cedula = p_cedula;
end //
delimiter ;

call actualizar_visitante(2000100, 'carlos pérez gómez', 'calle 45 #12-56', 'ecólogo');

-- 8. registrar la entrada de un visitante a un parque
-- registra la visita de un visitante a un parque específico.

delimiter //
create procedure registrar_entrada_parque(
    in p_cedula_visitante int,
    in p_id_parque int,
    in p_fecha_visita date,
    in p_id_personal_gestion int
)
begin
    insert into registro_entrada (cedula_visitante, id_parque, fecha_visita, id_personal_gestion)
    values (p_cedula_visitante, p_id_parque, p_fecha_visita, p_id_personal_gestion);
end //
delimiter ;

call registrar_entrada_parque(2000100, 1, '2025-03-10', 40);

-- 9. asignar alojamiento a un visitante
-- asigna un alojamiento a un visitante con la fecha de entrada y salida.

delimiter //
create procedure asignar_alojamiento(
    in p_cedula_visitante int,
    in p_id_alojamiento int,
    in p_fecha_entrada date,
    in p_fecha_salida date
)
begin
    insert into estancia_visitante (cedula_visitante, id_alojamiento, fecha_entrada, fecha_salida)
    values (p_cedula_visitante, p_id_alojamiento, p_fecha_entrada, p_fecha_salida);
end //
delimiter ;

call asignar_alojamiento(2000100, 5, '2025-03-10', '2025-03-15');


-- 10. actualizar fechas de estancia de un visitante en un alojamiento
-- permite modificar la fecha de entrada y salida de un visitante en un alojamiento.

delimiter //
create procedure actualizar_estancia_visitante(
    in p_id_estancia int,
    in p_fecha_entrada date,
    in p_fecha_salida date
)
begin
    update estancia_visitante
    set fecha_entrada = p_fecha_entrada, fecha_salida = p_fecha_salida
    where id = p_id_estancia;
end //
delimiter ;

call actualizar_estancia_visitante(10, '2025-03-12', '2025-03-18');

-- asignación de personal a áreas específicas y registro de actividades.

-- 11. asignar un personal de vigilancia a un área específica
-- este procedimiento asigna un personal de vigilancia a un área determinada.

delimiter //
create procedure asignar_personal_vigilancia(
    in p_id_personal int,
    in p_rango varchar(255),
    in p_horario_patrulla varchar(255),
    in p_id_area int
)
begin
    insert into personal_vigilancia (id, rango, horario_patrulla, id_area)
    values (p_id_personal, p_rango, p_horario_patrulla, p_id_area);
end //
delimiter ;

call asignar_personal_vigilancia(37, 'guardabosques', '06:00-14:00', 3);

-- 12. asignar un personal de conservación a un área específica
-- este procedimiento asigna un personal de conservación con su especialidad y años de experiencia.

delimiter //
create procedure asignar_personal_conservacion(
    in p_id_personal int,
    in p_especialidad varchar(255),
    in p_anios_experiencia int,
    in p_id_area int
)
begin
    insert into personal_conservacion (id, especialidad, anios_experiencia, id_area)
    values (p_id_personal, p_especialidad, p_anios_experiencia, p_id_area);
end //
delimiter ;

call asignar_personal_conservacion(25, 'ecología', 8, 5);

-- 13. registrar una actividad de un personal en un área
-- registra una actividad realizada por un miembro del personal en un área específica.

-- creamos una tabla para guardar la descripción de la actividad realizada.
create table actividad_personal (
    id int auto_increment primary key,
    id_personal int not null,
    id_area int not null,
    descripcion text not null,
    fecha date not null,
    foreign key (id_personal) references personal(id) on delete cascade,
    foreign key (id_area) references area(id) on delete cascade
);

delimiter //
create procedure registrar_actividad_personal(
    in p_id_personal int,
    in p_id_area int,
    in p_descripcion text,
    in p_fecha date
)
begin
    insert into actividad_personal (id_personal, id_area, descripcion, fecha)
    values (p_id_personal, p_id_area, p_descripcion, p_fecha);
end //
delimiter ;


call registrar_actividad_personal(40, 3, 'patrullaje de rutina y monitoreo de fauna', '2025-03-10');


-- 14. actualizar la información de un personal de vigilancia
-- permite modificar los datos de un personal de vigilancia ya asignado.

delimiter //
create procedure actualizar_personal_vigilancia(
    in p_id_personal int,
    in p_rango varchar(255),
    in p_horario_patrulla varchar(255),
    in p_id_area int
)
begin
    update personal_vigilancia
    set rango = p_rango, horario_patrulla = p_horario_patrulla, id_area = p_id_area
    where id = p_id_personal;
end //
delimiter ;

call actualizar_personal_vigilancia(35, 'supervisor', '14:00-22:00', 4);

-- 15. actualizar la asignación de un personal de conservación
-- este procedimiento permite modificar la especialidad, años de experiencia 
-- y el área de un personal de conservación.

delimiter //
create procedure actualizar_personal_conservacion(
    in p_id_personal int,
    in p_especialidad varchar(255),
    in p_anios_experiencia int,
    in p_id_area int
)
begin
    update personal_conservacion
    set especialidad = p_especialidad, anios_experiencia = p_anios_experiencia, id_area = p_id_area
    where id = p_id_personal;
end //
delimiter ;

call actualizar_personal_conservacion(23, 'botánica', 10, 6);

-- gestión automatizada de presupuestos y proyectos de investigación.

-- 16. registrar un nuevo proyecto de investigación
-- inserta un nuevo proyecto con nombre, presupuesto y fechas de inicio y fin.

delimiter //

create procedure registrar_proyecto(
    in nombre_proyecto varchar(255),
    in presupuesto float,
    in fecha_inicio date,
    in fecha_fin date
)
begin
    insert into proyecto_investigacion (nombre, presupuesto, fecha_inicio, fecha_fin)
    values (nombre_proyecto, presupuesto, fecha_inicio, fecha_fin);
end //

delimiter ;

call registrar_proyecto('conservación del jaguar', 150000, '2024-04-01', '2025-03-31');

-- 17. asignar un investigador a un proyecto y una especie
-- registra la relación entre un proyecto, una especie y un investigador.

delimiter //

create procedure asignar_investigador_proyecto(
    in id_proyecto int,
    in id_especie int,
    in id_investigador int
)
begin
    insert into proyecto_especie_investigador (id_proyecto, id_especie, id_investigador)
    values (id_proyecto, id_especie, id_investigador);
end //

delimiter ;

call asignar_investigador_proyecto(1, 10, 5);

-- 18. actualizar el presupuesto de un proyecto
-- modifica el presupuesto de un proyecto existente.

delimiter //

create procedure actualizar_presupuesto_proyecto(
    in id_proyecto int,
    in nuevo_presupuesto float
)
begin
    update proyecto_investigacion
    set presupuesto = nuevo_presupuesto
    where id = id_proyecto;
end //

delimiter ;

call actualizar_presupuesto_proyecto(1, 200000);

-- 19. obtener el presupuesto total de todos los proyectos
-- devuelve la suma de los presupuestos de todos los proyectos de investigación.

delimiter //

create procedure obtener_presupuesto_total()
begin
    select sum(presupuesto) as presupuesto_total from proyecto_investigacion;
end //

delimiter ;

call obtener_presupuesto_total();

-- 20. listar todos los proyectos activos en una fecha específica
-- muestra los proyectos que estaban activos en una fecha dada.

delimiter //

create procedure listar_proyectos_activos(
    in fecha_consulta date
)
begin
    select * from proyecto_investigacion
    where fecha_inicio <= fecha_consulta and fecha_fin >= fecha_consulta;
end //

delimiter ;

call listar_proyectos_activos('2024-06-01');

