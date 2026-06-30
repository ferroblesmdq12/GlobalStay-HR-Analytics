# GlobalStay Hotels

# Data Correction Change Log

**Proyecto:** HR Analytics Platform

**Documento:** 07 - Change Log

**Versión:** 1.0

**Fecha:** 30/06/2026

---

# 1. Objetivo

El presente documento registra todas las modificaciones implementadas por el equipo de Data Engineering sobre el dataset HR Core durante la ejecución del Pipeline ETL.

Cada cambio incluido en este registro cuenta con la correspondiente autorización del Data Owner, conforme al documento:

```
06_Business_Approval.md
```

Este registro garantiza la trazabilidad de las transformaciones realizadas antes de la carga del Data Warehouse corporativo.

---

# 2. Registro de cambios

| ID      | Fecha      | Campo            | Acción  | Registros | Responsable | Autorización |
|---------|------------|------------------|---------|-----------|-------------|--------------|
| CHG-001 | 30/06/2026 | employee_id      | Eliminación de registros duplicados | 15 | Data Engineering | Business Approval |
| CHG-002 | 30/06/2026 | gender           | Estandarización de valores | 20 | Data Engineering | Business Approval |
| CHG-003 | 30/06/2026 | hotel_code       | Reconciliación con catálogo maestro | 10 | Data Engineering | Business Approval |
| CHG-004 | 30/06/2026 | birth_date       | Generación de Quality Flag | 5 | Data Engineering | Business Approval |
| CHG-005 | 30/06/2026 | termination_date | Generación de Quality Flag | 38 | Data Engineering | Business Approval |

---

# 3. Cambios implementados

## CHG-001

### Campo

employee_id

### Acción

Eliminación de registros duplicados.

### Justificación

Evitar duplicidad de empleados e inconsistencias en los indicadores de RRHH.

### Resultado

15 registros eliminados.

---

## CHG-002

### Campo

gender

### Acción

Normalización utilizando el catálogo corporativo.

Valores transformados:

```
male → Male

M → Male

F → Female
```

### Resultado

20 registros actualizados.

---

## CHG-003

### Campo

hotel_code

### Acción

Reconciliación con el Master Data corporativo.

Transformaciones:

```
PMI → HES001

PALMA → HES001
```

### Resultado

10 registros corregidos.

---

## CHG-004

### Campo

birth_date

### Acción

No se modifica el dato.

Se incorpora:

```
invalid_birth_date_flag
```

### Justificación

No existe evidencia suficiente para determinar la fecha correcta.

---

## CHG-005

### Campo

termination_date

### Acción

No se modifica el dato.

Se incorpora:

```
inactive_without_termination_flag
```

### Justificación

No existe documentación suficiente para reconstruir la fecha de baja.

---

# 4. Resumen

| Tipo de acción | Cantidad |
|----------------|---------:|
| Registros eliminados | 15 |
| Valores estandarizados | 20 |
| Códigos reconciliados | 10 |
| Quality Flags generadas | 43 |

---

# 5. Versionado

Pipeline ETL

Versión:

```
v0.4
```

Estado:

```
Implementado
```

---

# 6. Próximo paso

Los datos corregidos serán cargados en el Data Warehouse durante el Sprint 4.

Las incidencias no corregidas permanecerán identificadas mediante Quality Flags para garantizar la trazabilidad y facilitar futuras revisiones por parte del área de Recursos Humanos.

---

# Estado

**IMPLEMENTADO**

---

# Fin del documento