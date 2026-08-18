# HU-036 — Actualizar el estado de la entrega

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** repartidor
**quiero** marcar un pedido asignado como "En camino" o "Entregado"
**para** informar al cliente y al administrador el avance real de la entrega.

## Criterios de aceptación

**CA-1 — Marcar "En camino"**
- **Dado** que tengo un pedido asignado en estado "En preparación"
- **Cuando** salgo a repartirlo y lo marco como "En camino"
- **Entonces** el sistema actualiza el estado del pedido y el cliente puede verlo en el
  detalle de su pedido (HU-030)

**CA-2 — Marcar "Entregado"**
- **Dado** que tengo un pedido en estado "En camino"
- **Cuando** confirmo la entrega y lo marco como "Entregado"
- **Entonces** el sistema registra la fecha/hora real de entrega y el pedido queda cerrado

**CA-3 — Intentar actualizar un pedido no asignado a mí**
- **Dado** que un pedido está asignado a otro repartidor
- **Cuando** intento cambiar su estado
- **Entonces** el sistema no me permite modificarlo, porque solo puedo actualizar los
  pedidos que tengo asignados

**CA-4 — Entrega fallida**
- **Dado** que tengo un pedido en estado "En camino"
- **Cuando** no logro entregarlo (dirección errada, destinatario ausente) y lo marco como
  "No entregado"
- **Entonces** el sistema registra el motivo y notifica al administrador para que decida
  reprogramar o cancelar

## Reglas de negocio asociadas

- RN-26: Un repartidor solo puede actualizar el estado de los pedidos que tiene asignados.
- RN-27: La fecha/hora real de entrega queda registrada al marcar un pedido como
  "Entregado", además de la fecha/franja que el cliente había solicitado (HU-024).

## Notas y dependencias

- Depende de HU-034 (asignación de repartidor).
- Relacionada con HU-030 (cliente ve el estado) y HU-033 (estados administrados por el
  administrador).
