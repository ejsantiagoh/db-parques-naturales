-- Eventos

use parques_naturales;

-- generar reportes semanales de visitantes y alojamientos.

-- crear una tabla para almacenar reportes semanales
-- para registrar los reportes generados por los eventos, creamos una tabla:

create table if not exists reporte_semanal (
    id int auto_increment primary key,
    fecha_generacion datetime default current_timestamp,
    tipo_reporte enum('visitantes', 'alojamientos') not null,
    contenido text not null
);

-- 1. total de visitantes por parque en la última semana

create event if not exists reporte_visitantes_por_parque
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'visitantes', 
    concat('parque ', p.nombre, ': ', count(r.id), ' visitantes en la última semana.')
from registro_entrada r
join parque_natural p on r.id_parque = p.id
where r.fecha_visita >= date_sub(curdate(), interval 7 day)
group by p.id;


-- 2. número total de visitantes en la última semana

create event if not exists reporte_total_visitantes
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'visitantes', 
    concat('total visitantes en la última semana: ', count(id))
from registro_entrada
where fecha_visita >= date_sub(curdate(), interval 7 day);


-- 3. visitantes por departamento en la última semana

create event if not exists reporte_visitantes_por_departamento
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'visitantes',
    concat('departamento ', d.nombre, ': ', count(r.id), ' visitantes.')
from registro_entrada r
join parque_natural p on r.id_parque = p.id
join parque_departamento pd on p.id = pd.id_parque
join departamento d on pd.id_departamento = d.id
where r.fecha_visita >= date_sub(curdate(), interval 7 day)
group by d.id;


-- 4. visitantes únicos en la última semana

create event if not exists reporte_visitantes_unicos
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'visitantes',
    concat('visitantes únicos en la última semana: ', count(distinct cedula_visitante))
from registro_entrada
where fecha_visita >= date_sub(curdate(), interval 7 day);

-- 5. visitantes con más visitas en la última semana

create event if not exists reporte_visitantes_frecuentes
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'visitantes',
    concat('visitante ', v.nombre, ' (', v.cedula, '): ', count(r.id), ' visitas en la última semana.')
from registro_entrada r
join visitante v on r.cedula_visitante = v.cedula
where r.fecha_visita >= date_sub(curdate(), interval 7 day)
group by v.cedula
order by count(r.id) desc
limit 5;

-- 6. estadísticas de alojamientos ocupados en la última semana

create event if not exists reporte_alojamientos_ocupados
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'alojamientos',
    concat('total alojamientos ocupados en la última semana: ', count(distinct id_alojamiento))
from estancia_visitante
where fecha_entrada >= date_sub(curdate(), interval 7 day);

-- 7. capacidad total vs. ocupación de alojamientos por parque

create event if not exists reporte_capacidad_vs_ocupacion
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'alojamientos',
    concat('parque ', p.nombre, ': capacidad total: ', sum(a.capacidad), 
           ', ocupación en la última semana: ', count(e.id))
from alojamiento a
join parque_natural p on a.id_parque = p.id
left join estancia_visitante e on a.id = e.id_alojamiento
    and e.fecha_entrada >= date_sub(curdate(), interval 7 day)
group by p.id;

-- 8. categorías de alojamiento más utilizadas

create event if not exists reporte_categoria_alojamiento
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'alojamientos',
    concat('categoría ', a.categoria, ': ', count(e.id), ' estancias en la última semana.')
from alojamiento a
left join estancia_visitante e on a.id = e.id_alojamiento
    and e.fecha_entrada >= date_sub(curdate(), interval 7 day)
group by a.categoria;

-- 9. promedio de duración de estancias en la última semana

create event if not exists reporte_promedio_estancia
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'alojamientos',
    concat('promedio de días de estancia en la última semana: ', 
           round(avg(datediff(fecha_salida, fecha_entrada)), 2), ' días.')
from estancia_visitante
where fecha_entrada >= date_sub(curdate(), interval 7 day);

-- 10. visitantes que más se han hospedado en alojamientos

create event if not exists reporte_visitantes_frecuentes_alojamiento
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'alojamientos',
    concat('visitante ', v.nombre, ' (', v.cedula, '): ', count(e.id), ' estancias en la última semana.')
from estancia_visitante e
join visitante v on e.cedula_visitante = v.cedula
where e.fecha_entrada >= date_sub(curdate(), interval 7 day)
group by v.cedula
order by count(e.id) desc
limit 5;

-- actualizar inventarios de especies periódicamente.

-- 11. actualizar cantidad total de especies por área
-- actualiza diariamente la cantidad de especies registradas en cada área del parque natural

create event if not exists actualizar_total_especies_area
on schedule every 1 day
do
update area a
set extension = (select count(e.id) from especie e where e.id_area = a.id);

-- 12. registrar especies nuevas cada semana
-- inserta en un reporte semanal las nuevas especies añadidas a la base de datos, 
-- indicando el área donde fueron registradas.

create event if not exists registrar_especies_nuevas
on schedule every 1 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'nuevas especies',
    concat('nueva especie: ', e.denominacion_cientifica, ' en área ', a.nombre)
from especie e
join area a on e.id_area = a.id
where e.id not in (select id_especie from proyecto_especie_investigador);


-- 13. eliminar especies extintas
-- cada mes, elimina de la base de datos las especies que no han sido objeto de investigación 
-- ni tienen registros recientes

create event if not exists eliminar_especies_extintas
on schedule every 1 month
do
delete from especie 
where id not in (select distinct id_especie from proyecto_especie_investigador);

-- 14. actualizar el conteo de especies por tipo
-- calcula semanalmente qué tipo de especie (animal, vegetal o mineral) tiene más registros y 
-- actualiza los datos para reflejar esta información.
create event if not exists actualizar_conteo_por_tipo
on schedule every 1 week
do
update especie e
set tipo = (select tipo from especie group by tipo order by count(*) desc limit 1);


-- 15. detectar áreas con pérdida de biodiversidad
-- cada dos semanas, genera un reporte de alerta si el número de especies 
-- en un área ha disminuido significativamente.

create event if not exists detectar_perdida_biodiversidad
on schedule every 2 week
do
insert into reporte_semanal (tipo_reporte, contenido)
select 'biodiversidad',
    concat('alerta: reducción de especies en área ', a.nombre, ' de ', count(e.id), ' a ', (select count(id) from especie where id_area = a.id))
from area a
left join especie e on a.id = e.id_area
where count(e.id) < 5;

-- 16. reportar especies con mayor crecimiento
-- mensualmente, identifica las especies cuyo número de registros ha aumentado más y las añade a un reporte.

create event if not exists reportar_especies_crecimiento
on schedule every 1 month
do
insert into reporte_mensual (tipo_reporte, contenido)
select 'especies crecientes',
    concat('especie en aumento: ', e.denominacion_cientifica, ' con ', count(*) ,' nuevos registros.')
from especie e
group by e.denominacion_cientifica
order by count(*) desc
limit 5;


-- 17. actualizar información de especies en peligro
-- cada tres meses, revisa si hay especies en peligro de extinción e intenta actualizar 
-- su clasificación en la base de datos.
 
create event if not exists actualizar_especies_peligro
on schedule every 3 month
do
update especie
set tipo = 'animal'
where tipo = 'vegetal' and id in (select id_especie from proyecto_especie_investigador);


-- 18. generar un informe de especies por parque
-- mensualmente, contabiliza la cantidad de especies por cada parque natural y 
-- lo almacena en un reporte de gestión.

create event if not exists informe_especies_por_parque
on schedule every 1 month
do
insert into reporte_mensual (tipo_reporte, contenido)
select 'especies_parque',
    concat('parque ', p.nombre, ' tiene ', count(e.id), ' especies registradas.')
from parque_natural p
join area a on p.id = a.id_parque
join especie e on a.id = e.id_area
group by p.id;


-- 19. monitoreo de especies con más investigaciones
-- cada seis meses, revisa cuáles especies han sido objeto de más investigaciones y 
-- genera un reporte con las cinco más estudiadas.

create event if not exists monitoreo_especies_investigadas
on schedule every 6 month
do
insert into reporte_semestral (tipo_reporte, contenido)
select 'especies_investigadas',
    concat('especie ', e.denominacion_cientifica, ' ha sido objeto de ', count(p.id_proyecto), ' investigaciones.')
from especie e
join proyecto_especie_investigador p on e.id = p.id_especie
group by e.id
order by count(p.id_proyecto) desc
limit 5;


-- 20. alertar sobre especies sin registros recientes
-- una vez al año, emite una alerta sobre especies que no han sido investigadas 
-- ni registradas recientemente en ninguna actividad.

create event if not exists alertar_especies_sin_registro
on schedule every 1 year
do
insert into reporte_anual (tipo_reporte, contenido)
select 'alerta_especies',
    concat('advertencia: no hay registros recientes de ', e.denominacion_cientifica, ' en ', a.nombre)
from especie e
join area a on e.id_area = a.id
where e.id not in (select distinct id_especie from proyecto_especie_investigador);
	

