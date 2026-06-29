# Sprint 3 - Diseño e Implementación del Pipeline ETL

## Proyecto

**GlobalStay Hotels - HR Analytics Platform**

---

# Objetivo del Sprint

El objetivo del Sprint 3 fue diseñar e implementar un pipeline ETL modular capaz de transformar los datos RAW del sistema HR Core en un dataset limpio (Silver Layer), aplicando reglas de calidad de datos, estandarización y validación previamente identificadas durante el Sprint 2.

Durante este Sprint se construyó una arquitectura desacoplada basada en módulos independientes, siguiendo principios de Ingeniería de Datos y buenas prácticas de desarrollo de software.

---

# Objetivos específicos

- Diseñar la arquitectura del pipeline ETL.
- Centralizar la configuración del proyecto.
- Implementar la extracción del dataset RAW.
- Automatizar la validación de calidad de datos.
- Aplicar transformaciones de limpieza y estandarización.
- Generar automáticamente la capa Silver.
- Construir un pipeline reutilizable y escalable.

---

# Arquitectura del Pipeline

```
RAW DATA
    │
    ▼
Extract
    │
    ▼
Validation (Pre ETL)
    │
    ▼
Transform
    │
    ▼
Validation (Post ETL)
    │
    ▼
Load
    │
    ▼
Silver Layer
    │
    ▼
Logger
```

---

# Arquitectura del proyecto

```
etl/
│
├── __init__.py
├── config.py
├── extract.py
├── validation.py
├── transform.py
├── load.py
├── logger.py
└── pipeline.py
```

Cada módulo tiene una única responsabilidad, siguiendo el principio **Single Responsibility Principle (SRP)**.

---

# Descripción de los módulos

## config.py

Centraliza toda la configuración del proyecto.

Incluye:

- rutas del proyecto
- archivos RAW y Silver
- fecha de referencia
- catálogo oficial de hoteles
- reglas de estandarización de género
- parámetros del negocio

---

## extract.py

Responsable de leer el dataset RAW.

Salida:

- DataFrame de Pandas

---

## validation.py

Contiene todas las reglas de calidad del HR Core.

Validaciones implementadas:

- employee_id duplicado
- gender válido
- hotel_code válido
- fechas de nacimiento futuras
- fechas de contratación futuras
- fechas de baja futuras
- bajas anteriores a contratación
- empleados activos con fecha de baja
- empleados inactivos sin fecha de baja
- edad mínima laboral

---

## transform.py

Implementa las reglas de limpieza.

Transformaciones realizadas:

- eliminación de duplicados
- estandarización de gender
- reconciliación de hotel_code
- conversión de fechas
- cálculo de edad
- generación de banderas de calidad
- preparación de la capa Silver

---

## load.py

Guarda automáticamente el resultado del ETL en:

```
data/silver/hr_core_employees_clean.csv
```

---

## logger.py

Genera un resumen de la ejecución del pipeline.

Incluye:

- registros RAW
- registros Silver
- validaciones antes del ETL
- validaciones después del ETL
- estado final del pipeline

---

## pipeline.py

Orquesta la ejecución completa del proceso ETL.

Flujo:

1. Extract
2. Validation
3. Transform
4. Validation
5. Load
6. Logger

---

# Resultados obtenidos

## Dataset RAW

Registros:

```
2715
```

## Dataset Silver

Registros:

```
2700
```

---

# Mejoras aplicadas automáticamente

El pipeline corrigió exitosamente:

- eliminación de 15 registros duplicados
- estandarización de valores de género
- reconciliación de códigos de hotel
- conversión de columnas de fecha
- cálculo automático de edad

---

# Incidencias conservadas deliberadamente

No todas las inconsistencias fueron corregidas automáticamente.

Se mantuvieron para preservar la trazabilidad del dato:

- fechas de nacimiento futuras
- empleados menores de edad
- empleados inactivos sin fecha de baja

En lugar de modificar estos registros, el pipeline genera **banderas de calidad (Quality Flags)** para que puedan ser revisados posteriormente por el área de negocio.

Esta decisión sigue el principio de **Data Governance**, evitando alterar datos cuando no existe una regla de negocio que lo justifique.

---

# Tecnologías utilizadas

- Python 3
- Pandas
- Pathlib
- VS Code
- Git
- GitHub

---

# Principios de Ingeniería aplicados

Durante el desarrollo del Sprint se aplicaron los siguientes principios:

- Modularidad
- Single Responsibility Principle (SRP)
- Reutilización de código
- Configuración centralizada
- Validación antes y después del ETL
- Trazabilidad del dato
- Data Quality
- Data Governance

---

# Lessons Learned

Este Sprint permitió transformar un proceso manual de limpieza de datos en un pipeline ETL completamente automatizado.

La principal enseñanza fue comprender que un proceso ETL no consiste únicamente en transformar datos, sino en diseñar una arquitectura mantenible, escalable y fácilmente reutilizable.

Asimismo, se comprobó la importancia de separar las responsabilidades entre extracción, validación, transformación y carga, facilitando futuras ampliaciones del proyecto.

---

# Próximo Sprint

## Sprint 4

Durante el Sprint 4 se construirá el **Data Warehouse en PostgreSQL**, donde la capa Silver será utilizada como fuente para alimentar un modelo dimensional basado en Star Schema.

El objetivo será diseñar las tablas de dimensiones y hechos, cargar los datos transformados y preparar la infraestructura necesaria para realizar consultas analíticas mediante SQL.

---

# Estado del Sprint

**Sprint 3:** ✅ Finalizado

Pipeline ETL completamente funcional.