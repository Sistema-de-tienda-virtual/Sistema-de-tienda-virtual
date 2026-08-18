# HU-040 — Registrar merma de flores deterioradas o vencidas

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-07 — Gestión de inventario |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** empleado
**quiero** registrar como merma las flores que se deterioraron o vencieron
**para** que el inventario refleje solo lo que realmente se puede vender.

## Criterios de aceptación

**CA-1 — Registro de merma exitoso**
- **Dado** que un producto tiene 10 unidades en stock
- **Cuando** registro 3 unidades como merma indicando el motivo (deterioro, vencimiento,
  daño en manipulación)
- **Entonces** el stock disponible del producto queda en 7, y la merma queda registrada
  con fecha, cantidad, motivo y el empleado que la registró

**CA-2 — Cantidad mayor al stock disponible**
- **Dado** que un producto tiene 4 unidades en stock
- **Cuando** intento registrar 5 unidades como merma
- **Entonces** el sistema no permite el registro y muestra "Solo hay 4 unidades
  disponibles para dar de baja"

**CA-3 — Motivo obligatorio**
- **Dado** que estoy registrando una merma
- **Cuando** no selecciono un motivo
- **Entonces** el sistema no permite guardar el registro

**CA-4 — Alerta por vida útil vencida**
- **Dado** que un producto superó su vida útil estimada (HU-009) sin haberse vendido ni
  registrado como merma
- **Cuando** el empleado o el administrador consulta el inventario
- **Entonces** el sistema resalta ese producto como "Vida útil vencida — revisar"

## Reglas de negocio asociadas

- RN-G5: Todo producto marcado como merma se descuenta del stock disponible y queda
  registrado con fecha y motivo (ver `01-definicion-del-proyecto.md`).
- RN-28: La cantidad registrada como merma no puede superar el stock disponible del
  producto.
- RN-29: La merma es un movimiento de inventario distinto a una venta; no genera ingreso
  ni se asocia a un pedido.

## Notas y dependencias

- Depende de HU-009 (vida útil del producto) y HU-037 (stock registrado).
- Alimenta el reporte de inventario/merma que el administrador puede revisar en la fase
  de reportes (EP-08).
