# HU-027 — Elegir el método de pago

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-05 — Proceso de compra (checkout) |
| **Prioridad** | Media |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** elegir el método de pago (pago en línea simulado o pago contraentrega)
**para** pagar como me convenga.

## Criterios de aceptación

**CA-1 — Selección de pago en línea (simulado)**
- **Dado** que estoy en el checkout
- **Cuando** selecciono "Pago en línea" y el sistema simula el pago exitoso
- **Entonces** el pedido queda marcado como pagado antes de confirmarse

**CA-2 — Selección de pago contraentrega**
- **Dado** que estoy en el checkout
- **Cuando** selecciono "Pago contraentrega"
- **Entonces** el pedido se confirma sin pago registrado, y queda marcado como "Pago
  pendiente" hasta la entrega

**CA-3 — Pago simulado rechazado**
- **Dado** que estoy en el checkout con pago en línea
- **Cuando** el sistema simula un pago rechazado
- **Entonces** el pedido no se confirma y se me permite reintentar o cambiar de método

## Reglas de negocio asociadas

- RN-45: El pago en línea es simulado; no se integra una pasarela de pago real (ver
  alcance en `01-definicion-del-proyecto.md`).

## Notas y dependencias

- Precede a HU-026 (confirmar pedido) y HU-028 (registro de la transacción).
