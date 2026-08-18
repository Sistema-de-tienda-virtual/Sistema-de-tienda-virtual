# HU-037 — Registrar el stock de un producto

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-07 — Gestión de inventario |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** registrar entradas de stock de un producto (por ejemplo, al recibir flores del
proveedor)
**para** saber cuánto hay disponible para vender.

## Criterios de aceptación

**CA-1 — Registro de entrada exitoso**
- **Dado** que un producto tiene 5 unidades en stock
- **Cuando** registro una entrada de 20 unidades con su fecha de ingreso
- **Entonces** el stock disponible queda en 25 y el movimiento queda registrado con fecha,
  cantidad y usuario que lo registró

**CA-2 — Cantidad inválida**
- **Dado** que estoy registrando una entrada de stock
- **Cuando** ingreso una cantidad negativa o en cero
- **Entonces** el sistema no permite guardar el movimiento

**CA-3 — Historial de movimientos**
- **Dado** que un producto tiene varios movimientos de entrada registrados
- **Cuando** consulto su historial de inventario
- **Entonces** veo cada movimiento con fecha, cantidad y tipo (entrada, venta, merma)

## Reglas de negocio asociadas

- RN-G3: El stock nunca puede quedar en un valor negativo (ver
  `01-definicion-del-proyecto.md`).

## Notas y dependencias

- Depende de HU-009 (crear producto).
- Relacionada con HU-038 (descuento por venta) y HU-040 (merma).
