# HU-016 — Agregar producto al carrito

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-04 — Carrito de compras |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente de la tienda
**quiero** agregar un producto a mi carrito indicando la cantidad
**para** reunir varios productos y comprarlos en un solo pedido.

## Criterios de aceptación

**CA-1 — Agregar un producto disponible**
- **Dado** que veo el detalle de un producto con stock disponible
- **Cuando** indico una cantidad válida y presiono "Agregar al carrito"
- **Entonces** el producto queda en mi carrito con esa cantidad, el contador del carrito se actualiza y veo un mensaje de confirmación

**CA-2 — Producto ya presente en el carrito**
- **Dado** que el producto ya está en mi carrito con cantidad 2
- **Cuando** agrego 3 unidades más
- **Entonces** el carrito muestra una sola línea de ese producto con cantidad 5

**CA-3 — Cantidad mayor al stock**
- **Dado** que el producto tiene 4 unidades en stock
- **Cuando** intento agregar 5 unidades
- **Entonces** el sistema no agrega el producto y muestra "Solo hay 4 unidades disponibles"

**CA-4 — Producto sin stock**
- **Dado** que el producto tiene stock 0
- **Cuando** veo su detalle
- **Entonces** el botón "Agregar al carrito" aparece deshabilitado con la etiqueta "Agotado"

**CA-5 — Persistencia del carrito**
- **Dado** que tengo productos en el carrito y estoy autenticado
- **Cuando** cierro sesión y vuelvo a entrar
- **Entonces** el carrito conserva los productos que había agregado

## Reglas de negocio asociadas

- RN-10: No se puede agregar al carrito una cantidad mayor al stock disponible.
- RN-11: La cantidad mínima por ítem es 1 y debe ser un número entero.
- RN-12: Agregar al carrito **no** reserva ni descuenta stock; el descuento ocurre al confirmar el pedido (HU-029).
- RN-13: El precio del ítem es el vigente al momento de confirmar el pedido, no al agregarlo.

## Notas y dependencias

- Depende de HU-007 (detalle de producto).
- Relacionada con HU-017, HU-018 y HU-019.
- Definir en fase 2 el comportamiento del carrito para visitantes no autenticados.
