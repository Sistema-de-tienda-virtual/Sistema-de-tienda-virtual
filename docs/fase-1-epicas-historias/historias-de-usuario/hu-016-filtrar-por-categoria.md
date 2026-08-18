# HU-016 — Filtrar productos por categoría u ocasión

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-03 — Búsqueda y navegación |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** visitante
**quiero** filtrar los productos por categoría u ocasión
**para** ver solo lo que me interesa según el motivo de mi compra.

## Criterios de aceptación

**CA-1 — Filtro aplicado**
- **Dado** que estoy en el catálogo
- **Cuando** selecciono la categoría/ocasión "Condolencias"
- **Entonces** el sistema muestra únicamente los productos activos de esa categoría

**CA-2 — Combinar con búsqueda por nombre**
- **Dado** que ya filtré por una categoría
- **Cuando** además escribo un término de búsqueda
- **Entonces** el sistema muestra solo los productos que cumplen ambos criterios

**CA-3 — Categoría sin productos**
- **Dado** que selecciono una categoría que no tiene productos activos
- **Cuando** aplico el filtro
- **Entonces** el sistema muestra "No hay productos en esta categoría"

**CA-4 — Quitar el filtro**
- **Dado** que tengo un filtro de categoría aplicado
- **Cuando** lo quito
- **Entonces** el sistema vuelve a mostrar el catálogo completo

## Reglas de negocio asociadas

- RN-37: Solo se muestran productos activos (ver HU-007).

## Notas y dependencias

- Depende de HU-012 (gestión de categorías) y HU-007 (listado de productos).
