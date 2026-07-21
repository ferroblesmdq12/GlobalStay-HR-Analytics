# 🏨 GlobalStay Hotels

## Plataforma End-to-End de HR Analytics e Ingeniería de Datos

Proyecto de portafolio que simula la plataforma analítica de una cadena hotelera internacional, desarrollando un flujo completo de datos desde la generación de información hasta la visualización de indicadores de negocio.

El proyecto implementa un proceso integral que incluye generación de datos sintéticos, validación de calidad, Pipeline ETL, Data Warehouse en PostgreSQL, consultas SQL analíticas y un Dashboard interactivo en Power BI para el análisis de Recursos Humanos.

---

# 🚀 Estado del Proyecto

**Versión actual:** `v1.0`

| Componente | Estado |
|------------|:------:|
| Generador de datos sintéticos | ✅ |
| Análisis Exploratorio de Datos (EDA) | ✅ |
| Calidad de Datos | ✅ |
| Data Governance | ✅ |
| Pipeline ETL | ✅ |
| Capa Silver | ✅ |
| PostgreSQL Staging | ✅ |
| Data Warehouse (Star Schema) | ✅ |
| Consultas SQL Analíticas | ✅ |
| Dashboard Power BI | ✅ |

---

# 🎯 Problema de Negocio

En muchas organizaciones, la información de Recursos Humanos se encuentra distribuida en distintos sistemas operacionales, dificultando la generación de reportes confiables y la toma de decisiones.

Este proyecto propone una arquitectura analítica que centraliza la información, mejora la calidad de los datos y proporciona una fuente única de información para el análisis ejecutivo.

---

# 📌 Objetivos

- Centralizar la información de Recursos Humanos.
- Implementar un Pipeline ETL automatizado.
- Validar y mejorar la calidad de los datos.
- Diseñar un Data Warehouse con modelo dimensional.
- Crear consultas SQL reutilizables.
- Desarrollar un Dashboard ejecutivo en Power BI.

---

# 🏗️ Arquitectura

```text
Sistemas Operacionales
        │
        ▼
Generación de Datos (RAW)
        │
        ▼
Pipeline ETL (Python)
        │
        ▼
Capa Silver
        │
        ▼
PostgreSQL (Staging)
        │
        ▼
Data Warehouse
        │
        ▼
Vista Analítica
        │
        ▼
Power BI Dashboard
```

---

# 🛠️ Tecnologías Utilizadas

### Lenguajes

- Python
- SQL

### Procesamiento de Datos

- Pandas
- NumPy
- SQLAlchemy

### Base de Datos

- PostgreSQL
- pgAdmin 4

### Business Intelligence

- Power BI
- DAX

### Desarrollo

- Git
- GitHub
- Visual Studio Code

---

# 📊 El Proyecto en Números

| Indicador | Valor |
|-----------|------:|
| Países | 4 |
| Hoteles | 9 |
| Departamentos | 10 |
| Empleados | 2.700 |
| Registros RAW | 2.715 |
| Registros Silver | 2.700 |
| Tablas de Dimensión | 7 |
| Tabla de Hechos | 1 |
| Dashboard | 4 páginas |

---

# 🔄 Pipeline ETL

El Pipeline ETL fue desarrollado en Python con una arquitectura modular.

```text
Extract
   ↓
Validate
   ↓
Transform
   ↓
Load Silver
   ↓
Load PostgreSQL
```

Durante este proceso se implementan reglas de negocio, validaciones de calidad, estandarización de datos y generación de indicadores de calidad.

---

# 🗄️ Data Warehouse

El Data Warehouse fue implementado en PostgreSQL utilizando un modelo dimensional tipo **Star Schema**.

Incluye:

- 7 tablas de dimensión.
- 1 tabla de hechos.
- Vista analítica para consumo desde Power BI.
- Consultas SQL para análisis de negocio.

---

# 📈 Dashboard Power BI

El Dashboard está compuesto por cuatro páginas:

### 🏠 Portada

Pantalla principal con navegación del proyecto.

### 📊 HR Executive Dashboard

- KPIs principales.
- Empleados por hotel.
- Empleados por país.
- Empleados por departamento.
- Activos vs. Inactivos.

### 👥 Workforce Analysis

- Distribución por género.
- Tipo de contrato.
- Nivel jerárquico.
- Antigüedad por hotel.
- Antigüedad por departamento.

### ✅ Data Quality

- Incidencias de calidad.
- Indicadores de calidad.
- Distribución de errores.
- Detalle de registros con incidencias.

> *(Agregar aquí las capturas del Dashboard.)*

---

# 📂 Estructura del Proyecto

```text
GlobalStay Hotels/
│
├── data/
├── docs/
├── etl/
├── notebooks/
├── reports/
├── scripts/
├── sql/
├── dashboards/
├── requirements.txt
└── README.md
```

---

# ▶️ Cómo Ejecutar el Proyecto

1. Clonar el repositorio.

```bash
git clone https://github.com/ferroblesmdq12/GlobalStay-Hotels.git
```

2. Instalar las dependencias.

```bash
pip install -r requirements.txt
```

3. Generar el dataset RAW.

```bash
python scripts/generate_raw_data.py
```

4. Ejecutar el Pipeline ETL.

```bash
python -m etl.pipeline
```

5. Cargar los datos en PostgreSQL.

```bash
python -m etl.postgres.staging_loader
```

6. Ejecutar los scripts SQL.

7. Conectar Power BI a la vista:

```text
dw.vw_employee_snapshot
```

---

# 📚 Documentación

La carpeta **docs/** contiene la documentación técnica completa del proyecto:

- Business Case
- Modelo de Recursos Humanos
- Diseño del Data Warehouse
- Diccionario de Datos
- Data Quality Report
- Data Governance
- Arquitectura PostgreSQL
- Roadmap del proyecto

---

# 🛣️ Roadmap

## ✅ Versión 1.0

- Generación de datos sintéticos.
- Pipeline ETL.
- Calidad de Datos.
- Data Warehouse.
- PostgreSQL.
- SQL Analítico.
- Dashboard Power BI.

## 🚀 Próximas Versiones

- Docker.
- Apache Airflow.
- dbt.
- Cargas Incrementales.
- Slowly Changing Dimensions (SCD).
- CI/CD.
- Despliegue en la nube.

---

# 💼 Competencias Demostradas

### Ingeniería de Datos

- Diseño de Pipelines ETL.
- Modelado Dimensional.
- PostgreSQL.
- SQL Analítico.
- Data Warehouse.

### Business Intelligence

- Power BI.
- DAX.
- Diseño de Dashboards.
- Storytelling con datos.

### Calidad y Gobierno del Dato

- Data Quality.
- Data Governance.
- Validación de reglas de negocio.
- Documentación técnica.

---

# 👨‍💻 Autor

**Fernando Raúl Robles**

Proyecto de Portafolio de Data Analytics & Data Engineering.

GitHub:
https://github.com/ferroblesmdq12

LinkedIn:
*(Agregar enlace)*

---

# 📄 Licencia

Este proyecto fue desarrollado con fines educativos y de portafolio.

Toda la información utilizada es sintética y no representa datos reales de personas ni de empresas.