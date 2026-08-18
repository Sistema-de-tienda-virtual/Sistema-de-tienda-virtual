# HU-023 — Indicar datos del destinatario y dirección de entrega

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-05 — Proceso de compra (checkout) |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** indicar el nombre, teléfono y dirección de la persona que recibirá el pedido
**para** poder comprar flores como regalo para alguien más, sin que tengan que ser mis
propios datos.

## Criterios de aceptación

**CA-1 — Destinatario distinto del comprador**
- **Dado** que estoy en el checkout con productos en el carrito
- **Cuando** marco la opción "Es para otra persona" e ingreso nombre, teléfono y dirección
  del destinatario
- **Entonces** el pedido guarda ambos juegos de datos: los del comprador (mi cuenta) y los
  del destinatario, y la entrega se dirige a la dirección indicada

**CA-2 — Destinatario es el mismo comprador**
- **Dado** que estoy en el checkout
- **Cuando** dejo marcada la opción "Es para mí"
- **Entonces** el sistema usa mis propios datos de perfil como datos de entrega, sin
  pedirlos de nuevo

**CA-3 — Dirección incompleta**
- **Dado** que elegí "Es para otra persona"
- **Cuando** dejo la dirección o el teléfono del destinatario vacíos y avanzo
- **Entonces** el sistema no permite continuar y señala los campos faltantes

**CA-4 — Dirección fuera de cobertura**
- **Dado** que ingresé una dirección de entrega
- **Cuando** esa dirección está fuera de la zona de cobertura del negocio
- **Entonces** el sistema me avisa que no hay cobertura para esa zona y no permite
  continuar con esa dirección

## Reglas de negocio asociadas

- RN-18: Todo pedido guarda de forma independiente los datos del comprador y los del
  destinatario (RN-G2 en `01-definicion-del-proyecto.md`).
- RN-19: La dirección de entrega debe pertenecer a la zona de cobertura configurada por el
  administrador.

## Notas y dependencias

- Precede a HU-024 (fecha y franja de entrega) y HU-025 (dedicatoria).
- Definir en fase 2 cómo se configura la zona de cobertura (por barrio, radio, ciudad).
