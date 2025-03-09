-- Roles de usuario y accesos

use parques_naturales;

-- Administrador: acceso total.
-- Tiene todos los privilegios sobre la base de datos parques_naturales.

create user administrador@localhost identified by "1234";
grant all privileges on parques_naturales.* to administrador@localhost;
flush privileges;
show grants for administrador@localhost;

-- Gestor de parques: gestión de parques, áreas y especies.
-- Puede administrar parques, áreas y especies (lectura, inserción, modificación y eliminación en esas tablas).

create user gestor_parques@localhost identified by "gestor123";
grant select, insert, update, delete on parques_naturales.parque_natural to gestor_parques@localhost;
grant select, insert, update, delete on parques_naturales.area to gestor_parques@localhost;
grant select, insert, update, delete on parques_naturales.especie to gestor_parques@localhost;
flush privileges;
show grants for gestor_parques@localhost;

-- Investigador: acceso a datos de proyectos y especies.
-- Solo tiene acceso de lectura a proyectos de investigación y especies.

create user investigador@localhost identified by "investiga123";
grant select on parques_naturales.proyecto_investigacion to investigador@localhost;
grant select on parques_naturales.proyecto_especie_investigador to investigador@localhost;
grant select on parques_naturales.especie to investigador@localhost;
flush privileges;
show grants for investigador@localhost;

-- Auditor: acceso a reportes financieros.
-- Puede consultar reportes financieros, pero no modificarlos.

create user auditor@localhost identified by "auditor123";
grant select on parques_naturales.reporte_financiero to auditor@localhost;
flush privileges;
show grants for auditor@localhost;

-- Encargado de visitantes: gestión de visitantes y alojamientos.
-- Tiene control total sobre visitantes y alojamientos (puede leer, insertar, modificar y eliminar en esas tablas).

create user encargado_visitantes@localhost identified by "visitantes123";
grant select, insert, update, delete on parques_naturales.visitante to encargado_visitantes@localhost;
grant select, insert, update, delete on parques_naturales.registro_entrada to encargado_visitantes@localhost;
grant select, insert, update, delete on parques_naturales.alojamiento to encargado_visitantes@localhost;
grant select, insert, update, delete on parques_naturales.estancia_visitante to encargado_visitantes@localhost;
flush privileges;
show grants for encargado_visitantes@localhost;
