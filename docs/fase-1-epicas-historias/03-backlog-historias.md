# Fase 1 — Backlog de historias de usuario

Listado maestro. El detalle completo (criterios de aceptación en formato
Dado/Cuando/Entonces, reglas de negocio, notas) va en un archivo propio dentro de
`historias-de-usuario/`, usando `docs/plantillas/plantilla-historia-usuario.md`. Las 43
historias ya tienen su archivo de detalle (columna **Detalle** marcada con ✅) como borrador
base con datos genéricos; el equipo debe revisarlas, ajustarlas y asignar
responsable/estado como parte del "terminado" de la fase 1 (ver
`docs/actas-reuniones/plan-de-trabajo-fase-1.md`).

**Prioridad:** Alta = entra al MVP · Media = segunda iteración · Baja = deseable.
**Estimación:** puntos de historia (1, 2, 3, 5, 8).

## EP-01 — Gestión de usuarios y autenticación

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-001 | Visitante | registrarme con correo y contraseña | tener una cuenta para comprar | Alta | 3 | ✅ |
| HU-002 | Cliente | iniciar sesión | acceder a mi cuenta y mis pedidos | Alta | 2 | ✅ |
| HU-003 | Cliente | cerrar sesión | proteger mi cuenta | Alta | 1 | ✅ |
| HU-004 | Cliente | editar mis datos de perfil | mantener mi información actualizada | Media | 2 | ✅ |
| HU-005 | Cliente | recuperar mi contraseña | volver a entrar si la olvido | Media | 3 | ✅ |
| HU-006 | Administrador | crear cuentas de empleados y repartidores con su rol | que el equipo del negocio use el sistema | Alta | 3 | ✅ |

## EP-02 — Catálogo de productos

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-007 | Visitante | ver el listado de productos | conocer qué vende la floristería | Alta | 3 | ✅ |
| HU-008 | Visitante | ver el detalle de un producto | decidir si lo compro | Alta | 2 | ✅ |
| HU-009 | Administrador | crear un producto indicando precio, stock y vida útil | publicarlo en la tienda | Alta | 5 | ✅ |
| HU-010 | Administrador | editar un producto | corregir su precio, descripción o vida útil | Alta | 3 | ✅ |
| HU-011 | Administrador | desactivar un producto | dejar de ofrecerlo sin perder su historial | Media | 2 | ✅ |
| HU-012 | Administrador | gestionar categorías y ocasiones | organizar el catálogo (cumpleaños, condolencias, aniversario, etc.) | Media | 3 | ✅ |
| HU-013 | Cliente | solicitar un arreglo personalizado describiendo lo que quiero | pedir algo que no está en el catálogo | Baja | 5 | ✅ |
| HU-014 | Administrador | crear promociones por temporada | aumentar ventas en fechas clave (San Valentín, Día de la Madre) | Baja | 3 | ✅ |

## EP-03 — Búsqueda y navegación

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-015 | Visitante | buscar productos por nombre | encontrar rápido lo que necesito | Alta | 3 | ✅ |
| HU-016 | Visitante | filtrar productos por categoría u ocasión | ver solo lo que me interesa | Alta | 2 | ✅ |
| HU-017 | Visitante | filtrar por rango de precio | ajustarme a mi presupuesto | Media | 2 | ✅ |
| HU-018 | Visitante | ver los productos paginados | navegar cómodamente el catálogo | Media | 2 | ✅ |

## EP-04 — Carrito de compras

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-019 | Cliente | agregar un producto al carrito | reservarlo para comprarlo | Alta | 3 | ✅ |
| HU-020 | Cliente | modificar la cantidad de un ítem | ajustar mi compra | Alta | 2 | ✅ |
| HU-021 | Cliente | eliminar un ítem del carrito | quitar lo que ya no quiero | Alta | 2 | ✅ |
| HU-022 | Cliente | ver el total del carrito | saber cuánto voy a pagar | Alta | 2 | ✅ |

## EP-05 — Proceso de compra (checkout)

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-023 | Cliente | indicar los datos del destinatario y la dirección de entrega | pedir flores para regalar a otra persona | Alta | 3 | ✅ |
| HU-024 | Cliente | elegir la fecha y la franja horaria de entrega | recibir el pedido cuando lo necesito | Alta | 5 | ✅ |
| HU-025 | Cliente | escribir un mensaje de dedicatoria | acompañar el arreglo con un mensaje personal | Media | 2 | ✅ |
| HU-026 | Cliente | confirmar mi pedido | formalizar la compra | Alta | 5 | ✅ |
| HU-027 | Cliente | elegir el método de pago | pagar como me convenga | Media | 3 | ✅ |
| HU-028 | Sistema | registrar la transacción de pago | dejar evidencia de cada cobro | Media | 3 | ✅ |

## EP-06 — Gestión de pedidos y entregas

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-029 | Cliente | ver el historial de mis pedidos | hacer seguimiento a mis compras | Alta | 3 | ✅ |
| HU-030 | Cliente | ver el detalle y estado de un pedido | revisar qué compré, para quién y cuándo llega | Alta | 2 | ✅ |
| HU-031 | Cliente | cancelar un pedido no despachado | arrepentirme a tiempo | Baja | 3 | ✅ |
| HU-032 | Administrador | ver todos los pedidos | gestionar la operación del negocio | Alta | 3 | ✅ |
| HU-033 | Administrador | cambiar el estado de un pedido | informar el avance al cliente | Alta | 3 | ✅ |
| HU-034 | Administrador | asignar un repartidor a un pedido | coordinar la entrega | Alta | 3 | ✅ |
| HU-035 | Repartidor | consultar los pedidos que tengo asignados | saber qué debo entregar y dónde | Alta | 2 | ✅ |
| HU-036 | Repartidor | actualizar el estado de la entrega | informar al cliente y al administrador | Alta | 2 | ✅ |

## EP-07 — Gestión de inventario

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-037 | Administrador | registrar el stock de un producto | saber cuánto hay disponible | Alta | 3 | ✅ |
| HU-038 | Sistema | descontar stock al confirmar un pedido | mantener el inventario exacto | Alta | 3 | ✅ |
| HU-039 | Administrador | ver alertas de stock bajo | reabastecer a tiempo | Media | 3 | ✅ |
| HU-040 | Empleado | registrar la merma de flores deterioradas o vencidas | mantener el inventario real y no vender lo dañado | Alta | 3 | ✅ |

## EP-08 — Reportes y estadísticas

| ID | Como… | Quiero… | Para… | Prioridad | Est. | Detalle |
| -- | ----- | ------- | ----- | --------- | ---- | ------- |
| HU-041 | Administrador | ver el reporte de ventas por período | conocer el desempeño del negocio | Media | 5 | ✅ |
| HU-042 | Administrador | ver los productos más vendidos | decidir qué reabastecer | Baja | 3 | ✅ |
| HU-043 | Administrador | ver el reporte de pedidos por estado | identificar cuellos de botella en la operación | Baja | 3 | ✅ |

## Resumen de priorización

| Prioridad | Historias | Puntos |
| --------- | --------- | ------ |
| Alta (MVP) | 25 | 78 |
| Media | 10 | 29 |
| Baja | 8 | 25 |

## Alcance del MVP

El MVP lo componen **las 25 historias de prioridad Alta**, que cubren el flujo completo:

> registrarse → ver catálogo → buscar → agregar al carrito → indicar destinatario, fecha y
> franja de entrega → confirmar pedido → el administrador gestiona el pedido, el stock y
> asigna repartidor → el repartidor actualiza el estado de la entrega.

Quedan fuera del MVP (Media/Baja): recuperar contraseña, categorías avanzadas, arreglos
personalizados a cotizar, promociones, dedicatoria, método de pago seleccionable, registro
formal de transacciones, cancelación de pedidos, alertas de stock bajo y los reportes
distintos al de ventas.

Estados posibles de una historia: `Pendiente` · `En curso` · `En revisión` · `Terminada`.
