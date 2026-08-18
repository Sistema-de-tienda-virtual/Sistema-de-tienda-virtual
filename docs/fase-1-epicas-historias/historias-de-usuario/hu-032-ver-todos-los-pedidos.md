# HU-032 — Ver todos los pedidos (administrador)

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** ver todos los pedidos del negocio
**para** gestionar la operación del día a día.

## Criterios de aceptación

**CA-1 — Listado completo**
- **Dado** que existen pedidos confirmados
- **Cuando** entro al panel de pedidos
- **Entonces** veo todos los pedidos con número, cliente, destinatario, fecha/franja de
  entrega, total y estado

**CA-2 — Filtrar por estado**
- **Dado** que estoy en el panel de pedidos
- **Cuando** filtro por estado "En preparación"
- **Entonces** el sistema muestra solo los pedidos en ese estado

**CA-3 — Filtrar por fecha de entrega**
- **Dado** que estoy en el panel de pedidos
- **Cuando** filtro por una fecha de entrega específica
- **Entonces** el sistema muestra únicamente los pedidos programados para esa fecha,
  útil para organizar el día de reparto

## Reglas de negocio asociadas

- Ninguna adicional.

## Notas y dependencias

- Depende de HU-026 (confirmar pedido).
- Precede a HU-033 (cambiar estado) y HU-034 (asignar repartidor).
