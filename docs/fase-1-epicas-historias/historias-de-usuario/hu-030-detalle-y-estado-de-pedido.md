# HU-030 — Ver detalle y estado de un pedido

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** ver el detalle y el estado de un pedido específico
**para** revisar qué compré, para quién y cuándo llega.

## Criterios de aceptación

**CA-1 — Detalle completo**
- **Dado** que selecciono uno de mis pedidos
- **Cuando** entro a su detalle
- **Entonces** veo los productos, el destinatario, la dirección, la fecha/franja de
  entrega, la dedicatoria, el total y el estado actual

**CA-2 — Progreso visible del estado**
- **Dado** que estoy viendo el detalle de un pedido
- **Cuando** reviso su estado
- **Entonces** el sistema muestra en qué punto del ciclo está (Confirmado, En
  preparación, En camino, Entregado o Cancelado)

**CA-3 — Pedido de otro cliente**
- **Dado** que intento acceder a la URL del detalle de un pedido que no es mío
- **Cuando** el sistema valida el acceso
- **Entonces** no me permite verlo y muestra un error de acceso no autorizado

## Reglas de negocio asociadas

- RN-22: Ciclo de estados del pedido (ver HU-033).

## Notas y dependencias

- Depende de HU-029 (historial de pedidos) y HU-033 (estado del pedido).
