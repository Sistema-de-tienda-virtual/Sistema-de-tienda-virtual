# Fase 1 — Épicas

Cada épica agrupa un conjunto de historias de usuario que persiguen un mismo objetivo
de negocio. El identificador de la épica (`EP-xx`) se usa después en la matriz de
trazabilidad de la fase 2.

| ID | Épica | Descripción | Actor principal | Responsable |
| -- | ----- | ----------- | --------------- | ----------- |
| EP-01 | Gestión de usuarios y autenticación | Permitir el registro, inicio de sesión y administración del perfil, con control de roles. | Visitante / Cliente | _(asignar)_ |
| EP-02 | Catálogo de productos | Publicar y organizar los productos por categoría, con su información y disponibilidad. | Cliente / Administrador | _(asignar)_ |
| EP-03 | Búsqueda y navegación | Permitir encontrar productos mediante búsqueda por texto, filtros y ordenamiento. | Visitante / Cliente | _(asignar)_ |
| EP-04 | Carrito de compras | Permitir agregar, modificar y eliminar productos antes de confirmar la compra. | Cliente | _(asignar)_ |
| EP-05 | Proceso de compra (checkout) | Confirmar el pedido registrando datos de entrega y pago. | Cliente | _(asignar)_ |
| EP-06 | Gestión de pedidos | Consultar pedidos y administrar su ciclo de estados. | Cliente / Administrador | _(asignar)_ |
| EP-07 | Gestión de inventario | Controlar las existencias de cada producto y sus movimientos. | Administrador | _(asignar)_ |
| EP-08 | Reportes y estadísticas | Consultar información consolidada de ventas y productos. | Administrador | _(asignar)_ |

## Detalle de las épicas

### EP-01 — Gestión de usuarios y autenticación
**Objetivo:** que cada persona acceda al sistema con una identidad y unos permisos definidos.
**Incluye:** registro, inicio y cierre de sesión, recuperación de contraseña, edición de perfil, roles.

### EP-02 — Catálogo de productos
**Objetivo:** que el cliente conozca qué se vende y el administrador mantenga esa información al día.
**Incluye:** listado de productos, detalle, imágenes, categorías, crear/editar/eliminar productos.

### EP-03 — Búsqueda y navegación
**Objetivo:** que el cliente encuentre rápidamente lo que busca.
**Incluye:** búsqueda por nombre, filtro por categoría y precio, ordenamiento, paginación.

### EP-04 — Carrito de compras
**Objetivo:** que el cliente reúna varios productos antes de comprar.
**Incluye:** agregar al carrito, cambiar cantidades, eliminar ítems, ver total, persistencia del carrito.

### EP-05 — Proceso de compra (checkout)
**Objetivo:** convertir el carrito en un pedido registrado.
**Incluye:** datos de entrega, resumen de compra, selección de método de pago, confirmación.

### EP-06 — Gestión de pedidos
**Objetivo:** dar seguimiento a lo comprado.
**Incluye:** historial del cliente, detalle del pedido, listado administrativo, cambio de estado, cancelación.

### EP-07 — Gestión de inventario
**Objetivo:** que no se venda lo que no hay.
**Incluye:** stock por producto, descuento automático al confirmar pedido, alerta de stock bajo, ajustes manuales.

### EP-08 — Reportes y estadísticas
**Objetivo:** apoyar la toma de decisiones del comercio.
**Incluye:** ventas por período, productos más vendidos, pedidos por estado.
