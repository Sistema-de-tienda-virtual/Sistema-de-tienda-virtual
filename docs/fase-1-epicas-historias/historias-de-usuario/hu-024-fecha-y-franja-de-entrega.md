# HU-024 — Elegir fecha y franja horaria de entrega

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-05 — Proceso de compra (checkout) |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 5 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente
**quiero** elegir la fecha y la franja horaria en la que debe llegar mi pedido
**para** asegurarme de que las flores lleguen a tiempo para la ocasión (cumpleaños,
aniversario, etc.).

## Criterios de aceptación

**CA-1 — Selección válida**
- **Dado** que estoy en el checkout
- **Cuando** elijo una fecha futura dentro de los días de operación del negocio y una
  franja horaria disponible ese día
- **Entonces** el sistema reserva esa franja para mi pedido y la muestra en el resumen de
  compra

**CA-2 — Fecha pasada o fuera de operación**
- **Dado** que estoy seleccionando la fecha de entrega
- **Cuando** elijo una fecha anterior a hoy, o un día en que el negocio no opera
- **Entonces** el sistema no permite seleccionar esa fecha y muestra las fechas
  disponibles

**CA-3 — Franja llena (capacidad de entregas)**
- **Dado** que una franja horaria ya alcanzó el máximo de pedidos que el negocio puede
  entregar
- **Cuando** intento seleccionar esa franja
- **Entonces** el sistema la muestra deshabilitada como "Sin cupo" y me ofrece otras
  franjas disponibles ese mismo día

**CA-4 — Fecha de alta demanda**
- **Dado** que la fecha elegida corresponde a una fecha de alta demanda configurada por el
  administrador (por ejemplo, San Valentín)
- **Cuando** consulto las franjas disponibles
- **Entonces** el sistema muestra únicamente las franjas con cupo, respetando el límite
  configurado para esa fecha

## Reglas de negocio asociadas

- RN-G1: Un pedido siempre debe tener fecha y franja de entrega válidas (ver
  `01-definicion-del-proyecto.md`).
- RN-20: Cada franja horaria tiene un cupo máximo de pedidos configurado por el
  administrador.
- RN-21: El administrador puede definir fechas de alta demanda con cupos distintos a los
  normales.

## Notas y dependencias

- Depende de HU-023 (dirección de entrega ya definida, para validar cobertura).
- Relacionada con HU-032 (listado de pedidos del administrador) y HU-034 (asignación de
  repartidor), que usan la fecha/franja para organizar la operación.
- Definir en fase 2 la configuración de días/horarios de operación y de fechas de alta
  demanda.
