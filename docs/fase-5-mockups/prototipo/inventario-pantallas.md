# Inventario de pantallas — Prototipo unificado — Fase 5

Actualizado: 2026-11-04. Estado: en revisión del equipo.

## Fuente editable y revisión

- [Archivo de Figma, página de trabajo](https://www.figma.com/design/QDoaQkNeS6LKLq34XCXVlb/?node-id=7-2)
- [Prototipo para compartir, inicio en el Índice](https://www.figma.com/proto/QDoaQkNeS6LKLq34XCXVlb?node-id=94-577&page-id=7%3A2&starting-point-node-id=94%3A577&scaling=scale-down-width&content-scaling=fixed)
- Carpeta de PNG: [wireframes](../wireframes/)

El prototipo no es una implementación de fase 6: los formularios contienen valores de muestra y las transiciones representan escenarios preparados. No autentica usuarios, no procesa pagos, no persiste datos y no ejecuta validaciones de servidor.

Las pantallas archivadas (nombre que empieza por «ARCHIVO ·») no se incluyen en este inventario.

## Fuentes revisadas

Se contrastaron los documentos locales de fases 1 y 2 con `origin/main`, incluido `docs/fase-2-requerimientos/Fase_2_Requerimientos_Floristeria.md`. También se consultaron el modelo integrado y el script de tablas de fase 4 para mantener consistencia de roles, inventario, estados y pagos. La gobernanza consultada es `CONTRIBUTING.md` y `.github/pull_request_template.md`.

## Inventario por sección

Conteo real según la página 7:2 de Figma, sin pantallas archivadas.

| Sección | Pantallas | Cantidad |
| --- | --- | ---: |
| 00 · Índice | 00 Índice del prototipo | 1 |
| 0 · Guía de estilo | Guía de estilo (nodo 43:1120) | 1 |
| 1 · Visitante | V01 Inicio; V02 Catálogo; V03 Detalle; V06 Carrito | 4 |
| 2 · Cliente registrado | R01 Inicio; R02 Catálogo; R03 Detalle; R04 Carrito; R05 Checkout; R06 Confirmación; R07 Mis pedidos; R08 Perfil | 8 |
| 3 · Cliente (variante con fotos) | C01 Inicio; C02 Catálogo; C03 Detalle del producto; C04 Producto agregado al carrito; C05 Carrito de compras; C06 Finalizar pedido; C07 Confirmación del pedido; C08 Mis pedidos; C09 Detalle y seguimiento del pedido; C12 Mensajes y estados del sistema | 10 |
| 4 · Acceso y roles | A01 Iniciar sesión; A02 Selección de rol; A03 Crear cuenta; A04 Credenciales inválidas; A05 Bloqueo temporal; A06 Recuperar contraseña; A07 Solicitud enviada; A08 Nueva contraseña; A09 Enlace inválido; A10 Sin autorización; A11 Sesión expirada | 11 |
| 5 · Empleado | E01 Resumen; E02 Pedidos asignados a preparación; E03 Detalle de producto; E04 Movimientos; E05 Movimientos del producto; E06 Merma; E07 Confirmación de merma | 7 |
| 6 · Repartidor | D01 Resumen; D02 Mis entregas; D03 Detalle de entrega; D04 Historial | 4 |
| 7 · Pagos | P01 Resumen; P02 Procesar pago; P03 Historial de transacciones; P04 Detalle de transacción; P05 Historial | 5 |
| 8 · Administrador | Ver desglose abajo | 62 |
| **Total** | | **113** |

La Guía de estilo es la única de las 113 pantallas sin PNG en `wireframes/`.

### Desglose de Administrador (62)

| Grupo | Pantallas | Cantidad |
| --- | --- | ---: |
| Revisión | AD00 Inicio del prototipo; AD00b Escenarios de revisión | 2 |
| Resumen | AD10 Dashboard | 1 |
| Pedidos | AD11 Listado; AD12 Detalle; AD13 Cambiar estado; AD14 Asignar repartidor; AD15 Sin repartidor; AD16 Transición inválida; AD17 Cancelar con confirmación; AD18 Resultado actualizado | 8 |
| Catálogo | AD20 Listado; AD21 Crear; AD22 Editar; AD23 Errores; AD24 Detalle; AD25 Desactivar; AD26 Categorías y ocasiones; AD27 Formulario de categoría; AD28 Categoría duplicada | 9 |
| Inventario | AD30 Existencias; AD31 Entrada; AD32 Movimientos; AD33 Merma; AD34 Error de merma; AD35 Confirmar merma; AD36 Umbral; AD37 Merma registrada | 8 |
| Promociones | AD40 Listado; AD41 Formulario; AD42 Conflicto | 3 |
| Usuarios | AD50 Listado; AD51 Crear y asignar roles; AD52 Detalle; AD53 Desactivar; AD54 Correo duplicado | 5 |
| Reportes | AD60 Ventas; AD61 Más vendidos; AD62 Pedidos por estado; AD63 Sin resultados | 4 |
| Configuración | AD70 Entregas, cobertura y cupos | 1 |
| Personalización | AD75 Configuración de personalización; AD76 Logo seleccionado; AD77 Colores elegidos; AD78 Guardada | 4 |
| Pagos | AD71 Consulta de transacciones; AD72 Detalle de transacción | 2 |
| Personalizados | AD73 Consulta manual de solicitudes; AD74 Detalle de solicitud | 2 |
| Cuenta y sistema | AD80 Mi perfil; AD81 Cerrar sesión; AD83 Error de carga; AD84 Confirmación de guardado | 4 |
| Móvil y tableta | AD90 Resumen; AD91 Menú; AD92 Pedidos; AD93 Detalle de pedido; AD94 Inventario; AD95 Personalización; AD96 Personalización editada; AD97 Personalización guardada; AD98 Tableta, personalización | 9 |
| **Total** | | **62** |

Las vistas de móvil (AD90 a AD97) y tableta (AD98) ilustran los flujos principales. Los módulos complementarios del menú remiten a su representación de escritorio para revisión.

## Trazabilidad

Los identificadores HU y RF corresponden uno a uno en la documentación del proyecto.

| Necesidad | HU / RF | Reglas reflejadas | Pantallas |
| --- | --- | --- | --- |
| Acceso, cierre, recuperación y equipo | 002–006 | RN-02, RN-05/30, RN-06, RN-31–35, RN-G6 | A01–A11, AD50–AD54, AD80–AD81, AD83 |
| Crear y mantener catálogo | 009–012 | RN-08–10, RN-14–17, RN-38–40 | AD20–AD28 |
| Solicitudes y campañas | 013–014 | RN-18/41, RN-19/42, R-06 | AD40–AD42, AD73–AD74 |
| Consulta y detalle de pedidos | 030, 032 | RN-G2, RN-22, RN-29 | AD11–AD12 |
| Transiciones y asignación | 033–034 | RN-29; asignación de un repartidor activo en estado permitido | AD13–AD18 |
| Información de pagos | 028 | RN-27/45, RN-28/46, R-03 | AD71–AD72 |
| Movimientos y merma | 037–040 | RN-G3–G5, RN-15/38, RN-47 | AD30–AD37 |
| Ventas, ranking y estados | 041–043 | RN-48: solo Entregados para ventas y ranking | AD60–AD63 |
| Cobertura, franjas y alta demanda | Soporte a 023–024 | RN-23–25, R-07–08 | AD70 |
| Claridad, errores y navegación | RNF-011, 012, 014 | Campos obligatorios, mensajes y retornos | Formularios y AD00b |
| Adaptación a dispositivos | RNF-019 | Muestras de escritorio, móvil y tableta | AD90–AD98 |

La cancelación administrativa se muestra como una acción de operación coherente con el ciclo de estados. RF-031 describe expresamente la cancelación del cliente: el equipo debe validar el permiso administrativo y los estados cancelables antes de implementar. No se amplía por ello el alcance contractual de RF-031.

## Criterios y decisiones pendientes

- El stock comercial se consulta; los cambios pasan por movimientos de inventario. Desactivar conserva el historial.
- La cuenta de muestra Ana tiene roles Administrador y Empleado; la merma se representa dentro de ese contexto.
- El ciclo ilustrado es Confirmado → En preparación → En camino → Entregado. No se habilitan saltos arbitrarios.
- Los reportes de ventas y ranking excluyen pedidos no entregados. Los valores son ilustrativos.
- Pago simulado, sin pasarela real ni facturación electrónica.
- Las solicitudes personalizadas se consultan para gestión manual, sin cotización dinámica.
- Horarios, zonas, cupos, duración del bloqueo temporal y políticas de cancelación necesitan validación del negocio; no se consideran acuerdos aprobados.
- Recuperación, categorías avanzadas, promociones y reportes conservan las prioridades Media/Baja del backlog. Dibujarlos no los convierte automáticamente en alcance del MVP.

## Verificación realizada

- La conexión entre pantallas se verificó por script. La prueba de clics en reproducción está pendiente en laptop.
- La revisión visual se hizo por muestra, no sobre todas las exportaciones.
- Esta verificación no equivale a una prueba funcional del sistema ni a la aprobación del equipo. La revisión final queda a cargo de los responsables del proyecto.
