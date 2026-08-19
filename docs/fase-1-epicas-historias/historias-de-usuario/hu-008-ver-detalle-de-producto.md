# HU-008 — Ver detalle de un producto

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** visitante
**quiero** ver el detalle de un producto (descripción, precio, categoría, stock)
**para** decidir si lo compro.

## Criterios de aceptación

**CA-1 — Detalle completo**
- **Dado** que selecciono un producto del listado
- **Cuando** entro a su página de detalle
- **Entonces** veo su nombre, descripción, precio, imagen, categoría/ocasión y
  disponibilidad

**CA-2 — Producto sin stock**
- **Dado** que el producto tiene stock 0
- **Cuando** veo su detalle
- **Entonces** el botón "Agregar al carrito" aparece deshabilitado con la etiqueta
  "Agotado" (ver CA-4 de HU-019)

**CA-3 — Producto inexistente o desactivado**
- **Dado** que accedo a la URL de un producto que no existe o fue desactivado
- **Cuando** intento ver su detalle
- **Entonces** el sistema muestra una página de "Producto no encontrado"

## Reglas de negocio asociadas

- RN-37: Solo se muestran productos con estado "Activo" (ver HU-007).

## Notas y dependencias

- Depende de HU-007 (listado de productos).
- Precede a HU-019 (agregar al carrito).
