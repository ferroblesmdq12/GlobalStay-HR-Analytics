# GlobalStay Hotels

# Business Approval for Data Corrections

**Proyecto:** HR Analytics Platform

**Documento:** 06 - Business Approval

**Versión:** 1.0

**Fecha:** 30/06/2026

---

# 1. Objetivo

El presente documento registra las decisiones adoptadas por las áreas responsables del negocio respecto de las incidencias detectadas durante la auditoría de calidad de datos realizada sobre el sistema HR Core.

Las decisiones aquí documentadas autorizan al equipo de Data Engineering a implementar determinadas transformaciones dentro del Pipeline ETL previo a la carga del Data Warehouse corporativo.

---

# 2. Participantes

| Área                      | Rol            |
|---------------------------|----------------|
| Corporate Human Resources | Data Owner     |
| HR Data Manager           | Data Steward   |
| Data Engineering          | Data Custodian |
| Business Intelligence     | Data Consumer  |

---

# 3. Antecedentes

Como resultado de la auditoría de calidad de datos (Documento 05 - Data Quality Report), se detectaron diversas inconsistencias que podrían afectar la calidad de la información utilizada para la toma de decisiones estratégicas.

Con el objetivo de garantizar la integridad del Data Warehouse corporativo, se llevó a cabo una revisión conjunta entre Recursos Humanos y el equipo de Data Engineering.

---

# 4. Decisiones adoptadas

## Incidencia 1

### Employee ID duplicados

**Cantidad**

15 registros.

### Decisión

Se confirma que los registros corresponden a duplicados generados durante un proceso histórico de consolidación de datos.

### Acción aprobada

✅ Eliminar registros duplicados conservando la primera ocurrencia.

**Estado**

APROBADO

---

## Incidencia 2

### Valores inconsistentes de Gender

**Cantidad**

20 registros.

### Decisión

Se confirma que las diferencias corresponden únicamente a variaciones de formato.

### Acción aprobada

✅ Estandarizar utilizando el catálogo corporativo.

**Estado**

APROBADO

---

## Incidencia 3

### Hotel Code

**Cantidad**

10 registros.

### Decisión

Los códigos PMI y PALMA corresponden al mismo establecimiento registrado oficialmente como HES001.

### Acción aprobada

✅ Reconciliar utilizando el catálogo maestro de hoteles.

**Estado**

APROBADO

---

## Incidencia 4

### Fechas de nacimiento futuras

**Cantidad**

5 registros.

### Decisión

Recursos Humanos confirma que no es posible determinar la fecha correcta a partir de la información actualmente disponible.

Modificar estos registros implicaría alterar información personal sin evidencia suficiente.

### Acción aprobada

❌ No corregir automáticamente.

✅ Mantener el registro.

✅ Generar una Quality Flag.

**Estado**

APROBADO

---

## Incidencia 5

### Empleados inactivos sin fecha de baja

**Cantidad**

38 registros.

### Decisión

Se confirma que las fechas de baja no pudieron recuperarse durante la migración desde el sistema anterior.

No existe evidencia documental suficiente para imputar una fecha de finalización.

### Acción aprobada

❌ No completar automáticamente la fecha.

✅ Mantener NULL.

✅ Generar una Quality Flag.

**Estado**

APROBADO

---

# 5. Autorización para Data Engineering

Con base en las decisiones adoptadas durante esta reunión, el área de Recursos Humanos autoriza al equipo de Data Engineering a implementar exclusivamente las transformaciones aprobadas en el presente documento.

Cualquier modificación adicional sobre datos funcionales deberá ser previamente evaluada y autorizada por el Data Owner.

---

# 6. Impacto esperado

La implementación de las acciones aprobadas permitirá:

- mejorar la calidad de los datos;
- aumentar la consistencia del modelo dimensional;
- reducir errores en indicadores de RRHH;
- garantizar la trazabilidad de las modificaciones realizadas.

---

# 7. Próximo paso

Las decisiones aprobadas serán registradas en el documento:

```
07_Change_Log.md
```

donde se documentará cada transformación aplicada por el Pipeline ETL.

---

# Estado

**Aprobado por el Data Owner**

✅ AUTORIZADO PARA IMPLEMENTACIÓN

---

# Fin del documento