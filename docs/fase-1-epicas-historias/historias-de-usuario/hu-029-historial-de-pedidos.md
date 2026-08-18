# HU-029 — Ver historial de mis pedidos

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** ver el historial de mis pedidos
**para** hacer seguimiento a mis compras.

## Criterios de aceptación

**CA-1 — Listado de pedidos propios**
- **Dado** que he confirmado uno o más pedidos
- **Cuando** entro a "Mis pedidos"
- **Entonces** veo cada pedido con su número, fecha, estado y total, ordenados del más
  reciente al más antiguo

**CA-2 — Sin pedidos**
- **Dado** que no he confirmado ningún pedido
- **Cuando** entro a "Mis pedidos"
- **Entonces** el sistema muestra "Aún no tienes pedidos"

**CA-3 — Solo veo mis propios pedidos**
- **Dado** que estoy autenticado como cliente
- **Cuando** consulto mi historial
- **Entonces** el sistema muestra únicamente pedidos hechos con mi cuenta, nunca los de
  otro cliente

## Reglas de negocio asociadas

- Ninguna adicional.

## Notas y dependencias

- Depende de HU-026 (confirmar pedido).
- Precede a HU-030 (detalle de pedido).
