# HU-026 — Confirmar el pedido

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-05 — Proceso de compra (checkout) |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 5 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** confirmar mi pedido después de revisar el resumen completo
**para** formalizar la compra.

## Criterios de aceptación

**CA-1 — Confirmación exitosa**
- **Dado** que completé destinatario, dirección, fecha/franja de entrega y método de pago
- **Cuando** reviso el resumen y presiono "Confirmar pedido"
- **Entonces** el sistema crea el pedido en estado "Confirmado", descuenta el stock
  (HU-038) y me muestra un número de pedido

**CA-2 — Datos incompletos al confirmar**
- **Dado** que falta un dato obligatorio (destinatario, dirección o fecha de entrega)
- **Cuando** intento confirmar el pedido
- **Entonces** el sistema no lo crea y me indica qué falta completar

**CA-3 — Stock insuficiente al confirmar**
- **Dado** que tengo 5 unidades de un producto en el carrito y solo quedan 3 disponibles
  (porque otro cliente compró primero)
- **Cuando** confirmo el pedido
- **Entonces** el sistema no crea el pedido, me avisa la cantidad real disponible y me deja
  ajustar la cantidad antes de reintentar

**CA-4 — Carrito vacío**
- **Dado** que mi carrito no tiene productos
- **Cuando** intento acceder al checkout
- **Entonces** el sistema no me permite continuar y me redirige al catálogo

## Reglas de negocio asociadas

- RN-G1, RN-G2, RN-G4 (ver `01-definicion-del-proyecto.md`).

## Notas y dependencias

- Depende de HU-022 (total del carrito), HU-023 (destinatario/entrega), HU-024
  (fecha/franja) y HU-027 (método de pago).
- Precede a HU-038 (descuento de stock) y HU-029 (historial de pedidos).
