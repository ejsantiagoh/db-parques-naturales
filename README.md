# db-parques-naturales
# 📌 Proyecto: Base de Datos para Parques Naturales

## 📖 Descripción del Proyecto

Este proyecto consiste en el diseño e implementación de una base de datos para la gestión de parques naturales. Su propósito es almacenar y administrar información clave sobre áreas protegidas, especies, personal, visitantes, alojamientos y proyectos de investigación.

Las funcionalidades principales incluyen:

- Registro de parques y su relación con departamentos y entidades responsables.
- Gestión de áreas dentro de los parques y el inventario de especies.
- Administración del personal de diferentes categorías (gestión, vigilancia, conservación e investigación).
- Registro de visitantes, sus entradas a los parques y estancias en alojamientos.
- Control de costos operativos de proyectos de investigación.
- Automatización de reportes y actualizaciones con eventos y triggers.

## 🖥️ Requisitos del Sistema

Para ejecutar este proyecto, se requiere:

- **Sistema Operativo**: Windows, Linux o macOS.
- **Base de Datos**: MySQL (versión 8.0 o superior recomendada).
- **Herramienta de Administración**: DBeaver o MySQL Workbench.
- **Editor de Código**: Cualquier editor compatible con archivos SQL.

## ⚙️ Instalación y Configuración

1. **Crear la base de datos**

   - Ejecutar `ddl.sql` para generar la estructura de la base de datos.
   - Asegurar que todas las tablas se crean correctamente.

2. **Cargar datos iniciales**

   - Ejecutar `dml.sql` para poblar la base de datos con datos de prueba.

3. **Ejecutar funcionalidades avanzadas**

   - Cargar y ejecutar los procedimientos almacenados, funciones, triggers y eventos.

## 🏗️ Estructura de la Base de Datos

La base de datos está compuesta por varias tablas organizadas en diferentes módulos:

- **Gestión de parques**: `parque_natural`, `departamento`, `entidad_responsable`, `parque_departamento`.
- **Áreas y especies**: `area`, `especie`.
- **Personal**: `personal`, `personal_gestion`, `personal_vigilancia`, `personal_conservacion`, `personal_investigador`.
- **Visitantes y alojamientos**: `visitante`, `registro_entrada`, `alojamiento`, `estancia_visitante`.
- **Proyectos de investigación**: `proyecto_investigacion`, `proyecto_especie_investigador`.

## 🔍 Ejemplos de Consultas

### 📊 Consultar la cantidad de parques por departamento:

```sql
select d.nombre as departamento, count(pd.id_parque) as cantidad_parques
from departamento d
left join parque_departamento pd on d.id = pd.id_departamento
group by d.nombre;
```

### 🦉 Obtener el número total de especies por tipo en un parque específico:

```sql
select e.denominacion_cientifica, e.denominacion_vulgar, e.tipo 
from especie e
join area a on e.id_area = a.id
join parque_natural p on a.id_parque = p.id
where p.nombre = 'parque nacional natural la macarena';
```

## ⚡ Procedimientos, Funciones, Triggers y Eventos

- **Procedimientos Almacenados**: Permiten consultas y cálculos avanzados sobre personal, parques y especies.
- **Funciones**: Realizan cálculos específicos, como costos operativos y estimaciones de ocupación.
- **Triggers**: Actualizan inventarios y registran cambios salariales en tiempo real.
- **Eventos**: Automatizan reportes y actualizaciones periódicas de datos clave.

### Ejemplo de Uso de un Procedimiento

```sql
call listar_proyectos_activos('2024-06-01');
```

## 🔑 Roles de Usuario y Permisos

Se han creado 5 roles de usuario en la base de datos:

1. **Administrador**: Control total sobre la base de datos.
2. **Gestor de parques**: Puede modificar información de parques y áreas.
3. **Investigador**: Acceso a datos de especies y proyectos.
4. **Guardaparques**: Acceso a información de vigilancia y patrullas.
5. **Visitante**: Acceso restringido a consulta de información pública.

### Creación de un Usuario y Asignación de Rol

```sql
create user administrador@localhost identified by "1234";
grant all privileges on parques_naturales.* to administrador@localhost;
```

## 👥 Contribuciones

Este proyecto ha sido desarrollado en su totalidad por un único desarrollador.

## 📜 Licencia y Contacto

Este proyecto se distribuye bajo la licencia MIT. Para consultas o sugerencias, contactar a:
📧 **[correo@example.com](mailto\:santiagohdzeimer.97@gmail.com)**

