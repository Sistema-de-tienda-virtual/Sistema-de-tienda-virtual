# HU-031 — Cancelar un pedido no despachado

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Baja |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** cancelar un pedido que aún no ha sido despachado
**para** arrepentirme a tiempo si cambié de opinión.

## Criterios de aceptación

**CA-1 — Cancelación exitosa**
- **Dado** que mi pedido está en estado "Confirmado"
- **Cuando** presiono "Cancelar pedido" y confirmo la acción
- **Entonces** el sistema cambia el estado a "Cancelado" y libera el stock reservado
  (ver RN-23 en HU-033)

**CA-2 — Pedido ya en preparación o despachado**
- **Dado** que mi pedido está en estado "En preparación", "En camino" o "Entregado"
- **Cuando** intento cancelarlo
- **Entonces** el sistema no lo permite y muestra "Este pedido ya no se puede cancelar;
  contacta a la floristería"

**CA-3 — Confirmación antes de cancelar**
- **Dado** que presiono "Cancelar pedido"
- **Cuando** el sistema me pide confirmación
- **Entonces** el pedido solo se cancela si confirmo la acción

## Reglas de negocio asociadas

- RN-22, RN-23 (ver HU-033).

## Notas y dependencias

- Depende de HU-030 (detalle del pedido) y HU-033 (estados del pedido).
