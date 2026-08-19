# HU-035 — Consultar los pedidos asignados (repartidor)

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** repartidor
**quiero** consultar los pedidos que tengo asignados
**para** saber qué debo entregar, a quién y en qué dirección.

## Criterios de aceptación

**CA-1 — Listado de pedidos asignados**
- **Dado** que tengo pedidos asignados para hoy
- **Cuando** entro a mi panel de entregas
- **Entonces** veo cada pedido con destinatario, dirección, franja horaria y estado

**CA-2 — Sin pedidos asignados**
- **Dado** que no tengo pedidos asignados en este momento
- **Cuando** entro a mi panel
- **Entonces** el sistema muestra "No tienes entregas asignadas"

**CA-3 — Solo veo mis pedidos asignados**
- **Dado** que hay pedidos asignados a otros repartidores
- **Cuando** consulto mi panel
- **Entonces** el sistema no me muestra pedidos que no me fueron asignados a mí

## Reglas de negocio asociadas

- RN-26: Un repartidor solo ve y actualiza los pedidos que tiene asignados (ver HU-036).

## Notas y dependencias

- Depende de HU-034 (asignación de repartidor).
- Precede a HU-036 (actualizar estado de entrega).
