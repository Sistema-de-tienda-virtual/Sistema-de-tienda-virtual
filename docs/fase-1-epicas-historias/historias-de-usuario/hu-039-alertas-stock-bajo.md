# HU-039 — Ver alertas de stock bajo

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-07 — Gestión de inventario |
| **Prioridad** | Media |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** ver una alerta cuando el stock de un producto esté por debajo de un umbral
mínimo
**para** reabastecerlo a tiempo y no quedarme sin flores disponibles.

## Criterios de aceptación

**CA-1 — Alerta visible**
- **Dado** que un producto tiene un stock mínimo configurado de 5 y su stock actual baja a
  3
- **Cuando** el administrador entra al panel de inventario
- **Entonces** ese producto aparece resaltado en una lista de "Stock bajo"

**CA-2 — Producto vuelve a estar por encima del mínimo**
- **Dado** que un producto en alerta de stock bajo recibe una entrada de inventario
  (HU-037)
- **Cuando** su stock supera el mínimo configurado
- **Entonces** deja de aparecer en la lista de alertas

**CA-3 — Sin umbral configurado**
- **Dado** que un producto no tiene stock mínimo configurado
- **Cuando** su stock baja
- **Entonces** el sistema no genera alerta para ese producto hasta que se configure un
  umbral

## Reglas de negocio asociadas

- RN-47: El stock mínimo para alertar es configurable por producto; si no se configura, no
  hay alerta.

## Notas y dependencias

- Depende de HU-037 (stock) y HU-038 (descuento por venta).
