-- Funciones

use parques_naturales;

-- superficie total de parques por departamento.

-- 1. obtener la superficie total de un parque
-- devuelve la suma de las áreas de un parque específico.
drop function superficie_parque;

delimiter //

create function superficie_parque(p_id_parque int) 
returns float 
deterministic
begin
    declare total_superficie float default 0;
    select coalesce(sum(extension), 0) into total_superficie 
    from area 
    where id_parque = p_id_parque;
    return total_superficie;
end //

delimiter ;

select superficie_parque(1);


-- 2. obtener la superficie total de un departamento
-- devuelve la superficie de todos los parques dentro de un departamento específico.
drop function superficie_parques_departamento;

delimiter //

create function superficie_parques_departamento(p_id_depto int) 
returns float 
deterministic
begin
    declare total_superficie float default 0;
    select coalesce(sum(a.extension), 0) into total_superficie
    from area a
    join parque_departamento pd on a.id_parque = pd.id_parque
    where pd.id_departamento = p_id_depto;
    return total_superficie;
end //

delimiter ;


select superficie_parques_departamento(1);

-- 3. superficie total de todos los parques
-- retorna la superficie total de todos los parques en la base de datos.

delimiter //

create function superficie_total_parques() 
returns float 
deterministic
begin
    declare total float default 0;
    select coalesce(sum(extension), 0) into total from area;
    return total;
end //

delimiter ;

select superficie_total_parques();

-- 4. porcentaje de superficie de un parque respecto al total
-- calcula el porcentaje de superficie de un parque en relación con la superficie total de todos los parques.

delimiter //

create function porcentaje_superficie_parque(p_id_parque int) 
returns float 
deterministic
begin
    declare sup_parque float default 0;
    declare sup_total float default 1;  -- evitar división por 0
    
    set sup_parque = superficie_parque(p_id_parque);
    set sup_total = superficie_total_parques();
    
    return if(sup_total > 0, (sup_parque / sup_total) * 100, 0);
end //

delimiter ;

select porcentaje_superficie_parque(3);

-- 5. porcentaje de superficie de un departamento respecto al total
-- calcula el porcentaje de la superficie total de los parques en un departamento con 
-- respecto a la superficie total de todos los parques.

delimiter //

create function porcentaje_superficie_departamento(p_id_depto int) 
returns float 
deterministic
begin
    declare sup_depto float default 0;
    declare sup_total float default 1;
    
    set sup_depto = superficie_parques_departamento(p_id_depto);
    set sup_total = superficie_total_parques();
    
    return if(sup_total > 0, (sup_depto / sup_total) * 100, 0);
end //

delimiter ;

select porcentaje_superficie_departamento(1);


-- 6. parque con mayor superficie
-- retorna el id del parque con la mayor superficie total.

delimiter //

create function parque_mayor_superficie() 
returns int 
deterministic
begin
    declare max_parque int default null;
    
    select id_parque into max_parque
    from area
    group by id_parque
    order by sum(extension) desc
    limit 1;
    
    return max_parque;
end //

delimiter ;

select parque_mayor_superficie();


-- 7. departamento con mayor superficie de parques
-- retorna el id del departamento con la mayor superficie total de parques.

delimiter //

create function departamento_mayor_superficie() 
returns int 
deterministic
begin
    declare max_depto int default null;
    
    select pd.id_departamento into max_depto
    from parque_departamento pd
    join area a on pd.id_parque = a.id_parque
    group by pd.id_departamento
    order by sum(a.extension) desc
    limit 1;
    
    return max_depto;
end //

delimiter ;

select departamento_mayor_superficie();

-- inventarios de especies por área y tipo.

-- 8. cantidad total de especies en un área
-- retorna el número total de especies registradas en un área específica.

delimiter //

create function cantidad_especies_area(p_id_area int) 
returns int 
deterministic
begin
    declare total int default 0;
    select coalesce(count(id), 0) into total 
    from especie 
    where id_area = p_id_area;
    return total;
end //

delimiter ;

select cantidad_especies_area(5);

-- 9. cantidad de especies por tipo en un área
-- retorna el número total de especies de un tipo (vegetal, animal, mineral) en un área específica.

delimiter //

create function cantidad_especies_tipo_area(p_id_area int, p_tipo enum('vegetal', 'animal', 'mineral')) 
returns int 
deterministic
begin
    declare total int default 0;
    select coalesce(count(id), 0) into total 
    from especie 
    where id_area = p_id_area and tipo = p_tipo;
    return total;
end //

delimiter ;

select cantidad_especies_tipo_area(1, 'animal');

-- 10. área con mayor cantidad de especies
-- retorna el id del área con más especies registradas.

delimiter //

create function area_mayor_cantidad_especies() 
returns int 
deterministic
begin
    declare max_area int default null;
    
    select id_area into max_area
    from especie
    group by id_area
    order by count(id) desc
    limit 1;
    
    return max_area;
end //

delimiter ;

select area_mayor_cantidad_especies();

-- 11. tipo de especie más común en un área
-- retorna el tipo de especie (vegetal, animal, mineral) más frecuente en un área específica.

delimiter //

create function tipo_especie_mas_comun_area(p_id_area int) 
returns enum('vegetal', 'animal', 'mineral') 
deterministic
begin
    declare tipo_mas_comun enum('vegetal', 'animal', 'mineral') default null;
    
    select tipo into tipo_mas_comun
    from especie
    where id_area = p_id_area
    group by tipo
    order by count(id) desc
    limit 1;
    
    return tipo_mas_comun;
end //

delimiter ;

select tipo_especie_mas_comun_area(3);

-- 12. cantidad total de especies en un parque
-- retorna la cantidad total de especies registradas en todas las áreas de un parque específico.

delimiter //

create function cantidad_especies_parque(p_id_parque int) 
returns int 
deterministic
begin
    declare total int default 0;
    select coalesce(count(e.id), 0) into total
    from especie e
    join area a on e.id_area = a.id
    where a.id_parque = p_id_parque;
    return total;
end //

delimiter ;

select cantidad_especies_parque(2);

-- 13. parque con mayor diversidad de especies
-- retorna el id del parque con mayor número de especies registradas.

delimiter //

create function parque_mayor_diversidad_especies() 
returns int 
deterministic
begin
    declare max_parque int default null;
    
    select a.id_parque into max_parque
    from especie e
    join area a on e.id_area = a.id
    group by a.id_parque
    order by count(e.id) desc
    limit 1;
    
    return max_parque;
end //

delimiter ;

select parque_mayor_diversidad_especies();

-- 14. promedio de especies por área en un parque
-- calcula el promedio de especies por área en un parque específico.

delimiter //

create function promedio_especies_por_area_parque(p_id_parque int) 
returns float 
deterministic
begin
    declare total_especies int default 0;
    declare total_areas int default 1;  -- evita división por 0
    
    select count(e.id) into total_especies
    from especie e
    join area a on e.id_area = a.id
    where a.id_parque = p_id_parque;
    
    select count(a.id) into total_areas
    from area a
    where a.id_parque = p_id_parque;
    
    return if(total_areas > 0, total_especies / total_areas, 0);
end //

delimiter ;

select promedio_especies_por_area_parque(1);

-- cálculo de costos operativos de proyectos.

-- 15. obtener presupuesto total de un proyecto
-- retorna el presupuesto total asignado a un proyecto específico.

delimiter //

create function presupuesto_proyecto(p_id_proyecto int) 
returns float 
deterministic
begin
    declare total float default 0;
    select coalesce(presupuesto, 0) into total 
    from proyecto_investigacion 
    where id = p_id_proyecto;
    return total;
end //

delimiter ;

select presupuesto_proyecto(3);

-- 16. costo promedio de proyectos de investigación
-- retorna el costo promedio de todos los proyectos de investigación registrados.

delimiter //

create function costo_promedio_proyectos() 
returns float 
deterministic
begin
    declare promedio float default 0;
    select coalesce(avg(presupuesto), 0) into promedio 
    from proyecto_investigacion;
    return promedio;
end //

delimiter ;


select costo_promedio_proyectos();

-- 17. costo total de proyectos en un período
-- retorna la suma de los presupuestos de los proyectos que inician en un período específico.

delimiter //

create function costo_proyectos_por_periodo(p_fecha_inicio date, p_fecha_fin date) 
returns float 
deterministic
begin
    declare total float default 0;
    select coalesce(sum(presupuesto), 0) into total 
    from proyecto_investigacion 
    where fecha_inicio between p_fecha_inicio and p_fecha_fin;
    return total;
end //

delimiter ;

select costo_proyectos_por_periodo('2024-01-01', '2024-12-31');


-- 18. número de proyectos con costos superiores a un valor
-- retorna la cantidad de proyectos cuyo presupuesto supera un valor dado.

delimiter //

create function cantidad_proyectos_supera_costo(p_monto float) 
returns int 
deterministic
begin
    declare total int default 0;
    select count(id) into total 
    from proyecto_investigacion 
    where presupuesto > p_monto;
    return total;
end //

delimiter ;

select cantidad_proyectos_supera_costo(50000);

-- 19. costo total de proyectos asociados a una especie
-- retorna el presupuesto total de los proyectos que estudian una especie específica.

delimiter //

create function costo_proyectos_por_especie(p_id_especie int) 
returns float 
deterministic
begin
    declare total float default 0;
    select coalesce(sum(pi.presupuesto), 0) into total
    from proyecto_investigacion pi
    join proyecto_especie_investigador pei on pi.id = pei.id_proyecto
    where pei.id_especie = p_id_especie;
    return total;
end //

delimiter ;


select costo_proyectos_por_especie(2);

-- 20. proyecto con el mayor costo
-- retorna el id del proyecto con el mayor presupuesto registrado.

delimiter //

create function proyecto_mayor_costo() 
returns int 
deterministic
begin
    declare max_proyecto int default null;
    
    select id into max_proyecto
    from proyecto_investigacion
    order by presupuesto desc
    limit 1;
    
    return max_proyecto;
end //

delimiter ;

select proyecto_mayor_costo();
