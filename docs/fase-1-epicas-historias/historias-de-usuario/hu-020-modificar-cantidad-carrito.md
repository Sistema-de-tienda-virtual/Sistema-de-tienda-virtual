# HU-020 — Modificar la cantidad de un ítem del carrito

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-04 — Carrito de compras |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** modificar la cantidad de un producto que ya está en mi carrito
**para** ajustar mi compra sin tener que eliminarlo y agregarlo de nuevo.

## Criterios de aceptación

**CA-1 — Aumentar cantidad dentro del stock disponible**
- **Dado** que tengo 2 unidades de un producto en el carrito y hay 6 disponibles
- **Cuando** cambio la cantidad a 5
- **Entonces** el carrito actualiza la línea a 5 unidades y recalcula el total

**CA-2 — Cantidad mayor al stock disponible**
- **Dado** que un producto tiene 4 unidades en stock
- **Cuando** intento cambiar su cantidad en el carrito a 6
- **Entonces** el sistema no permite el cambio y muestra "Solo hay 4 unidades disponibles"

**CA-3 — Cantidad en cero**
- **Dado** que tengo un producto en el carrito
- **Cuando** cambio su cantidad a 0
- **Entonces** el sistema elimina el producto del carrito (mismo efecto que HU-021)

## Reglas de negocio asociadas

- RN-10: No se puede superar el stock disponible (ver HU-019).

## Notas y dependencias

- Depende de HU-019 (agregar al carrito).
