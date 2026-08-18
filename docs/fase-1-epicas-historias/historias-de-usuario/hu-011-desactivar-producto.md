# HU-011 — Desactivar producto

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Media |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** desactivar un producto
**para** dejar de ofrecerlo en el catálogo sin perder su historial de ventas.

## Criterios de aceptación

**CA-1 — Desactivación exitosa**
- **Dado** que un producto está activo
- **Cuando** el administrador lo desactiva
- **Entonces** el producto deja de aparecer en el catálogo público, pero se conserva en el
  sistema con su historial de ventas y movimientos de inventario

**CA-2 — Reactivar un producto**
- **Dado** que un producto está desactivado y tiene stock disponible
- **Cuando** el administrador lo reactiva
- **Entonces** el producto vuelve a aparecer en el catálogo público

**CA-3 — Producto en un carrito al momento de desactivarse**
- **Dado** que un cliente tiene el producto en su carrito
- **Cuando** el administrador lo desactiva antes de que el cliente confirme el pedido
- **Entonces** el sistema no permite confirmar el pedido con ese producto y le avisa al
  cliente que ya no está disponible

## Reglas de negocio asociadas

- RN-39: Desactivar un producto no elimina su historial ni sus movimientos de inventario.

## Notas y dependencias

- Depende de HU-009 (crear producto).
- Relacionada con HU-026 (confirmar pedido).
