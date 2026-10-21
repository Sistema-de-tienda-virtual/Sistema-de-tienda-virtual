# Administrador — Aroma de Rosas — Fase 5

Fecha: 2026-10-21. Estado: propuesta pendiente de revisión del equipo.

## Fuente editable y revisión

- [Copia editable en Figma](https://www.figma.com/design/UsY5qE22TXGdLtcV6W99P8?node-id=2002-608)
- [Prototipo para compartir: inicio en Acceso](https://www.figma.com/proto/UsY5qE22TXGdLtcV6W99P8?node-id=2001-117&page-id=2001%3A2&starting-point-node-id=2001%3A117&scaling=scale-down&content-scaling=fixed)
- [Portada opcional para explorar los módulos](https://www.figma.com/proto/UsY5qE22TXGdLtcV6W99P8?node-id=2002-608&page-id=2001%3A2&starting-point-node-id=2002%3A608&scaling=scale-down&content-scaling=fixed)
- Página de trabajo: `Administrador — Fase 5`.
- Página visual de referencia conservada: `empleado`.
- Exportación de la portada: [administrador-guia.png](../wireframes/administrador-guia.png).

El diseño contiene 64 pantallas superiores con capas de texto y vectores editables: 59 de escritorio y 5 vistas móviles representativas. No es una implementación de fase 6: los formularios contienen valores de muestra y las transiciones representan escenarios preparados. El prototipo no autentica usuarios, procesa pagos, persiste datos ni ejecuta validaciones de servidor. Algunas filas de demostración reutilizan un detalle representativo.

## Fuentes revisadas

Se contrastaron los documentos locales de fases 1 y 2 con `origin/main`, incluido `docs/fase-2-requerimientos/Fase_2_Requerimientos_Floristeria.md`. También se consultaron el modelo integrado y el script de tablas de fase 4 para mantener consistencia de roles, inventario, estados y pagos. La gobernanza consultada es `CONTRIBUTING.md` y `.github/pull_request_template.md`.

## Inventario de pantallas

| Grupo | Pantallas | Cantidad |
| --- | --- | ---: |
| Revisión | 00 Inicio del prototipo; 00b Escenarios de revisión | 2 |
| Acceso | 01 Login; 02 Credenciales inválidas; 03 Bloqueo temporal; 04 Recuperación; 05 Solicitud enviada; 06 Nueva contraseña; 07 Enlace inválido; 08 Selección de rol; 09 Acceso restringido | 9 |
| Resumen | 10 Dashboard | 1 |
| Pedidos | 11 Listado; 12 Detalle; 13 Cambiar estado; 14 Asignar repartidor; 15 Sin repartidor; 16 Transición inválida; 17 Cancelar con confirmación; 18 Resultado actualizado | 8 |
| Catálogo | 20 Listado; 21 Crear; 22 Editar; 23 Errores; 24 Detalle; 25 Desactivar; 26 Categorías y ocasiones; 27 Formulario de categoría; 28 Categoría duplicada | 9 |
| Inventario | 30 Existencias; 31 Entrada; 32 Movimientos; 33 Merma; 34 Error de merma; 35 Confirmar merma; 36 Umbral; 37 Merma registrada | 8 |
| Promociones | 40 Listado; 41 Formulario; 42 Conflicto | 3 |
| Usuarios | 50 Listado; 51 Crear y asignar roles; 52 Detalle; 53 Desactivar; 54 Correo duplicado | 5 |
| Reportes | 60 Ventas; 61 Más vendidos; 62 Pedidos por estado; 63 Sin resultados | 4 |
| Configuración | 70 Entregas, cobertura y cupos | 1 |
| Pagos | 71 Consulta; 72 Detalle de pago simulado | 2 |
| Personalizados | 73 Consulta de solicitudes; 74 Detalle para gestión manual | 2 |
| Cuenta y sistema | 80 Perfil; 81 Cerrar sesión; 82 Sesión expirada; 83 Error de carga; 84 Guardado | 5 |
| Móvil | 90 Resumen; 91 Menú; 92 Pedidos; 93 Detalle; 94 Inventario | 5 |
| **Total** | | **64** |

Las vistas móviles ilustran el flujo operativo principal. Los módulos complementarios del menú remiten a su representación de escritorio para revisión; no se presentan como un diseño móvil exhaustivo de los 64 estados.

## Trazabilidad

Los identificadores HU y RF corresponden uno a uno en la documentación del proyecto.

| Necesidad | HU / RF | Reglas reflejadas | Pantallas |
| --- | --- | --- | --- |
| Acceso, cierre, recuperación y equipo | 002–006 | RN-02, RN-05/30, RN-06, RN-31–35, RN-G6 | 01–09, 50–54, 80–82 |
| Crear y mantener catálogo | 009–012 | RN-08–10, RN-14–17, RN-38–40 | 20–28 |
| Solicitudes y campañas | 013–014 | RN-18/41, RN-19/42, R-06 | 40–42, 73–74 |
| Consulta y detalle de pedidos | 030, 032 | RN-G2, RN-22, RN-29 | 11–12 |
| Transiciones y asignación | 033–034 | RN-29; asignación de un repartidor activo en estado permitido | 13–18 |
| Información de pagos | 028 | RN-27/45, RN-28/46, R-03 | 71–72 |
| Movimientos y merma | 037–040 | RN-G3–G5, RN-15/38, RN-47 | 30–37 |
| Ventas, ranking y estados | 041–043 | RN-48: solo Entregados para ventas y ranking | 60–63 |
| Cobertura, franjas y alta demanda | Soporte a 023–024 | RN-23–25, R-07–08 | 70 |
| Claridad, errores y navegación | RNF-011, 012, 014 | Campos obligatorios, mensajes y retornos | Formularios y 00b |
| Adaptación a dispositivos | RNF-019 | Muestras de escritorio y móvil | 90–94 |

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

Se revisaron visualmente la referencia de Empleado, el dashboard, la guía exportada y el recorrido en presentación: Guía → Login → Selección de rol → Administrador → Pedidos → Detalle #AR-1052 → Cambiar estado → Confirmar → resultado «En preparación».

También se comprobaron en el editor los destinos de navegación lateral y los enlaces de los recorridos de catálogo, inventario, usuarios, reportes y escenarios alternativos. Esta comprobación no equivale a una prueba funcional del sistema ni a la aprobación del equipo. La revisión final de todas las variantes queda a cargo de los responsables del proyecto.
