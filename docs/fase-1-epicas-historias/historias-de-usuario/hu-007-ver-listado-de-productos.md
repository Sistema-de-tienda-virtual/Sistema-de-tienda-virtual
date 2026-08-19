# HU-007 — Ver listado de productos

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** visitante
**quiero** ver el listado de productos disponibles
**para** conocer qué flores y arreglos vende la floristería.

## Criterios de aceptación

**CA-1 — Listado con productos disponibles**
- **Dado** que hay productos activos y con stock
- **Cuando** entro a la página del catálogo
- **Entonces** veo cada producto con su imagen, nombre y precio

**CA-2 — Catálogo vacío**
- **Dado** que no hay ningún producto activo
- **Cuando** entro al catálogo
- **Entonces** el sistema muestra el mensaje "Por el momento no hay productos disponibles"

**CA-3 — Productos sin stock**
- **Dado** que un producto está activo pero con stock 0
- **Cuando** veo el listado
- **Entonces** el producto aparece marcado como "Agotado" y no se puede agregar al carrito
  desde el listado

**CA-4 — Productos desactivados no aparecen**
- **Dado** que un producto fue desactivado por el administrador (HU-011)
- **Cuando** un visitante consulta el catálogo
- **Entonces** ese producto no aparece en el listado

## Reglas de negocio asociadas

- RN-37: Solo se muestran en el catálogo público los productos con estado "Activo".

## Notas y dependencias

- Precede a HU-008 (detalle de producto) y HU-019 (agregar al carrito).
