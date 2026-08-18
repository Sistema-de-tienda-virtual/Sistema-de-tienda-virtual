# HU-017 — Filtrar por rango de precio

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-03 — Búsqueda y navegación |
| **Prioridad** | Media |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** visitante
**quiero** filtrar los productos por un rango de precio
**para** ajustarme a mi presupuesto.

## Criterios de aceptación

**CA-1 — Filtro aplicado correctamente**
- **Dado** que ingreso un precio mínimo y uno máximo
- **Cuando** aplico el filtro
- **Entonces** el sistema muestra solo los productos activos cuyo precio está dentro de
  ese rango

**CA-2 — Rango inválido**
- **Dado** que ingreso un precio mínimo mayor al precio máximo
- **Cuando** intento aplicar el filtro
- **Entonces** el sistema muestra un mensaje de error y no aplica el filtro

**CA-3 — Sin productos en el rango**
- **Dado** que ningún producto activo cae dentro del rango indicado
- **Cuando** aplico el filtro
- **Entonces** el sistema muestra "No hay productos en ese rango de precio"

## Reglas de negocio asociadas

- RN-37: Solo se muestran productos activos (ver HU-007).

## Notas y dependencias

- Depende de HU-007 (listado de productos).
- Se puede combinar con HU-015 y HU-016.
