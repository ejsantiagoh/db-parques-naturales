-- Triggers

use parques_naturales;

-- actualizar inventarios al registrar cambios en áreas.

create table if not exists inventario_especies (
    id_area int primary key,
    total_especies int default 0,
    densidad_especies float default 0,
    foreign key (id_area) references area(id) on delete cascade
);

-- 1. inicializar el conteo de especies al agregar un área
-- cuando se agrega un área nueva, inicializa su conteo de especies en 0 en la tabla de inventario.

create trigger after_insert_area
after insert on area
for each row
insert into inventario_especies (id_area, total_especies)
values (new.id, 0);

-- 2. eliminar especies al borrar un área
-- antes de eliminar un área, borra todas las especies asociadas a ella.

create trigger before_delete_area
before delete on area
for each row
delete from especie where id_area = old.id;

-- 3. transferir especies si el área cambia de parque
-- si un área cambia de parque, mueve sus especies al nuevo parque asignado.

create trigger after_update_area_parque
after update on area
for each row
if old.id_parque <> new.id_parque then
    update especie 
    set id_area = new.id 
    where id_area = old.id;
end if;

-- 4. evitar eliminar un área con especies registradas
-- impide que se elimine un área si tiene especies registradas.

create trigger before_delete_area_check_especies
before delete on area
for each row
if (select count(*) from especie where id_area = old.id) > 0 then
    signal sqlstate '45000'
    set message_text = 'no se puede eliminar un área con especies registradas.';
end if;

-- 5. aumentar el conteo de especies al agregar una nueva
-- cada vez que se añade una especie, aumenta en 1 el total de especies en el inventario.

create trigger after_insert_species
after insert on especie
for each row
update inventario_especies
set total_especies = total_especies + 1
where id_area = new.id_area;


-- 6. disminuir el conteo al eliminar una especie
-- cuando se borra una especie, se resta 1 al total en el inventario.

create trigger after_delete_species
after delete on especie
for each row
update inventario_especies
set total_especies = total_especies - 1
where id_area = old.id_area;

-- 7. ajustar la densidad de especies si cambia la extensión del área
-- si cambia la extensión de un área, se recalcula la densidad de especies.

create trigger after_update_area_extension
after update on area
for each row
if old.extension <> new.extension then
    update inventario_especies
    set densidad_especies = total_especies / new.extension
    where id_area = new.id;
end if;

-- 8. registrar cambios de especies en áreas
-- guarda un historial de cambios cuando una especie se mueve a otra área.

create trigger after_update_species_area
after update on especie
for each row
insert into historial_especies (id_especie, id_area_anterior, id_area_nueva, fecha_modificacion)
values (new.id, old.id_area, new.id_area, now());


-- 9. evitar especies duplicadas en un área
-- evita que una misma especie se registre más de una vez en el mismo área.

create trigger before_insert_species_check
before insert on especie
for each row
if (select count(*) from especie where denominacion_cientifica = new.denominacion_cientifica and id_area = new.id_area) > 0 then
    signal sqlstate '45000'
    set message_text = 'la especie ya está registrada en esta área.';
end if;


-- 10. guardar un log de auditoría de cambios en áreas
-- crea un registro de auditoría cada vez que un área se crea, actualiza o elimina.

create trigger after_area_changes
after insert on area
for each row
insert into auditoria_areas (id_area, accion, fecha)
values (new.id, 'insert', now());

create trigger after_area_update
after update on area
for each row
insert into auditoria_areas (id_area, accion, fecha)
values (new.id, 'update', now());

create trigger after_area_delete
after delete on area
for each row
insert into auditoria_areas (id_area, accion, fecha)
values (old.id, 'delete', now());


-- registrar movimientos y cambios salariales de personal.

-- guardar el historial de cada cambio salarial de los empleados.
create table if not exists historial_salarios (
    id int auto_increment primary key,
    id_personal int not null,
    sueldo_anterior decimal(10,2) not null,
    sueldo_nuevo decimal(10,2) not null,
    fecha_cambio timestamp default current_timestamp,
    foreign key (id_personal) references personal(id) on delete cascade
);

-- 11. registrar cambios salariales al actualizar sueldo en la tabla personal
-- registra cambios salariales en la tabla historial antes de actualizar el sueldo.

create trigger before_update_sueldo
before update on personal
for each row
begin
    if old.sueldo <> new.sueldo then
        insert into historial_salarios (id_personal, sueldo_anterior, sueldo_nuevo)
        values (old.id, old.sueldo, new.sueldo);
    end if;
end;

-- 12. evitar que un sueldo sea reducido en más del 30%
-- impide reducciones salariales mayores al 30%.

create trigger before_sueldo_decrease
before update on personal
for each row
begin
    if new.sueldo < old.sueldo * 0.7 then
        signal sqlstate '45000'
        set message_text = 'no se puede reducir el sueldo en más del 30%';
    end if;
end;

-- 13. registrar nuevos empleados en historial con sueldo inicial
-- guarda el sueldo inicial al insertar un nuevo empleado.

create trigger after_insert_personal
after insert on personal
for each row
begin
    insert into historial_salarios (id_personal, sueldo_anterior, sueldo_nuevo)
    values (new.id, 0, new.sueldo);
end;

-- 14. registrar aumentos salariales y verificar que sea menor al 50%
-- restringe aumentos salariales superiores al 50%.

create trigger before_aumento_sueldo
before update on personal
for each row
begin
    if new.sueldo > old.sueldo * 1.5 then
        signal sqlstate '45000'
        set message_text = 'el aumento salarial no puede superar el 50%';
    end if;
end;

-- 15. eliminar registros de salario cuando se elimina un empleado
-- elimina registros históricos cuando un empleado es eliminado.

create trigger after_delete_personal
after delete on personal
for each row
begin
    delete from historial_salarios where id_personal = old.id;
end;

-- 16. notificar cuando un empleado alcance un sueldo mayor a $5000
-- notifica cuando un sueldo supera los $5000.

create trigger before_sueldo_mayor_5000
before update on personal
for each row
begin
    if new.sueldo > 5000 and old.sueldo <= 5000 then
        signal sqlstate '45000'
        set message_text = 'se ha alcanzado un sueldo mayor a $5000';
    end if;
end;

-- 17. asegurar que un nuevo personal tenga un sueldo mínimo de $1000
-- asegura que el sueldo inicial sea al menos $1000.

create trigger before_insert_sueldo_minimo
before insert on personal
for each row
begin
    if new.sueldo < 1000 then
        signal sqlstate '45000'
        set message_text = 'el sueldo inicial no puede ser menor a $1000';
    end if;
end;

-- 18. verificar que el cambio salarial solo lo haga administración
-- solo permite a administradores modificar sueldos.

create trigger before_update_sueldo_admin
before update on personal
for each row
begin
    declare es_admin int;

    -- verificar si el usuario que está intentando cambiar el sueldo es de gestión
    select count(*) into es_admin
    from personal_gestion
    where id = new.id;

    -- si no está en la tabla de personal_gestion, se bloquea la operación
    if es_admin = 0 then
        signal sqlstate '45000'
        set message_text = 'solo personal de gestión puede modificar sueldos';
    end if;
end;

-- 19. registrar cambios salariales en un log adicional
-- registra cambios salariales en un log adicional.

create trigger after_update_sueldo_log
after update on personal
for each row
begin
    insert into historial_salarios (id_personal, sueldo_anterior, sueldo_nuevo)
    values (old.id, old.sueldo, new.sueldo);
end;

-- 20. bloquear cambios de sueldo si el empleado tiene menos de 6 meses
-- evita cambios de sueldo antes de 6 meses de contratación.

create trigger before_update_sueldo_antiguedad
before update on personal
for each row
begin
    declare fecha_ingreso date;
    select min(fecha_cambio) into fecha_ingreso 
    from historial_salarios where id_personal = old.id;

    if datediff(current_date, fecha_ingreso) < 180 then
        signal sqlstate '45000'
        set message_text = 'no se puede cambiar el sueldo antes de 6 meses';
    end if;
end;




