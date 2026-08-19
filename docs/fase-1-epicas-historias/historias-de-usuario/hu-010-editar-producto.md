# HU-010 — Editar producto

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** editar un producto existente
**para** corregir su precio, descripción o vida útil cuando cambien las condiciones.

## Criterios de aceptación

**CA-1 — Edición exitosa**
- **Dado** que estoy viendo el formulario de edición de un producto
- **Cuando** modifico su precio o descripción con datos válidos y guardo
- **Entonces** el sistema actualiza el producto y los cambios se reflejan de inmediato en
  el catálogo público

**CA-2 — Precio inválido**
- **Dado** que estoy editando un producto
- **Cuando** ingreso un precio menor o igual a cero
- **Entonces** el sistema no guarda el cambio y muestra el error correspondiente

**CA-3 — Edición del stock desde este formulario**
- **Dado** que estoy editando un producto
- **Cuando** intento modificar directamente el campo de stock
- **Entonces** el sistema no lo permite desde aquí y me redirige al módulo de inventario
  (HU-037), para no perder la trazabilidad de los movimientos

## Reglas de negocio asociadas

- RN-15: El precio debe ser mayor a cero (ver HU-009).
- RN-38: El stock de un producto solo se modifica a través de movimientos de inventario
  (entradas, ventas, merma), no editando el producto directamente.

## Notas y dependencias

- Depende de HU-009 (crear producto).
