# HU-021 — Eliminar un ítem del carrito

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-04 — Carrito de compras |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** eliminar un producto de mi carrito
**para** quitar lo que ya no quiero comprar.

## Criterios de aceptación

**CA-1 — Eliminación exitosa**
- **Dado** que tengo un producto en el carrito
- **Cuando** presiono "Eliminar" sobre esa línea
- **Entonces** el sistema quita el producto del carrito y recalcula el total

**CA-2 — Carrito queda vacío**
- **Dado** que el producto eliminado era el único en mi carrito
- **Cuando** lo elimino
- **Entonces** el sistema muestra el carrito vacío con un mensaje invitando a seguir
  comprando

**CA-3 — Confirmación antes de eliminar**
- **Dado** que presiono "Eliminar" sobre un ítem
- **Cuando** el sistema me pide confirmación
- **Entonces** el producto solo se elimina si confirmo la acción

## Reglas de negocio asociadas

- Ninguna adicional a las de HU-019.

## Notas y dependencias

- Depende de HU-019 (agregar al carrito).
