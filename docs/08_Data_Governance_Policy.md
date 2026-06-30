# GlobalStay Hotels

# Data Governance Policy

**Proyecto:** HR Analytics Platform

**Documento:** 08 - Data Governance Policy

**Versión:** 1.0

**Fecha:** 30/06/2026

---

# 1. Propósito

La presente política establece el marco de Gobierno del Dato para el proyecto **GlobalStay Hotels HR Analytics Platform**.

Su objetivo es garantizar que la información utilizada por la organización sea:

- precisa;
- consistente;
- confiable;
- trazable;
- segura;
- gobernada mediante responsabilidades claramente definidas.

Esta política aplica a todos los datos del dominio de Recursos Humanos utilizados en el Data Warehouse corporativo.

---

# 2. Objetivos

Los objetivos principales son:

- mejorar la calidad de los datos;
- asegurar la consistencia entre sistemas;
- establecer responsabilidades claras sobre los datos;
- definir el proceso de aprobación de modificaciones;
- garantizar la trazabilidad de todas las transformaciones realizadas por el Pipeline ETL.

---

# 3. Roles y responsabilidades

## Data Owner

**Área**

Corporate Human Resources

### Responsabilidades

- Propietario funcional de los datos.
- Aprobar reglas de negocio.
- Autorizar modificaciones sobre información funcional.
- Definir políticas de calidad.

---

## Data Steward

**Área**

HR Data Manager

### Responsabilidades

- Supervisar la calidad del dato.
- Mantener catálogos corporativos.
- Revisar incidencias detectadas.
- Coordinar acciones correctivas.

---

## Data Custodian

**Área**

Data Engineering

### Responsabilidades

- Implementar el Pipeline ETL.
- Aplicar transformaciones autorizadas.
- Garantizar la trazabilidad.
- Mantener la infraestructura de datos.
- Documentar todos los cambios realizados.

---

## Data Consumer

**Áreas**

- Recursos Humanos
- Dirección
- Business Intelligence
- People Analytics
- Finanzas

### Responsabilidades

- Utilizar la información para análisis y toma de decisiones.
- Reportar posibles inconsistencias detectadas.

---

# 4. Principios de Gobierno del Dato

GlobalStay Hotels adopta los siguientes principios:

## Calidad

Los datos deben cumplir criterios mínimos de calidad antes de ingresar al Data Warehouse.

---

## Integridad

Los datos deben representar fielmente la realidad del negocio.

---

## Consistencia

La información debe mantenerse uniforme entre todos los sistemas corporativos.

---

## Trazabilidad

Toda modificación realizada sobre un dato deberá quedar documentada.

---

## Responsabilidad

Cada conjunto de datos debe tener un responsable funcional claramente identificado.

---

## Transparencia

Todas las transformaciones implementadas por el ETL deberán encontrarse documentadas y justificadas.

---

# 5. Proceso de gestión de incidencias

El tratamiento de incidencias seguirá el siguiente flujo:

```
Detección

↓

Auditoría de Calidad

↓

Data Quality Report

↓

Revisión del Data Steward

↓

Aprobación del Data Owner

↓

Implementación ETL

↓

Registro en Change Log

↓

Carga al Data Warehouse
```

---

# 6. Reglas para modificaciones de datos

El equipo de Data Engineering podrá:

✅ eliminar duplicados autorizados;

✅ estandarizar valores utilizando catálogos oficiales;

✅ reconciliar datos maestros;

✅ generar columnas derivadas;

✅ crear indicadores de calidad.

No podrá:

❌ modificar datos personales sin autorización;

❌ completar información inexistente mediante estimaciones;

❌ alterar registros históricos sin aprobación del Data Owner.

---

# 7. Gestión de Quality Flags

Cuando una incidencia no pueda corregirse automáticamente, el Pipeline ETL generará una bandera de calidad (*Quality Flag*).

Estas banderas permiten:

- identificar registros afectados;
- preservar el dato original;
- facilitar futuras revisiones;
- evitar pérdida de información.

---

# 8. Documentación obligatoria

Toda modificación implementada deberá encontrarse respaldada por la siguiente documentación:

- Data Quality Report
- Business Approval
- Change Log
- ETL Pipeline Documentation

---

# 9. Versionado

Cada modificación relevante del Pipeline ETL deberá registrarse mediante una nueva versión del proyecto en GitHub.

Ejemplo:

| Versión  | Descripción    |
|----------|----------------|
| v0.1     | Diseño inicial |
| v0.2     | Generación RAW |
| v0.3     | Data Quality   |
| v0.4     | Pipeline ETL   |
| v0.5     | Data Warehouse |
| v0.6     | SQL Analytics  |
| v1.0     | Proyecto final |

---

# 10. Beneficios del Gobierno del Dato

La aplicación de esta política permite:

- aumentar la confianza en los datos;
- mejorar la calidad de los indicadores;
- reducir errores operativos;
- facilitar auditorías;
- garantizar la trazabilidad;
- fortalecer la toma de decisiones basada en datos.

---

# Estado

**Vigente**

---

# Fin del documento