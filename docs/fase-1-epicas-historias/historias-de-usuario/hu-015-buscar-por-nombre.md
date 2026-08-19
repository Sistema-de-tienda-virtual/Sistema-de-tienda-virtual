# HU-015 — Buscar productos por nombre

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-03 — Búsqueda y navegación |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** visitante
**quiero** buscar productos escribiendo su nombre
**para** encontrar rápido lo que necesito sin recorrer todo el catálogo.

## Criterios de aceptación

**CA-1 — Resultados encontrados**
- **Dado** que escribo un término que coincide con el nombre de uno o más productos
- **Cuando** ejecuto la búsqueda
- **Entonces** el sistema muestra los productos activos cuyo nombre contiene ese término

**CA-2 — Sin resultados**
- **Dado** que escribo un término que no coincide con ningún producto
- **Cuando** ejecuto la búsqueda
- **Entonces** el sistema muestra "No se encontraron productos para tu búsqueda"

**CA-3 — Búsqueda vacía**
- **Dado** que dejo el campo de búsqueda vacío
- **Cuando** intento buscar
- **Entonces** el sistema muestra el catálogo completo, igual que HU-007

**CA-4 — Búsqueda sin distinguir mayúsculas ni tildes**
- **Dado** que un producto se llama "Ramo de Rosas"
- **Cuando** busco "ramo de rosas" o "RAMO DE ROSAS"
- **Entonces** el sistema lo encuentra igual, sin importar mayúsculas ni tildes

## Reglas de negocio asociadas

- RN-37: Solo se muestran productos activos (ver HU-007).

## Notas y dependencias

- Depende de HU-007 (listado de productos).
