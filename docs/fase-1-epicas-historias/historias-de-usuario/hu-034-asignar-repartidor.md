# HU-034 — Asignar un repartidor a un pedido

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-06 — Gestión de pedidos y entregas |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** asignar un repartidor disponible a un pedido en preparación
**para** coordinar quién hace la entrega en la fecha y franja acordadas con el cliente.

## Criterios de aceptación

**CA-1 — Asignación exitosa**
- **Dado** que un pedido está en estado "En preparación" y sin repartidor asignado
- **Cuando** el administrador selecciona un repartidor de la lista y confirma
- **Entonces** el pedido queda asociado a ese repartidor y aparece en la lista de pedidos
  asignados del repartidor (HU-035)

**CA-2 — Reasignación**
- **Dado** que un pedido ya tiene un repartidor asignado y aún no está "En camino"
- **Cuando** el administrador selecciona otro repartidor
- **Entonces** el sistema reemplaza al repartidor asignado y notifica el cambio

**CA-3 — Pedido sin preparar**
- **Dado** que un pedido está en estado "Confirmado" (aún no preparado)
- **Cuando** el administrador intenta asignar un repartidor
- **Entonces** el sistema no lo permite y muestra el mensaje "El pedido debe estar en
  preparación antes de asignar repartidor"

**CA-4 — Sin repartidores disponibles**
- **Dado** que no hay ningún usuario con rol "Repartidor" activo en el sistema
- **Cuando** el administrador intenta asignar uno a un pedido
- **Entonces** el sistema muestra el mensaje "No hay repartidores disponibles" y no permite
  continuar hasta que exista al menos uno (ver HU-006)

## Reglas de negocio asociadas

- RN-24: Un pedido solo puede asignarse a un repartidor cuando está en estado
  "En preparación" o posterior.
- RN-25: Un pedido tiene, como máximo, un repartidor asignado a la vez.

## Notas y dependencias

- Depende de HU-006 (creación de cuentas de repartidor) y HU-033 (estado del pedido).
- Relacionada con HU-035 y HU-036 (vista y actualización del repartidor).
- Definir en fase 2 si la asignación considera zona de cobertura o carga de trabajo del
  repartidor.
