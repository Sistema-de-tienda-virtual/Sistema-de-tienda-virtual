# HU-043 — Ver el reporte de pedidos por estado

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-08 — Reportes y estadísticas |
| **Prioridad** | Baja |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** ver cuántos pedidos hay en cada estado (Confirmado, En preparación, En camino,
Entregado, Cancelado)
**para** identificar cuellos de botella en la operación (por ejemplo, pedidos acumulados
sin preparar).

## Criterios de aceptación

**CA-1 — Conteo por estado**
- **Dado** que existen pedidos en distintos estados
- **Cuando** genero el reporte
- **Entonces** el sistema muestra la cantidad de pedidos agrupados por cada estado

**CA-2 — Filtrar por rango de fechas**
- **Dado** que estoy en el reporte de pedidos por estado
- **Cuando** aplico un rango de fechas de entrega
- **Entonces** el conteo se recalcula considerando solo los pedidos de ese rango

**CA-3 — Sin pedidos**
- **Dado** que no hay pedidos registrados en el rango seleccionado
- **Cuando** genero el reporte
- **Entonces** el sistema muestra el conteo en cero para todos los estados

## Reglas de negocio asociadas

- RN-22: Ciclo de estados del pedido (ver HU-033).

## Notas y dependencias

- Depende de HU-033 (estados del pedido).
