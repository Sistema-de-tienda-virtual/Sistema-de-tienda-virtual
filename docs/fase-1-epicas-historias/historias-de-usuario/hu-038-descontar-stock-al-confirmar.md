# HU-038 — Descontar stock al confirmar un pedido

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-07 — Gestión de inventario |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** sistema
**quiero** descontar automáticamente el stock de cada producto al confirmarse un pedido
**para** mantener el inventario exacto y evitar vender lo que no hay.

## Criterios de aceptación

**CA-1 — Descuento exitoso**
- **Dado** que un pedido se confirma con 3 unidades de un producto que tiene 10 en stock
- **Cuando** el pedido pasa a estado "Confirmado"
- **Entonces** el stock del producto queda en 7 y se registra el movimiento de tipo
  "Venta"

**CA-2 — Concurrencia: dos clientes confirman al mismo tiempo**
- **Dado** que un producto tiene 2 unidades en stock
- **Cuando** dos clientes intentan confirmar al mismo tiempo un pedido con 2 unidades cada
  uno
- **Entonces** el sistema solo permite confirmar al primero que complete la operación; al
  segundo le informa que ya no hay stock suficiente (ver CA-3 de HU-026)

**CA-3 — Liberación de stock al cancelar**
- **Dado** que un pedido confirmado se cancela (HU-031 o HU-033)
- **Cuando** el cambio de estado se procesa
- **Entonces** el sistema devuelve al stock disponible las unidades que había descontado

## Reglas de negocio asociadas

- RN-G3, RN-G4 (ver `01-definicion-del-proyecto.md`).
- RN-23: Cancelar un pedido libera el stock que se había descontado (ver HU-033).

## Notas y dependencias

- Depende de HU-026 (confirmar pedido) y HU-037 (stock registrado).
