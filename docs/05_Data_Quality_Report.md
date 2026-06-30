# GlobalStay Hotels

# Data Quality Assessment Report

**Proyecto:** HR Analytics Platform

**Documento:** 05 - Data Quality Report

**Versión:** 1.0

**Fecha:** 30/06/2026

**Preparado por:** Data Engineering Team

---

# 1. Resumen Ejecutivo

Como parte del proyecto **GlobalStay Hotels HR Analytics Platform**, el equipo de Data Engineering realizó una auditoría integral sobre el conjunto de datos del sistema **HR Core** correspondiente al período comprendido entre el 01/01/2020 y el 10/06/2026.

El objetivo de esta auditoría fue evaluar la calidad, consistencia e integridad de los datos antes de su incorporación al Data Warehouse corporativo.

Durante la revisión se detectaron diversas incidencias que podrían afectar la confiabilidad de los indicadores estratégicos de Recursos Humanos, tales como Headcount, Turnover Rate, Attrition y otros KPIs corporativos.

Este documento resume los hallazgos y presenta las recomendaciones técnicas elevadas al área de Recursos Humanos para su evaluación y aprobación.

---

# 2. Alcance

La auditoría incluyó la validación de:

- estructura del dataset
- duplicados
- valores nulos
- consistencia de atributos categóricos
- integridad temporal
- reglas de negocio
- calidad del Master Data

Dataset auditado:

```
hr_core_employees.csv
```

Cantidad de registros:

```
2715
```

---

# 3. Hallazgos

## 3.1 Employee ID duplicados

**Resultado**

15 registros duplicados.

### Riesgo

- sobreestimación del Headcount
- duplicación de empleados
- errores en métricas corporativas

### Recomendación

Eliminar registros duplicados conservando la primera aparición.

Prioridad:

**Alta**

---

## 3.2 Valores inconsistentes en Gender

Se detectaron los siguientes valores:

```
Male
male
M
Female
F
```

### Riesgo

Fragmentación de categorías.

Errores en dashboards.

Problemas en segmentaciones.

### Recomendación

Estandarizar todos los valores utilizando el catálogo corporativo.

Prioridad:

**Alta**

---

## 3.3 Hotel Code

Se detectaron códigos no pertenecientes al catálogo oficial.

Valores encontrados:

```
PMI

PALMA
```

### Riesgo

Errores en análisis por hotel.

Problemas durante la integración con el Data Warehouse.

### Recomendación

Reconciliar utilizando el catálogo maestro de hoteles.

Prioridad:

**Alta**

---

## 3.4 Fechas de nacimiento futuras

Se detectaron:

```
5 registros
```

### Riesgo

Imposibilidad de calcular edad.

KPIs incorrectos.

Incumplimiento de reglas de negocio.

### Recomendación

Elevar el caso al Data Owner.

No modificar automáticamente.

Prioridad:

**Alta**

---

## 3.5 Empleados inactivos sin fecha de baja

Se detectaron:

```
38 registros
```

### Riesgo

Errores en:

- Turnover
- Attrition
- Headcount histórico
- Antigüedad

### Recomendación

Solicitar revisión al área de Recursos Humanos.

No imputar fechas automáticamente.

Prioridad:

**Media**

---

# 4. Resumen de incidencias

| Incidencia | Registros      | Severidad |
|------------|----------------|-----------|
| Employee ID duplicados      | 15 | Alta |
| Gender inconsistente        | 20 | Alta |
| Hotel Code inválido         | 10 | Alta |
| Birth Date futura           | 5  | Alta |
| Inactivos sin fecha de baja | 38 | Media|

---

# 5. Recomendaciones del equipo de Data Engineering

El equipo recomienda:

- eliminar registros duplicados;
- estandarizar valores de género;
- reconciliar códigos de hotel;
- mantener las fechas futuras sin modificación hasta recibir autorización del Data Owner;
- mantener los empleados inactivos sin fecha de baja hasta que Recursos Humanos determine la acción correspondiente.

Todas las modificaciones que impliquen alterar información funcional deberán contar con aprobación expresa del Data Owner.

---

# 6. Estado

**Estado del informe**

🟡 Pendiente de revisión por Recursos Humanos.

---

# 7. Próximo paso

Este documento será presentado al área de Recursos Humanos para su análisis.

Las decisiones adoptadas serán documentadas en el documento:

```
06_Business_Approval.md
```

y servirán como autorización formal para las modificaciones implementadas posteriormente en el proceso ETL y en la carga del Data Warehouse.

---

# Fin del documento