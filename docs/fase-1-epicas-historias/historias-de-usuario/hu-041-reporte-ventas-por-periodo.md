# HU-041 — Ver el reporte de ventas por período

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-08 — Reportes y estadísticas |
| **Prioridad** | Media |
| **Estimación** | 5 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** ver el total de ventas en un rango de fechas
**para** conocer el desempeño del negocio.

## Criterios de aceptación

**CA-1 — Reporte con ventas en el rango**
- **Dado** que existen pedidos entregados en el rango de fechas seleccionado
- **Cuando** genero el reporte
- **Entonces** el sistema muestra el número de pedidos, el total vendido y el total por
  día dentro de ese rango

**CA-2 — Rango sin ventas**
- **Dado** que no hay pedidos entregados en el rango seleccionado
- **Cuando** genero el reporte
- **Entonces** el sistema muestra "No hay ventas registradas en este período"

**CA-3 — Rango de fechas inválido**
- **Dado** que selecciono una fecha inicial posterior a la fecha final
- **Cuando** intento generar el reporte
- **Entonces** el sistema muestra un error y no genera el reporte

**CA-4 — Solo se cuentan pedidos entregados**
- **Dado** que hay pedidos cancelados o aún no entregados dentro del rango
- **Cuando** se genera el reporte
- **Entonces** esos pedidos no se incluyen en el total de ventas

## Reglas de negocio asociadas

- RN-48: El reporte de ventas solo contabiliza pedidos en estado "Entregado".

## Notas y dependencias

- Depende de HU-033 (estados del pedido).
