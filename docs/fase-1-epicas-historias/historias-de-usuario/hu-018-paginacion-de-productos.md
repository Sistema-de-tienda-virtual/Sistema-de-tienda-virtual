# HU-018 — Ver los productos paginados

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-03 — Búsqueda y navegación |
| **Prioridad** | Media |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** visitante
**quiero** ver el catálogo dividido en páginas
**para** navegar cómodamente sin cargar todos los productos a la vez.

## Criterios de aceptación

**CA-1 — Catálogo con más productos que el límite de una página**
- **Dado** que hay más productos activos que el número que se muestra por página
- **Cuando** entro al catálogo
- **Entonces** veo la primera página con el límite configurado y controles para avanzar de
  página

**CA-2 — Navegar a la siguiente página**
- **Dado** que estoy en la página 1 de resultados
- **Cuando** presiono "Siguiente"
- **Entonces** el sistema muestra el siguiente grupo de productos

**CA-3 — Última página**
- **Dado** que estoy en la última página de resultados
- **Cuando** reviso los controles de paginación
- **Entonces** el botón "Siguiente" aparece deshabilitado

**CA-4 — Paginación con filtros aplicados**
- **Dado** que apliqué un filtro de categoría o precio
- **Cuando** navego entre páginas
- **Entonces** la paginación respeta el filtro activo en todas las páginas

## Reglas de negocio asociadas

- RN-43: El número de productos por página es configurable, con un valor por defecto de
  12.

## Notas y dependencias

- Depende de HU-007, HU-015, HU-016 y HU-017.
