# HU-013 — Solicitar un arreglo personalizado

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Baja |
| **Estimación** | 5 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** describir un arreglo personalizado que no está en el catálogo (colores,
presupuesto, ocasión)
**para** pedir algo a la medida de lo que necesito.

## Criterios de aceptación

**CA-1 — Envío de solicitud**
- **Dado** que estoy en la sección "Arreglo personalizado"
- **Cuando** describo lo que quiero, indico un presupuesto aproximado y envío la
  solicitud
- **Entonces** el sistema la registra como "Pendiente de cotizar" y notifica al
  administrador

**CA-2 — Respuesta del administrador con cotización**
- **Dado** que el administrador revisó una solicitud
- **Cuando** define un precio final y lo envía
- **Entonces** el cliente recibe la cotización y puede aceptarla para convertirla en un
  pedido, o rechazarla

**CA-3 — Solicitud incompleta**
- **Dado** que estoy llenando el formulario de solicitud
- **Cuando** no describo lo que quiero (campo vacío)
- **Entonces** el sistema no permite enviarla

## Reglas de negocio asociadas

- RN-41: Un arreglo personalizado no tiene precio fijo hasta que el administrador lo
  cotiza.

## Notas y dependencias

- Al aceptarse la cotización, sigue el flujo normal de checkout (EP-05).
- Definir en fase 2 el tiempo máximo de respuesta del administrador.
