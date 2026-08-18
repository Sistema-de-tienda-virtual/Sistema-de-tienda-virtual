# HU-025 — Escribir un mensaje de dedicatoria

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-05 — Proceso de compra (checkout) |
| **Prioridad** | Media |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** escribir un mensaje de dedicatoria para el destinatario
**para** acompañar el arreglo con un mensaje personal.

## Criterios de aceptación

**CA-1 — Dedicatoria registrada**
- **Dado** que estoy en el checkout
- **Cuando** escribo un mensaje de hasta el límite de caracteres permitido
- **Entonces** el sistema lo guarda junto al pedido y lo muestra en el resumen antes de
  confirmar

**CA-2 — Mensaje que excede el límite**
- **Dado** que estoy escribiendo la dedicatoria
- **Cuando** supero el número máximo de caracteres
- **Entonces** el sistema no permite seguir escribiendo y muestra el contador restante

**CA-3 — Dedicatoria opcional**
- **Dado** que estoy en el checkout
- **Cuando** dejo el campo de dedicatoria vacío y confirmo el pedido
- **Entonces** el sistema permite continuar sin dedicatoria

## Reglas de negocio asociadas

- RN-44: El mensaje de dedicatoria tiene un máximo de 200 caracteres.

## Notas y dependencias

- Depende de HU-023 (datos del destinatario).
- Precede a HU-026 (confirmar pedido).
