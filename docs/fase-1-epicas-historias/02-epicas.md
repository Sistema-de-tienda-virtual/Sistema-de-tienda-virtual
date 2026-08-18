# Fase 1 — Épicas

Cada épica agrupa un conjunto de historias de usuario que persiguen un mismo objetivo
de negocio. El identificador de la épica (`EP-xx`) se usa después en la matriz de
trazabilidad de la fase 2.

| ID | Épica | Descripción | Actor principal | Responsable |
| -- | ----- | ----------- | --------------- | ----------- |
| EP-01 | Gestión de usuarios y autenticación | Permitir el registro, inicio de sesión y administración de perfiles y roles (cliente, administrador, empleado, repartidor). | Visitante / Cliente / Administrador | _(asignar)_ |
| EP-02 | Catálogo de productos | Publicar y organizar flores y arreglos por categoría/ocasión, con su información, disponibilidad y promociones. | Cliente / Administrador | _(asignar)_ |
| EP-03 | Búsqueda y navegación | Permitir encontrar productos mediante búsqueda por texto, filtros y ordenamiento. | Visitante / Cliente | _(asignar)_ |
| EP-04 | Carrito de compras | Permitir agregar, modificar y eliminar productos antes de confirmar la compra. | Cliente | _(asignar)_ |
| EP-05 | Proceso de compra (checkout) | Confirmar el pedido registrando destinatario, dirección, fecha y franja de entrega, dedicatoria y método de pago. | Cliente | _(asignar)_ |
| EP-06 | Gestión de pedidos y entregas | Consultar pedidos, administrar su ciclo de estados y coordinar la entrega con el repartidor. | Cliente / Administrador / Repartidor | _(asignar)_ |
| EP-07 | Gestión de inventario | Controlar las existencias de cada producto, sus movimientos y la merma por deterioro. | Administrador / Empleado | _(asignar)_ |
| EP-08 | Reportes y estadísticas | Consultar información consolidada de ventas, productos y pedidos. | Administrador | _(asignar)_ |

## Detalle de las épicas

### EP-01 — Gestión de usuarios y autenticación
**Objetivo:** que cada persona acceda al sistema con una identidad y unos permisos definidos,
considerando que un mismo usuario puede tener más de un rol (ver RN-G6 en
`01-definicion-del-proyecto.md`).
**Incluye:** registro, inicio y cierre de sesión, recuperación de contraseña, edición de
perfil, gestión de usuarios y roles por parte del administrador (empleados, repartidores).

### EP-02 — Catálogo de productos
**Objetivo:** que el cliente conozca qué se vende y el administrador mantenga esa
información al día, incluyendo la naturaleza perecedera del producto.
**Incluye:** listado de productos, detalle, imágenes, categorías/ocasiones, promociones,
crear/editar/desactivar productos, solicitud de arreglo personalizado.

### EP-03 — Búsqueda y navegación
**Objetivo:** que el cliente encuentre rápidamente lo que busca.
**Incluye:** búsqueda por nombre, filtro por categoría/ocasión y precio, ordenamiento,
paginación.

### EP-04 — Carrito de compras
**Objetivo:** que el cliente reúna varios productos antes de comprar.
**Incluye:** agregar al carrito, cambiar cantidades, eliminar ítems, ver total.

### EP-05 — Proceso de compra (checkout)
**Objetivo:** convertir el carrito en un pedido registrado con todos los datos que exige
una entrega de flores.
**Incluye:** datos del destinatario y dirección de entrega, selección de fecha y franja
horaria, mensaje de dedicatoria, selección de método de pago (simulado), confirmación.

### EP-06 — Gestión de pedidos y entregas
**Objetivo:** dar seguimiento al pedido desde que se confirma hasta que se entrega.
**Incluye:** historial del cliente, detalle y cancelación del pedido, listado
administrativo, cambio de estado, asignación de repartidor, actualización del estado de
entrega por el repartidor.

### EP-07 — Gestión de inventario
**Objetivo:** que no se venda lo que no hay ni lo que ya se deterioró.
**Incluye:** stock por producto, descuento automático al confirmar pedido, alerta de stock
bajo, registro de merma (producto deteriorado o vencido), ajustes manuales.

### EP-08 — Reportes y estadísticas
**Objetivo:** apoyar la toma de decisiones del negocio.
**Incluye:** ventas por período, productos más vendidos, pedidos por estado.
