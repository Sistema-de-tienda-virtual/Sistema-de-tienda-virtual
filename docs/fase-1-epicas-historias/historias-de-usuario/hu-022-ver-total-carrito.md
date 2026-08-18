# HU-022 — Ver el total del carrito

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-04 — Carrito de compras |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** ver el total de mi carrito antes de confirmar el pedido
**para** saber cuánto voy a pagar.

## Criterios de aceptación

**CA-1 — Cálculo correcto del total**
- **Dado** que tengo varios productos con distintas cantidades en el carrito
- **Cuando** veo el resumen del carrito
- **Entonces** el sistema muestra el subtotal por línea (precio × cantidad) y el total
  general, sumando todas las líneas

**CA-2 — Total actualizado al modificar el carrito**
- **Dado** que estoy viendo el total del carrito
- **Cuando** modifico una cantidad (HU-020) o elimino un ítem (HU-021)
- **Entonces** el total se recalcula automáticamente sin recargar la página

**CA-3 — Precio con promoción aplicada**
- **Dado** que un producto en el carrito tiene una promoción vigente (HU-014)
- **Cuando** veo el total
- **Entonces** el subtotal de esa línea refleja el precio con descuento

## Reglas de negocio asociadas

- RN-13: El precio del ítem es el vigente al momento de confirmar el pedido, no al
  agregarlo (ver HU-019).

## Notas y dependencias

- Depende de HU-019, HU-020 y HU-021.
- Precede a HU-026 (confirmar pedido).
