# HU-028 — Registrar la transacción de pago

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-05 — Proceso de compra (checkout) |
| **Prioridad** | Media |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** sistema
**quiero** registrar cada transacción de pago asociada a un pedido
**para** dejar evidencia de cada cobro y que el administrador pueda auditarlo.

## Criterios de aceptación

**CA-1 — Registro de pago exitoso**
- **Dado** que un pedido se confirma con pago en línea simulado exitoso
- **Cuando** se crea el pedido
- **Entonces** el sistema registra una transacción con monto, método, fecha/hora y estado
  "Aprobada", asociada a ese pedido

**CA-2 — Registro de pago contraentrega**
- **Dado** que un pedido se confirma con pago contraentrega
- **Cuando** se crea el pedido
- **Entonces** el sistema registra una transacción en estado "Pendiente", que el
  administrador podrá marcar como "Cobrada" al momento de la entrega

**CA-3 — Consulta de transacciones**
- **Dado** que soy administrador
- **Cuando** consulto el detalle de un pedido
- **Entonces** veo la transacción asociada: monto, método, estado y fecha

## Reglas de negocio asociadas

- RN-46: Todo pedido tiene al menos una transacción de pago asociada.

## Notas y dependencias

- Depende de HU-026 (confirmar pedido) y HU-027 (método de pago).
