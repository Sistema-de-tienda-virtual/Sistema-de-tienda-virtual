# Fase 1 — Backlog de historias de usuario

Listado maestro. El detalle de cada historia (criterios de aceptación, notas) va en un
archivo propio dentro de `historias-de-usuario/`.

**Prioridad:** Alta = entra al MVP · Media = segunda iteración · Baja = deseable.
**Estimación:** puntos de historia (1, 2, 3, 5, 8).

| ID | Épica | Como… | Quiero… | Para… | Prioridad | Est. | Responsable | Estado |
| -- | ----- | ----- | ------- | ----- | --------- | ---- | ----------- | ------ |
| HU-001 | EP-01 | Visitante | registrarme con correo y contraseña | tener una cuenta para comprar | Alta | 3 | _(asignar)_ | Pendiente |
| HU-002 | EP-01 | Cliente | iniciar sesión | acceder a mi cuenta y mis pedidos | Alta | 2 | _(asignar)_ | Pendiente |
| HU-003 | EP-01 | Cliente | cerrar sesión | proteger mi cuenta | Alta | 1 | _(asignar)_ | Pendiente |
| HU-004 | EP-01 | Cliente | editar mis datos de perfil | mantener mi información actualizada | Media | 2 | _(asignar)_ | Pendiente |
| HU-005 | EP-01 | Cliente | recuperar mi contraseña | volver a entrar si la olvido | Media | 3 | _(asignar)_ | Pendiente |
| HU-006 | EP-02 | Visitante | ver el listado de productos | conocer qué vende la tienda | Alta | 3 | _(asignar)_ | Pendiente |
| HU-007 | EP-02 | Visitante | ver el detalle de un producto | decidir si lo compro | Alta | 2 | _(asignar)_ | Pendiente |
| HU-008 | EP-02 | Administrador | crear un producto | publicarlo en la tienda | Alta | 5 | _(asignar)_ | Pendiente |
| HU-009 | EP-02 | Administrador | editar un producto | corregir su precio o descripción | Alta | 3 | _(asignar)_ | Pendiente |
| HU-010 | EP-02 | Administrador | desactivar un producto | dejar de ofrecerlo sin perder su historial | Media | 2 | _(asignar)_ | Pendiente |
| HU-011 | EP-02 | Administrador | gestionar categorías | organizar el catálogo | Media | 3 | _(asignar)_ | Pendiente |
| HU-012 | EP-03 | Visitante | buscar productos por nombre | encontrar rápido lo que necesito | Alta | 3 | _(asignar)_ | Pendiente |
| HU-013 | EP-03 | Visitante | filtrar productos por categoría | ver solo lo que me interesa | Alta | 2 | _(asignar)_ | Pendiente |
| HU-014 | EP-03 | Visitante | filtrar por rango de precio | ajustarme a mi presupuesto | Media | 2 | _(asignar)_ | Pendiente |
| HU-015 | EP-03 | Visitante | ver los productos paginados | navegar cómodamente el catálogo | Media | 2 | _(asignar)_ | Pendiente |
| HU-016 | EP-04 | Cliente | agregar un producto al carrito | reservarlo para comprarlo | Alta | 3 | _(asignar)_ | Pendiente |
| HU-017 | EP-04 | Cliente | modificar la cantidad de un ítem | ajustar mi compra | Alta | 2 | _(asignar)_ | Pendiente |
| HU-018 | EP-04 | Cliente | eliminar un ítem del carrito | quitar lo que ya no quiero | Alta | 2 | _(asignar)_ | Pendiente |
| HU-019 | EP-04 | Cliente | ver el total del carrito | saber cuánto voy a pagar | Alta | 2 | _(asignar)_ | Pendiente |
| HU-020 | EP-05 | Cliente | registrar mi dirección de entrega | recibir el pedido donde vivo | Alta | 3 | _(asignar)_ | Pendiente |
| HU-021 | EP-05 | Cliente | confirmar mi pedido | formalizar la compra | Alta | 5 | _(asignar)_ | Pendiente |
| HU-022 | EP-05 | Cliente | elegir el método de pago | pagar como me convenga | Media | 3 | _(asignar)_ | Pendiente |
| HU-023 | EP-06 | Cliente | ver el historial de mis pedidos | hacer seguimiento a mis compras | Alta | 3 | _(asignar)_ | Pendiente |
| HU-024 | EP-06 | Cliente | ver el detalle de un pedido | revisar qué compré y su estado | Alta | 2 | _(asignar)_ | Pendiente |
| HU-025 | EP-06 | Cliente | cancelar un pedido no despachado | arrepentirme a tiempo | Baja | 3 | _(asignar)_ | Pendiente |
| HU-026 | EP-06 | Administrador | ver todos los pedidos | gestionar la operación de la tienda | Alta | 3 | _(asignar)_ | Pendiente |
| HU-027 | EP-06 | Administrador | cambiar el estado de un pedido | informar el avance al cliente | Alta | 3 | _(asignar)_ | Pendiente |
| HU-028 | EP-07 | Administrador | registrar el stock de un producto | saber cuánto hay disponible | Alta | 3 | _(asignar)_ | Pendiente |
| HU-029 | EP-07 | Sistema | descontar stock al confirmar un pedido | mantener el inventario exacto | Alta | 3 | _(asignar)_ | Pendiente |
| HU-030 | EP-07 | Administrador | ver alertas de stock bajo | reabastecer a tiempo | Media | 3 | _(asignar)_ | Pendiente |
| HU-031 | EP-08 | Administrador | ver el reporte de ventas por período | conocer el desempeño del negocio | Media | 5 | _(asignar)_ | Pendiente |
| HU-032 | EP-08 | Administrador | ver los productos más vendidos | decidir qué reabastecer | Baja | 3 | _(asignar)_ | Pendiente |

## Resumen de priorización

| Prioridad | Historias | Puntos |
| --------- | --------- | ------ |
| Alta (MVP) | 20 | 56 |
| Media | 9 | 26 |
| Baja | 3 | 9 |

## Alcance del MVP

El MVP lo componen **las 20 historias de prioridad Alta**, que cubren el flujo completo:

> registrarse → ver catálogo → buscar → agregar al carrito → confirmar pedido →
> el administrador gestiona producto, stock y estado del pedido.

Estados posibles de una historia: `Pendiente` · `En curso` · `En revisión` · `Terminada`.
