# HU-042 — Ver los productos más vendidos

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-08 — Reportes y estadísticas |
| **Prioridad** | Baja |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** ver un ranking de los productos más vendidos en un período
**para** decidir qué reabastecer con prioridad.

## Criterios de aceptación

**CA-1 — Ranking con ventas**
- **Dado** que existen pedidos entregados en el período seleccionado
- **Cuando** genero el reporte
- **Entonces** el sistema muestra los productos ordenados de mayor a menor cantidad
  vendida, con el total de unidades de cada uno

**CA-2 — Sin ventas en el período**
- **Dado** que no hay pedidos entregados en el período seleccionado
- **Cuando** genero el reporte
- **Entonces** el sistema muestra "No hay datos suficientes para este período"

**CA-3 — Empate entre productos**
- **Dado** que dos productos tienen la misma cantidad vendida
- **Cuando** se genera el ranking
- **Entonces** ambos aparecen en la misma posición, ordenados alfabéticamente entre sí

## Reglas de negocio asociadas

- RN-48: Solo se contabilizan pedidos en estado "Entregado" (ver HU-041).

## Notas y dependencias

- Depende de HU-041 (reporte de ventas).
