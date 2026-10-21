# Mapa de navegación — Administrador

Fuente: página `Administrador — Fase 5` de la [copia editable](https://www.figma.com/design/UsY5qE22TXGdLtcV6W99P8?node-id=2002-608).

## Entrada y navegación

1. El enlace de entrega abre directamente **01 Acceso**. La portada opcional **00 Inicio del prototipo** abre Acceso, Resumen, Catálogo, Inventario, Pedidos, Usuarios, Reportes o el índice de escenarios.
2. **01 Acceso** conduce a **08 Selección de rol** y, desde Administrador, a **10 Dashboard**.
3. La barra lateral conecta Resumen, Pedidos, Productos, Categorías y ocasiones, Inventario, Promociones, Usuarios y roles, Consultas y reportes, Configuración, Perfil y Cerrar sesión.
4. **00b Escenarios** abre las variantes de error y las vistas móviles para su revisión.

## Recorridos por módulo

| Módulo | Recorrido principal | Alternativas |
| --- | --- | --- |
| Acceso | Login → Rol → Dashboard | Credenciales inválidas, bloqueo, acceso restringido |
| Recuperación | Solicitar enlace → Solicitud recibida → Abrir enlace recibido (demostración) → Nueva contraseña → Login | Enlace expirado o utilizado |
| Pedidos | Listado → Detalle → Cambio de estado → Confirmación → Estado actualizado | Sin repartidor, transición inválida, cancelación con confirmación |
| Reparto | Detalle / Resultado actualizado → Asignar repartidor → Guardar | No hay repartidores disponibles |
| Productos | Listado → Crear / Detalle → Editar → Guardado | Precio o stock inicial inválido; desactivación con confirmación |
| Categorías | Listado → Formulario → Guardado | Nombre duplicado → Corregir |
| Inventario | Existencias → Movimientos / Entrada → Guardado | Stock bajo y umbral configurable |
| Merma | Registrar → Revisar descuento → Confirmar → Movimiento y saldo resultante | Cantidad superior a existencias → Corregir |
| Promociones | Listado → Formulario → Guardado | Promoción activa superpuesta → Corregir |
| Usuarios | Listado → Crear / Detalle → Roles → Guardado | Correo duplicado; desactivación con confirmación |
| Reportes | Ventas ↔ Más vendidos ↔ Pedidos por estado | Consulta vacía y limpieza de filtros |
| Pagos | Pedidos → Consultar transacciones → Detalle; Detalle de pedido → Ver transacción | Resultado simulado consultable |
| Personalizados | Pedidos → Consultar solicitudes → Detalle → Volver | Gestión manual, sin precio dinámico |
| Configuración | Cobertura, operación, franjas y cupos → Guardado | Valores de ejemplo pendientes de validar |
| Cuenta | Perfil → Cambiar rol / Confirmar salida → Login | Sesión expirada; error de carga con reintento |
| Móvil | Resumen ↔ Menú ↔ Pedidos ↔ Detalle; Resumen ↔ Inventario | Enlaces a representaciones de escritorio para módulos complementarios |

## Convenciones del prototipo

- Los botones Cancelar de los formularios vuelven al paso anterior.
- Los botones de desactivación/cancelación de negocio tienen una pantalla de confirmación.
- Los escenarios del índice permiten revisar errores sin provocar operaciones reales.
- Los listados y formularios usan datos preparados; los filtros y formularios son representaciones de diseño, no consultas a una base de datos.
- La página `empleado` permanece como referencia y no se modifica para implementar estos recorridos.
