-- consultas:

use parques_naturales;

-- Ver todo los datos de la tabla entidad_responsable:
select * from entidad_responsable;
-- Ver todos los datos de la tabla area:
select * from area;
-- Ver todos los datos de la tabla personal:
select *  from personal;
-- Ver todos los datos de la tabla parque_natural:
select * from parque_natural;
-- Ver todos los datos de la tabla especie donde tipo sea mineral:
select * from especie where tipo = "mineral";
-- Ver todos los datos de la tabla departamento:
select * from departamento;
-- ver los datos de la tabla proyecto_investigacion:
select * from proyecto_investigacion;
-- Ver los datos de la tabla personal_conservacion:
select * from personal_conservacion;
select * from proyecto_especie_investigador;
select * from personal_gestion;
select * from parque_departamento;

-- Estado actual de parques:
-- 1. cantidad de parques por departamento

select d.nombre as departamento, count(pd.id_parque) as cantidad_parques
from departamento d
left join parque_departamento pd on d.id = pd.id_departamento
group by d.nombre;

-- 2.superficie total protegida por departamento

select d.nombre as departamento, sum(a.extension) as superficie_total
from departamento d
join parque_departamento pd on d.id = pd.id_departamento
join parque_natural p on pd.id_parque = p.id
join area a on p.id = a.id_parque
group by d.nombre;

-- 3. promedio de extensión de áreas por parque.

select p.nombre as parque, avg(a.extension) as promedio_extension
from parque_natural p
join area a on p.id = a.id_parque
group by p.nombre;

-- 4.parque con mayor cantidad de áreas protegidas

select p.nombre as parque, count(a.id) as cantidad_areas
from parque_natural p
join area a on p.id = a.id_parque
group by p.nombre
order by cantidad_areas desc
limit 1;

-- 5. departamento con la mayor superficie de áreas protegidas

select d.nombre as departamento, sum(a.extension) as superficie_total
from departamento d
join parque_departamento pd on d.id = pd.id_departamento
join parque_natural p on pd.id_parque = p.id
join area a on p.id = a.id_parque
group by d.nombre
order by superficie_total desc
limit 1;

-- 6. lista de parques naturales y sus fechas de declaración

select nombre, fecha_declaracion from parque_natural;

-- 7. lista de departamentos y la cantidad de parques en cada uno

select d.nombre as departamento, count(pd.id_parque) as cantidad_parques
from departamento d
left join parque_departamento pd on d.id = pd.id_departamento
group by d.nombre;

-- 8 .lista de áreas protegidas y sus extensiones

select nombre, extension from area;

-- 9. listado de parques y los departamentos en los que están ubicados

select p.nombre as parque, d.nombre as departamento
from parque_natural p
join parque_departamento pd on p.id = pd.id_parque
join departamento d on pd.id_departamento = d.id;

-- 10. cantidad de áreas protegidas en cada parque

select p.nombre as parque, count(a.id) as cantidad_areas
from parque_natural p
left join area a on p.id = a.id_parque
group by p.nombre;

-- 11. parques ordenados por fecha de declaración (más antiguos primero)

select nombre, fecha_declaracion 
from parque_natural
order by fecha_declaracion asc;

-- 12. parques con más de 1 departamento asociado

select p.nombre as parque, count(pd.id_departamento) as cantidad_departamentos
from parque_natural p
join parque_departamento pd on p.id = pd.id_parque
group by p.nombre
having cantidad_departamentos > 1;

-- 13. parques y sus respectivas áreas protegidas

select p.nombre as parque, a.nombre as area
from parque_natural p
join area a on p.id = a.id_parque;

-- 14. superficie total de un parque específico (ejemplo: 'parque nacional x')

select p.nombre as parque, sum(a.extension) as superficie_total
from parque_natural p
join area a on p.id = a.id_parque
where p.nombre = 'parque nacional natural serranía de san lucas'
group by p.nombre;

-- 15. lista de parques y la cantidad de visitantes registrados

select p.nombre as parque, count(re.cedula_visitante) as cantidad_visitantes
from parque_natural p
left join registro_entrada re on p.id = re.id_parque
group by p.nombre;

-- 16. departamentos que no tienen parques naturales registrados

select d.nombre as departamento
from departamento d
left join parque_departamento pd on d.id = pd.id_departamento
where pd.id_parque is null;

-- 17. extensión total de todas las áreas protegidas

select sum(extension) as extension_total from area;

-- 18. cantidad de áreas protegidas por departamento

select d.nombre as departamento, count(a.id) as cantidad_areas
from departamento d
join parque_departamento pd on d.id = pd.id_departamento
join parque_natural p on pd.id_parque = p.id
join area a on p.id = a.id_parque
group by d.nombre;

-- 19. listado de parques con más de 3 áreas protegidas

select p.nombre as parque, count(a.id) as cantidad_areas
from parque_natural p
join area a on p.id = a.id_parque
group by p.nombre
having cantidad_areas > 3;

-- 20. cantidad total de parques naturales registrados

select count(*) as total_parques from parque_natural;


-- inventarios de especies por áreas y tipos
-- 21. cantidad de especies por área protegida

select a.nombre as area_protegida, count(e.id) as total_especies
from area a
left join especie e on a.id = e.id_area
group by a.id, a.nombre
order by total_especies desc;

-- 22. cantidad de especies por tipo en cada área

select a.nombre as area_protegida, e.tipo, count(e.id) as cantidad_especies
from area a
join especie e on a.id = e.id_area
group by a.id, a.nombre, e.tipo
order by a.nombre, e.tipo;

-- 23. inventario de especies con su nombre científico y vulgar por área

select a.nombre as area_protegida, e.denominacion_cientifica, e.denominacion_vulgar, e.tipo
from area a
join especie e on a.id = e.id_area
order by a.nombre, e.tipo, e.denominacion_cientifica;

-- 24. cantidad total de especies por parque natural

select p.nombre as parque, count(e.id) as total_especies
from parque_natural p
join area a on p.id = a.id_parque
join especie e on a.id = e.id_area
group by p.id, p.nombre
order by total_especies asc;

-- 25. parques con más especies registradas

select nombre, total_especies
from (
    select p.nombre, count(e.id) as total_especies
    from parque_natural p
    join area a on p.id = a.id_parque
    join especie e on a.id = e.id_area
    group by p.id, p.nombre
) as especies_por_parque
order by total_especies desc
limit 5;

-- 26. listar todas las especies con su tipo y el área en la que se encuentran:

select e.denominacion_cientifica, e.denominacion_vulgar, e.tipo, a.nombre as area
from especie e
join area a on e.id_area = a.id;

-- 27. obtener la cantidad total de especies registradas:

select count(*) as total_especies from especie;

-- 28. mostrar todas las especies de tipo "animal":

select denominacion_cientifica, denominacion_vulgar 
from especie 
where tipo = 'animal';

-- 29. mostrar todas las especies de tipo "vegetal":

select denominacion_cientifica, denominacion_vulgar 
from especie 
where tipo = 'vegetal';

-- 30. mostrar todas las especies de tipo "mineral":

select denominacion_cientifica, denominacion_vulgar  
from especie 
where tipo = 'mineral';

-- 31. obtener las especies de un parque específico (ejemplo: 'parque nacional natural la macarena'):

select e.denominacion_cientifica, e.denominacion_vulgar, e.tipo 
from especie e
join area a on e.id_area = a.id
join parque_natural p on a.id_parque = p.id
where p.nombre = 'parque nacional natural la macarena';

-- 32. listar las especies de un área específica:

select denominacion_cientifica, tipo 
from especie 
where id_area = 3; 

-- 33. obtener la cantidad de especies por cada tipo:

select tipo, count(*) as cantidad from especie group by tipo;

-- 34. obtener las especies registradas en un parque con más de una área:

select distinct e.denominacion_cientifica, e.tipo 
from especie e
join area a on e.id_area = a.id
join parque_natural p on a.id_parque = p.id
group by e.denominacion_cientifica, e.tipo, p.id
having count(a.id) >= 1;

select * from especie;

-- 35. obtener el área con más especies registradas:

select a.nombre, count(e.id) as cantidad_especies
from area a
join especie e on a.id = e.id_area
group by a.nombre
order by cantidad_especies desc
limit 1;

-- 36. listar las especies con nombres científicos que empiezan con 'a':

select denominacion_cientifica, tipo 
from especie 
where denominacion_cientifica like 'a%';

-- 37. mostrar las especies que tienen un nombre vulgar asignado:

select denominacion_cientifica, denominacion_vulgar 
from especie 
where denominacion_vulgar is not null;

-- 38. obtener las especies y el parque al que pertenecen:

select e.denominacion_cientifica, p.nombre as parque
from especie e
join area a on e.id_area = a.id
join parque_natural p on a.id_parque = p.id;

-- 39. listar las especies registradas en parques que fueron declarados antes del año 2000:

select e.denominacion_cientifica, p.nombre as parque, p.fecha_declaracion
from especie e
join area a on e.id_area = a.id
join parque_natural p on a.id_parque = p.id
where p.fecha_declaracion < '2000-01-01';

-- 40. obtener la cantidad de especies en cada parque natural:

select p.nombre as parque, count(e.id) as cantidad_especies
from parque_natural p
join area a on p.id = a.id_parque
join especie e on a.id = e.id_area
group by p.nombre;


-- Actividades del personal según tipo, áreas asignadas y sueldos.

-- 41. Listar todo el personal con su tipo y el área asignada (cuando aplica):

SELECT p.id, p.nombre, p.sueldo, 
       CASE 
           WHEN pg.id IS NOT NULL THEN 'Gestión' 
           WHEN pv.id IS NOT NULL THEN 'Vigilancia' 
           WHEN pc.id IS NOT NULL THEN 'Conservación' 
           WHEN pi.id IS NOT NULL THEN 'Investigación' 
           ELSE 'Sin clasificación' 
       END AS tipo_personal,
       COALESCE(a.nombre, 'No aplica') AS area_asignada
FROM personal p
LEFT JOIN personal_gestion pg ON p.id = pg.id
LEFT JOIN personal_vigilancia pv ON p.id = pv.id
LEFT JOIN personal_conservacion pc ON p.id = pc.id
LEFT JOIN personal_investigador pi ON p.id = pi.id
LEFT JOIN area a ON pv.id_area = a.id OR pc.id_area = a.id;

-- 42. Número de empleados por tipo de personal:

SELECT tipo_personal, COUNT(*) AS cantidad
FROM (
    SELECT 
        CASE 
            WHEN pg.id IS NOT NULL THEN 'Gestión' 
            WHEN pv.id IS NOT NULL THEN 'Vigilancia' 
            WHEN pc.id IS NOT NULL THEN 'Conservación' 
            WHEN pi.id IS NOT NULL THEN 'Investigación' 
            ELSE 'Sin clasificación' 
        END AS tipo_personal
    FROM personal p
    LEFT JOIN personal_gestion pg ON p.id = pg.id
    LEFT JOIN personal_vigilancia pv ON p.id = pv.id
    LEFT JOIN personal_conservacion pc ON p.id = pc.id
    LEFT JOIN personal_investigador pi ON p.id = pi.id
) AS tipos
GROUP BY tipo_personal;

-- 43. Listar el personal de vigilancia con su rango, horario de patrulla y área asignada:

SELECT p.id, p.nombre, p.sueldo, pv.rango, pv.horario_patrulla, a.nombre AS area_asignada
FROM personal_vigilancia pv
JOIN personal p ON pv.id = p.id
JOIN area a ON pv.id_area = a.id;

-- 44. Obtener el personal de conservación con su especialidad, años de experiencia y área asignada:

SELECT p.id, p.nombre, p.sueldo, pc.especialidad, pc.anios_experiencia, a.nombre AS area_asignada
FROM personal_conservacion pc
JOIN personal p ON pc.id = p.id
JOIN area a ON pc.id_area = a.id;

-- 45. Listar los investigadores con su campo de investigación y número de publicaciones:

SELECT p.id, p.nombre, p.sueldo, pi.campo_investigacion, pi.publicaciones
FROM personal_investigador pi
JOIN personal p ON pi.id = p.id;

-- 46. Listar todos los empleados junto con su tipo específico de personal

SELECT p.id, p.nombre, p.sueldo, 
       CASE 
           WHEN pg.id IS NOT NULL THEN 'Gestión' 
           WHEN pv.id IS NOT NULL THEN 'Vigilancia' 
           WHEN pc.id IS NOT NULL THEN 'Conservación' 
           WHEN pi.id IS NOT NULL THEN 'Investigación' 
           ELSE 'Sin clasificación' 
       END AS tipo_personal
FROM personal p
LEFT JOIN personal_gestion pg ON p.id = pg.id
LEFT JOIN personal_vigilancia pv ON p.id = pv.id
LEFT JOIN personal_conservacion pc ON p.id = pc.id
LEFT JOIN personal_investigador pi ON p.id = pi.id;

-- 47. Obtener el nombre y sueldo del personal de vigilancia con su rango
SELECT p.nombre, p.sueldo, pv.rango 
FROM personal p
JOIN personal_vigilancia pv ON p.id = pv.id;

-- 48. Obtener el nombre y sueldo del personal de conservación con su especialidad
SELECT p.nombre, p.sueldo, pc.especialidad 
FROM personal p
JOIN personal_conservacion pc ON p.id = pc.id;

-- 49. Obtener el nombre y sueldo del personal investigador con su campo de investigación
SELECT p.nombre, p.sueldo, pi.campo_investigacion 
FROM personal p
JOIN personal_investigador pi ON p.id = pi.id;

-- 50. Obtener el nombre y sueldo del personal de gestión con su rol
SELECT p.nombre, p.sueldo, pg.rol 
FROM personal p
JOIN personal_gestion pg ON p.id = pg.id;

-- 51. Listar el nombre de los empleados y las áreas donde trabajan 
SELECT p.nombre, a.nombre AS area_asignada
FROM personal p
LEFT JOIN personal_vigilancia pv ON p.id = pv.id
LEFT JOIN personal_conservacion pc ON p.id = pc.id
LEFT JOIN area a ON a.id = pv.id_area OR a.id = pc.id_area;

-- 52. Listar los vigilantes y los vehículos que tienen asignados
SELECT p.nombre, v.tipo, v.marca
FROM personal p
JOIN personal_vigilancia pv ON p.id = pv.id
JOIN vehiculo_vigilancia v ON pv.id = v.id_vigilante;

-- 53. Mostrar el número total de vigilantes asignados a cada área
SELECT a.nombre AS area, COUNT(pv.id) AS cantidad_vigilantes
FROM area a
LEFT JOIN personal_vigilancia pv ON a.id = pv.id_area
GROUP BY a.nombre;

-- 54. Listar los investigadores y los proyectos en los que participan 
SELECT p.nombre, pi.campo_investigacion, pr.nombre AS proyecto
FROM personal p
JOIN personal_investigador pi ON p.id = pi.id
left JOIN proyecto_especie_investigador pei ON pi.id = pei.id_investigador
left JOIN proyecto_investigacion pr ON pei.id_proyecto = pr.id;

SELECT * FROM proyecto_especie_investigador;

-- 55. Mostrar los nombres del personal de gestión que han registrado visitas en parques
SELECT DISTINCT p.nombre
FROM personal p
JOIN personal_gestion pg ON p.id = pg.id
JOIN registro_entrada re ON pg.id = re.id_personal_gestion;

-- 56. Obtener el número total de empleados por cada tipo de personal
SELECT 
    (SELECT COUNT(*) FROM personal_gestion) AS total_gestion,
    (SELECT COUNT(*) FROM personal_vigilancia) AS total_vigilancia,
    (SELECT COUNT(*) FROM personal_conservacion) AS total_conservacion,
    (SELECT COUNT(*) FROM personal_investigador) AS total_investigador;

-- 57. Listar los empleados cuyo sueldo es mayor a 5,000.000, ordenados de mayor a menor
SELECT nombre, sueldo 
FROM personal
WHERE sueldo > 2000000
ORDER BY sueldo DESC;

-- 58. Obtener los nombres de los empleados que no están asignados a ninguna área
SELECT p.nombre
FROM personal p
LEFT JOIN personal_vigilancia pv ON p.id = pv.id
LEFT JOIN personal_conservacion pc ON p.id = pc.id
WHERE pv.id_area IS NULL AND pc.id_area IS NULL;

-- 59. Listar los nombres de los empleados con su tipo de personal, pero excluyendo los de gestión
SELECT p.nombre, 
       CASE 
           WHEN pv.id IS NOT NULL THEN 'Vigilancia' 
           WHEN pc.id IS NOT NULL THEN 'Conservación' 
           WHEN pi.id IS NOT NULL THEN 'Investigación' 
           ELSE 'Sin clasificación' 
       END AS tipo_personal
FROM personal p
LEFT JOIN personal_vigilancia pv ON p.id = pv.id
LEFT JOIN personal_conservacion pc ON p.id = pc.id
LEFT JOIN personal_investigador pi ON p.id = pi.id
WHERE p.id NOT IN (SELECT id FROM personal_gestion);

-- 60. Listar los empleados con su sueldo y su tipo de personal, excluyendo aquellos con sueldos menores a 3000
SELECT p.nombre, p.sueldo, 
       CASE 
           WHEN pg.id IS NOT NULL THEN 'Gestión' 
           WHEN pv.id IS NOT NULL THEN 'Vigilancia' 
           WHEN pc.id IS NOT NULL THEN 'Conservación' 
           WHEN pi.id IS NOT NULL THEN 'Investigación' 
           ELSE 'Sin clasificación' 
       END AS tipo_personal
FROM personal p
LEFT JOIN personal_gestion pg ON p.id = pg.id
LEFT JOIN personal_vigilancia pv ON p.id = pv.id
LEFT JOIN personal_conservacion pc ON p.id = pc.id
LEFT JOIN personal_investigador pi ON p.id = pi.id
WHERE p.sueldo >= 3000;

-- Estadísticas de proyectos de investigación
-- 61. cantidad total de proyectos de investigación registrados

select count(*) as total_proyectos
from proyecto_investigacion;

-- 62. cantidad de proyectos por cada campo de investigación
select pi.campo_investigacion, count(distinct pei.id_proyecto) as cantidad_proyectos
from personal_investigador pi
join proyecto_especie_investigador pei on pi.id = pei.id_investigador
group by pi.campo_investigacion;

-- 63. cantidad de proyectos en cada área protegida
select a.nombre as area, count(distinct pei.id_proyecto) as cantidad_proyectos
from area a
join especie e on a.id = e.id_area
join proyecto_especie_investigador pei on e.id = pei.id_especie
group by a.nombre;

-- 64. promedio de duración de los proyectos en meses

select avg(timestampdiff(month, fecha_inicio, fecha_fin)) as duracion_promedio_meses
from proyecto_investigacion;

-- 65. número de investigadores involucrados en cada proyecto

select pr.nombre as proyecto, count(distinct pei.id_investigador) as cantidad_investigadores
from proyecto_investigacion pr
left join proyecto_especie_investigador pei on pr.id = pei.id_proyecto
group by pr.nombre;

-- 66. presupuesto total de proyectos por parque natural

select p.nombre as parque, sum(pi.presupuesto) as presupuesto_total
from parque_natural p
join area a on p.id = a.id_parque
join especie e on a.id = e.id_area
join proyecto_especie_investigador pei on e.id = pei.id_especie
join proyecto_investigacion pi on pei.id_proyecto = pi.id
group by p.nombre;

-- 67. número de especies estudiadas por cada proyecto

select pi.nombre as proyecto, count(distinct pei.id_especie) as especies_estudiadas
from proyecto_investigacion pi
join proyecto_especie_investigador pei on pi.id = pei.id_proyecto
group by pi.nombre;

-- 68. investigador con más proyectos asignados

select p.nombre as investigador, count(distinct pei.id_proyecto) as cantidad_proyectos
from personal p
join personal_investigador pi on p.id = pi.id
join proyecto_especie_investigador pei on pi.id = pei.id_investigador
group by p.nombre
order by cantidad_proyectos desc
limit 1;

-- 69. proyectos con mayor número de investigadores

select pi.nombre as proyecto, count(distinct pei.id_investigador) as cantidad_investigadores
from proyecto_investigacion pi
join proyecto_especie_investigador pei on pi.id = pei.id_proyecto
group by pi.nombre
order by cantidad_investigadores desc
limit 1;

-- 70. cantidad de proyectos activos en el año actual
-- curdate: función que devuelve la fecha actual en sql

select count(*) as proyectos_activos
from proyecto_investigacion
where year(fecha_inicio) <= year(curdate()) 
and year(fecha_fin) >= year(curdate());

-- 71. proyecto con el mayor presupuesto asignado

select nombre as proyecto, presupuesto
from proyecto_investigacion
order by presupuesto desc
limit 1;

-- 72. investigador con más especies estudiadas
select p.nombre as investigador, count(distinct pei.id_especie) as especies_estudiadas
from personal p
join personal_investigador pi on p.id = pi.id
join proyecto_especie_investigador pei on pi.id = pei.id_investigador
group by p.nombre
order by especies_estudiadas desc
limit 1;

-- 73. promedio de duración de los proyectos en meses

select avg(timestampdiff(month, fecha_inicio, fecha_fin)) as duracion_promedio_meses
from proyecto_investigacion;

-- 74. especie con más proyectos de investigación asociados

select e.denominacion_cientifica as especie, count(distinct pei.id_proyecto) as cantidad_proyectos
from especie e
join proyecto_especie_investigador pei on e.id = pei.id_especie
group by e.denominacion_cientifica
order by cantidad_proyectos desc
limit 1;

-- 75. porcentaje de proyectos finalizados en los últimos 5 años 

select 
    count(case when fecha_fin >= date_sub(curdate(), interval 5 year) then 1 end) * 100 / count(*) 
    as porcentaje_finalizados
from proyecto_investigacion;

-- 76. parque natural con más proyectos de investigación

select pn.nombre as parque, count(distinct pei.id_proyecto) as cantidad_proyectos
from parque_natural pn
join area a on pn.id = a.id_parque
join especie e on a.id = e.id_area
join proyecto_especie_investigador pei on e.id = pei.id_especie
group by pn.nombre
order by cantidad_proyectos desc
limit 1;

-- 77. año con mayor cantidad de proyectos iniciados

select year(fecha_inicio) as anio, count(*) as cantidad_proyectos
from proyecto_investigacion
group by anio
order by cantidad_proyectos desc
limit 1;

-- 78. promedio de presupuesto por proyecto

select avg(presupuesto) as presupuesto_promedio
from proyecto_investigacion;

-- 79. cantidad de proyectos por tipo de especie investigada

select e.tipo as tipo_especie, count(distinct pei.id_proyecto) as cantidad_proyectos
from especie e
join proyecto_especie_investigador pei on e.id = pei.id_especie
group by e.tipo
order by cantidad_proyectos desc;


-- 80. Investigador con más proyectos de investigación

SELECT p.nombre AS investigador, COUNT(DISTINCT e.tipo) AS cantidad_tipos_especie
FROM personal p
JOIN personal_investigador pi ON p.id = pi.id
JOIN proyecto_especie_investigador pei ON pi.id = pei.id_investigador
JOIN especie e ON pei.id_especie = e.id
GROUP BY p.nombre
HAVING cantidad_tipos_especie > 1
ORDER BY cantidad_tipos_especie DESC;

-- Gestión de visitantes y ocupación de alojamientos.

-- 81. Cantidad total de visitantes por parque

SELECT pn.nombre AS parque, COUNT(re.cedula_visitante) AS total_visitantes
FROM parque_natural pn
LEFT JOIN registro_entrada re ON pn.id = re.id_parque
GROUP BY pn.nombre
ORDER BY total_visitantes DESC;

-- 82. Promedio de visitas por parque en el último año

SELECT pn.nombre AS parque, COUNT(re.id) / 12 AS promedio_mensual
FROM parque_natural pn
LEFT JOIN registro_entrada re ON pn.id = re.id_parque
WHERE re.fecha_visita >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY pn.nombre
ORDER BY promedio_mensual DESC;

-- 83. Profesiones más comunes entre los visitantes

SELECT profesion, COUNT(*) AS cantidad
FROM visitante
GROUP BY profesion
ORDER BY cantidad DESC
LIMIT 5;

-- 84. Ocupación promedio de alojamientos por categoría
-- La función DATEDIFF de MySQL permite calcular el número de días entre dos fechas

SELECT a.categoria, ROUND(AVG(DATEDIFF(ev.fecha_salida, ev.fecha_entrada)), 2) AS promedio_noches
FROM alojamiento a
JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
GROUP BY a.categoria
ORDER BY promedio_noches DESC;

-- 85. Parque con mayor ocupación de alojamientos

SELECT pn.nombre AS parque, COUNT(ev.id) AS total_estancias
FROM parque_natural pn
JOIN alojamiento a ON pn.id = a.id_parque
JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
GROUP BY pn.nombre
ORDER BY total_estancias desc
LIMIT 1;

-- 86. 	Alojamientos más utilizados por los visitantes

SELECT a.nombre AS alojamiento, COUNT(ev.id) AS total_estancias
FROM alojamiento a
LEFT JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
GROUP BY a.nombre
ORDER BY total_estancias DESC
LIMIT 5;

-- 87. Porcentaje de ocupación de alojamientos por parque

SELECT pn.nombre AS parque, 
       COUNT(ev.id) / SUM(a.capacidad) * 100 AS porcentaje_ocupacion
FROM parque_natural pn
JOIN alojamiento a ON pn.id = a.id_parque
LEFT JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
GROUP BY pn.nombre
ORDER BY porcentaje_ocupacion DESC;

-- 88. Promedio de visitantes por día en cada parque

SELECT pn.nombre AS parque, ROUND(COUNT(re.id) / COUNT(DISTINCT re.fecha_visita), 2) AS promedio_diario
FROM parque_natural pn
LEFT JOIN registro_entrada re ON pn.id = re.id_parque
GROUP BY pn.nombre
ORDER BY promedio_diario DESC;

-- 89. Días con mayor número de visitas registradas

SELECT fecha_visita, COUNT(*) AS total_visitas
FROM registro_entrada
GROUP BY fecha_visita
ORDER BY total_visitas DESC
LIMIT 5;

-- 90. Visitantes frecuentes (más de 3 visitas registradas)

SELECT v.cedula, v.nombre, COUNT(re.id) AS total_visitas
FROM visitante v
JOIN registro_entrada re ON v.cedula = re.cedula_visitante
GROUP BY v.cedula, v.nombre
HAVING total_visitas > 3
ORDER BY total_visitas DESC;

-- 91. Número de visitantes por departamento de residencias
-- Extrae el departamento de residencia desde la dirección de los visitantes 
-- y cuenta cuántos provienen de cada uno.

SELECT SUBSTRING_INDEX(direccion, ',', -1) AS departamento, COUNT(*) AS total_visitantes
FROM visitante
GROUP BY departamento
ORDER BY total_visitantes DESC;

-- 92. Número de visitantes por mes en el año actual

SELECT MONTH(re.fecha_visita) AS mes, COUNT(re.id) AS total_visitas
FROM registro_entrada re
WHERE YEAR(re.fecha_visita) = YEAR(CURDATE())
GROUP BY mes
ORDER BY mes;

-- 93. Alojamientos con más ocupación en temporada alta (junio - agosto)

SELECT a.nombre AS alojamiento, COUNT(ev.id) AS total_estancias
FROM alojamiento a
JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
WHERE MONTH(ev.fecha_entrada) BETWEEN 6 AND 8
GROUP BY a.nombre
ORDER BY total_estancias DESC
LIMIT 5;

-- 94. Visitantes que han estado en más de un parque

SELECT v.cedula, v.nombre, COUNT(DISTINCT re.id_parque) AS parques_visitados
FROM visitante v
JOIN registro_entrada re ON v.cedula = re.cedula_visitante
GROUP BY v.cedula, v.nombre
HAVING parques_visitados > 1
ORDER BY parques_visitados DESC;

-- 95. Promedio de días de estancia en alojamientos por visitante

SELECT v.cedula, v.nombre, 
       ROUND(AVG(DATEDIFF(ev.fecha_salida, ev.fecha_entrada)), 2) AS promedio_dias_estancia
FROM visitante v
JOIN estancia_visitante ev ON v.cedula = ev.cedula_visitante
GROUP BY v.cedula, v.nombre
ORDER BY promedio_dias_estancia DESC
LIMIT 10;

-- 96. Porcentaje de ocupación por tipo de alojamiento respecto a categoria

SELECT a.categoria, 
       COUNT(ev.id) AS total_ocupaciones, 
       ROUND((COUNT(ev.id) / (SELECT COUNT(*) FROM estancia_visitante)) * 100, 2) AS porcentaje_ocupacion
FROM alojamiento a
JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
GROUP BY a.categoria
ORDER BY porcentaje_ocupacion DESC;

-- 97. Día con mayor número de visitantes en el último año

SELECT re.fecha_visita, COUNT(*) AS total_visitas
FROM registro_entrada re
WHERE re.fecha_visita >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY re.fecha_visita
ORDER BY total_visitas DESC
LIMIT 1;

-- 98. Parques con más visitantes internacionales

SELECT pn.nombre AS parque, COUNT(re.id) AS total_visitantes_extranjeros
FROM parque_natural pn
JOIN registro_entrada re ON pn.id = re.id_parque
JOIN visitante v ON re.cedula_visitante = v.cedula
WHERE v.direccion NOT LIKE '%[país]%'  -- Reemplaza [país] con el nombre de tu país
GROUP BY pn.nombre
ORDER BY total_visitantes_extranjeros DESC
LIMIT 5;

-- 99. Relación entre ocupación de alojamientos y visitantes por parque

SELECT pn.nombre AS parque, 
       COUNT(DISTINCT re.cedula_visitante) AS visitantes, 
       COUNT(ev.id) AS ocupaciones
FROM parque_natural pn
LEFT JOIN registro_entrada re ON pn.id = re.id_parque
LEFT JOIN alojamiento a ON pn.id = a.id_parque
LEFT JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
GROUP BY pn.nombre
ORDER BY visitantes DESC;

-- 100. Porcentaje de ocupación de cada alojamiento

SELECT a.nombre AS alojamiento, 
       ROUND((COUNT(ev.id) / a.capacidad) * 100, 2) AS porcentaje_ocupacion
FROM alojamiento a
LEFT JOIN estancia_visitante ev ON a.id = ev.id_alojamiento
GROUP BY a.id, a.nombre
ORDER BY porcentaje_ocupacion DESC;




