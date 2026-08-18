# HU-033 — Cambiar el estado de un pedido

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** cambiar el estado de un pedido (Confirmado, En preparación, En camino,
Entregado, Cancelado)
**para** informar al cliente el avance de su compra y organizar la operación del negocio.

## Criterios de aceptación

**CA-1 — Cambio de estado válido**
- **Dado** que un pedido está en estado "Confirmado"
- **Cuando** el administrador lo marca como "En preparación"
- **Entonces** el sistema actualiza el estado, registra la fecha/hora del cambio y el
  cliente puede verlo reflejado en el detalle de su pedido (HU-030)

**CA-2 — Transición no permitida**
- **Dado** que un pedido está en estado "Entregado"
- **Cuando** el administrador intenta cambiarlo a "En preparación"
- **Entonces** el sistema no permite ese cambio, porque no es una transición válida hacia
  atrás en el ciclo del pedido

**CA-3 — Cancelación desde el panel administrativo**
- **Dado** que un pedido está en estado "Confirmado" o "En preparación"
- **Cuando** el administrador lo marca como "Cancelado" e ingresa un motivo
- **Entonces** el sistema cambia el estado, libera el stock que había sido descontado
  (HU-038) y guarda el motivo de cancelación

**CA-4 — Pedido ya entregado**
- **Dado** que un pedido está en estado "Entregado"
- **Cuando** el administrador intenta cancelarlo
- **Entonces** el sistema no lo permite y muestra el mensaje "No se puede cancelar un
  pedido ya entregado"

## Reglas de negocio asociadas

- RN-22: Los estados de un pedido siguen un ciclo definido: Confirmado → En preparación →
  En camino → Entregado, con la posibilidad de pasar a Cancelado únicamente desde
  Confirmado o En preparación.
- RN-23: Cancelar un pedido libera el stock que se había descontado al confirmarlo.

## Notas y dependencias

- Depende de HU-026 (confirmación del pedido) y HU-038 (descuento de stock).
- Relacionada con HU-030 (cliente ve el detalle/estado), HU-034 (asignación de repartidor)
  y HU-036 (repartidor actualiza el estado de entrega).
- Definir en fase 2 la lista final y nombres exactos de los estados (pendiente de acordar
  con el equipo, ver `04-asignacion-equipo.md`).
