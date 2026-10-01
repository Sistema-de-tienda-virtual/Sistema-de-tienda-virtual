# FASE 2 — REQUERIMIENTOS DEL SISTEMA

**Tienda / Floristería**

*Versión corregida y alineada con la Fase 1*

## 1. Requerimientos funcionales

### RF-001 a RF-006 — Usuarios y autenticación

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-001 | El sistema deberá permitir al visitante registrarse mediante nombre, correo electrónico y contraseña. | Alta | HU-001 |
| RF-002 | El sistema deberá permitir a un cliente registrado iniciar sesión mediante correo y contraseña. | Alta | HU-002 |
| RF-003 | El sistema deberá permitir al usuario cerrar sesión e invalidar la sesión activa para impedir el acceso posterior a funcionalidades protegidas. | Alta | HU-003 |
| RF-004 | El sistema deberá permitir al cliente consultar y modificar sus datos de perfil. | Media | HU-004 |
| RF-005 | El sistema deberá permitir al usuario solicitar la recuperación de su contraseña mediante un mecanismo seguro. | Media | HU-005 |
| RF-006 | El sistema deberá permitir al administrador crear, desactivar y asignar uno o varios roles a las cuentas de empleados y repartidores. | Alta | HU-006 |

### RF-007 a RF-014 — Catálogo de productos

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-007 | El sistema deberá permitir visualizar el listado de productos activos y disponibles. | Alta | HU-007 |
| RF-008 | El sistema deberá permitir consultar el detalle de un producto, incluyendo información comercial y disponibilidad. | Alta | HU-008 |
| RF-009 | El sistema deberá permitir al administrador crear productos indicando como mínimo nombre, descripción, precio, stock inicial, fecha de ingreso y vida útil estimada. | Alta | HU-009 |
| RF-010 | El sistema deberá permitir al administrador editar la información de un producto, sin modificar directamente su stock desde el catálogo. | Alta | HU-010 |
| RF-011 | El sistema deberá permitir al administrador desactivar productos sin eliminar su historial ni sus movimientos de inventario. | Media | HU-011 |
| RF-012 | El sistema deberá permitir al administrador crear, editar y desactivar categorías y ocasiones, respetando sus reglas de unicidad. | Media | HU-012 |
| RF-013 | El sistema deberá permitir al cliente solicitar un arreglo personalizado mediante una descripción de su necesidad. | Baja | HU-013 |
| RF-014 | El sistema deberá permitir al administrador crear promociones por temporada, asociarlas a uno o varios productos y definir su periodo de vigencia. | Baja | HU-014 |

### RF-015 a RF-018 — Búsqueda y navegación

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-015 | El sistema deberá permitir buscar productos por nombre, sin distinguir mayúsculas ni tildes. | Alta | HU-015 |
| RF-016 | El sistema deberá permitir filtrar productos por categoría y ocasión. | Alta | HU-016 |
| RF-017 | El sistema deberá permitir filtrar productos por un rango de precio. | Media | HU-017 |
| RF-018 | El sistema deberá mostrar el catálogo mediante paginación y conservar los filtros activos al cambiar de página. | Media | HU-018 |

### RF-019 a RF-022 — Carrito

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-019 | El sistema deberá permitir al cliente agregar productos al carrito indicando una cantidad válida. | Alta | HU-019 |
| RF-020 | El sistema deberá permitir modificar la cantidad de los productos del carrito respetando el stock disponible. | Alta | HU-020 |
| RF-021 | El sistema deberá permitir eliminar productos del carrito. | Alta | HU-021 |
| RF-022 | El sistema deberá calcular y mostrar correctamente el total del carrito, considerando cantidades y promociones vigentes. | Alta | HU-022 |

### RF-023 a RF-028 — Checkout

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-023 | El sistema deberá permitir registrar los datos del comprador, destinatario y dirección de entrega. | Alta | HU-023 |
| RF-024 | El sistema deberá permitir seleccionar una fecha y franja horaria válida, considerando días de operación, cobertura y cupos configurados. | Alta | HU-024 |
| RF-025 | El sistema deberá permitir registrar un mensaje de dedicatoria opcional de máximo 200 caracteres. | Media | HU-025 |
| RF-026 | El sistema deberá permitir al cliente confirmar el pedido a partir del carrito, validando la información necesaria antes de crear el pedido. | Alta | HU-026 |
| RF-027 | El sistema deberá permitir seleccionar un método de pago disponible dentro de las opciones definidas para el pago simulado. | Media | HU-027 |
| RF-028 | El sistema deberá registrar el resultado de la transacción de pago simulada, indicando monto, método, fecha/hora y estado. | Media | HU-028 |

### RF-029 a RF-036 — Pedidos y entregas

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-029 | El sistema deberá permitir al cliente consultar el historial de sus propios pedidos. | Alta | HU-029 |
| RF-030 | El sistema deberá permitir consultar el detalle y estado de un pedido autorizado para el usuario. | Alta | HU-030 |
| RF-031 | El sistema deberá permitir al cliente cancelar un pedido únicamente cuando su estado lo permita y previa confirmación. | Baja | HU-031 |
| RF-032 | El sistema deberá permitir al administrador consultar todos los pedidos del negocio y filtrarlos para gestionar la operación. | Alta | HU-032 |
| RF-033 | El sistema deberá permitir al administrador cambiar el estado de un pedido respetando el ciclo de estados definido. | Alta | HU-033 |
| RF-034 | El sistema deberá permitir al administrador asignar un repartidor disponible a un pedido cuando su estado lo permita. | Alta | HU-034 |
| RF-035 | El sistema deberá permitir al repartidor consultar únicamente los pedidos que le fueron asignados. | Alta | HU-035 |
| RF-036 | El sistema deberá permitir al repartidor actualizar el estado de la entrega y registrar la información correspondiente a la entrega o no entrega. | Alta | HU-036 |

### RF-037 a RF-040 — Inventario

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-037 | El sistema deberá permitir al administrador registrar entradas de inventario y consultar los movimientos de stock por producto. | Alta | HU-037 |
| RF-038 | El sistema deberá descontar automáticamente del stock la cantidad correspondiente cuando un pedido sea confirmado. | Alta | HU-038 |
| RF-039 | El sistema deberá mostrar alertas cuando el stock de un producto sea inferior al umbral mínimo configurado. | Media | HU-039 |
| RF-040 | El sistema deberá permitir al empleado registrar como merma los productos deteriorados, vencidos o dañados, respetando el stock disponible. | Alta | HU-040 |

### RF-041 a RF-043 — Reportes

| ID | Requerimiento funcional | Prioridad | HU |
| --- | --- | --- | --- |
| RF-041 | El sistema deberá generar un reporte de ventas para un periodo seleccionado, contabilizando únicamente pedidos entregados. | Media | HU-041 |
| RF-042 | El sistema deberá generar un ranking de productos más vendidos utilizando únicamente pedidos entregados. | Baja | HU-042 |
| RF-043 | El sistema deberá generar un reporte de pedidos agrupados por estado. | Baja | HU-043 |

## 2. Requerimientos no funcionales

### RNF de seguridad

| ID | Requerimiento |
| --- | --- |
| RNF-001 | Las contraseñas deberán almacenarse mediante hash adaptativo con sal y nunca en texto plano ni mediante cifrado reversible. |
| RNF-002 | Las funcionalidades administrativas deberán estar disponibles únicamente para usuarios autenticados con los roles correspondientes. |
| RNF-003 | Las sesiones deberán invalidarse al cerrar sesión para impedir acceso posterior a recursos protegidos. |
| RNF-004 | El sistema deberá validar los datos ingresados por el usuario antes de almacenarlos. |
| RNF-005 | El sistema no deberá revelar mediante mensajes de autenticación si un correo específico existe o no en la plataforma. |

### RNF de rendimiento

| ID | Requerimiento |
| --- | --- |
| RNF-006 | Las páginas principales deberán responder en un máximo de 3 segundos en el percentil 95, con hasta 50 usuarios concurrentes y datos de prueba representativos. |
| RNF-007 | Las búsquedas y filtros del catálogo deberán presentar resultados sin necesidad de recargar manualmente la página. |
| RNF-008 | La paginación deberá evitar cargar todos los productos simultáneamente cuando el catálogo aumente de tamaño. |

### RNF de disponibilidad y recuperación

| ID | Requerimiento |
| --- | --- |
| RNF-009 | El sistema deberá estar disponible durante los horarios de operación definidos por la floristería, excluyendo mantenimientos programados previamente comunicados. |
| RNF-010 | El sistema deberá conservar la información registrada ante cierres normales y contar con copias de seguridad diarias; el tiempo objetivo de recuperación será de 24 horas. |

### RNF de usabilidad

| ID | Requerimiento |
| --- | --- |
| RNF-011 | Las interfaces deberán mostrar mensajes claros de éxito, advertencia y error. |
| RNF-012 | Los formularios deberán indicar los campos obligatorios y los errores de validación. |
| RNF-013 | El proceso de compra deberá presentar al cliente un resumen antes de confirmar el pedido. |
| RNF-014 | El sistema deberá utilizar una navegación consistente para visitantes, clientes y usuarios administrativos. |

### RNF de mantenibilidad

| ID | Requerimiento |
| --- | --- |
| RNF-015 | El sistema deberá organizarse en módulos independientes para usuarios, catálogo, carrito, pedidos, inventario y reportes. |
| RNF-016 | El código deberá utilizar nombres de clases, métodos y variables consistentes y documentar las funciones críticas. |
| RNF-017 | Los cambios en un módulo no deberán modificar innecesariamente el comportamiento de los demás módulos. |

### RNF de compatibilidad

| ID | Requerimiento |
| --- | --- |
| RNF-018 | La aplicación web deberá funcionar correctamente en navegadores modernos como Chrome, Edge y Firefox. |
| RNF-019 | La interfaz deberá adaptarse a resoluciones de escritorio y dispositivos móviles mediante diseño responsive. |

## 3. Reglas de negocio

Se conservan los identificadores de las reglas definidos en la Fase 1 para evitar perder trazabilidad. Las reglas generales usan el prefijo RN-G y las reglas específicas mantienen sus identificadores RN-01 a RN-48.

### 3.1 Reglas generales

| ID | Regla de negocio |
| --- | --- |
| RN-G1 | Un pedido siempre debe tener una fecha y franja horaria de entrega válidas; no pueden ser anteriores a la fecha/hora actual ni estar fuera de los días y horarios de operación. |
| RN-G2 | El comprador y el destinatario de un pedido pueden ser personas distintas; el pedido debe conservar los datos de ambos. |
| RN-G3 | El stock de un producto nunca puede quedar en un valor negativo. |
| RN-G4 | El stock se descuenta al confirmar el pedido, no al agregarlo al carrito. |
| RN-G5 | Todo producto marcado como merma se descuenta del stock disponible y queda registrado con fecha y motivo. |
| RN-G6 | Un usuario puede tener más de un rol dentro del sistema. |

### 3.2 Reglas específicas

| ID | Regla de negocio |
| --- | --- |
| RN-01 | El correo electrónico es único por cuenta. |
| RN-02 | La contraseña debe tener mínimo 8 caracteres, con al menos una letra y un número. |
| RN-03 | Toda cuenta creada desde el formulario público recibe el rol Cliente. |
| RN-04 | Las contraseñas se almacenan mediante hash adaptativo con sal y nunca en texto plano. |
| RN-05 | La información de autenticación no debe revelar si un correo existe; esta regla se aplica a los mensajes de error y recuperación. |
| RN-06 | Solo el administrador puede crear o desactivar cuentas de empleado y repartidor. |
| RN-07 | Solo se muestran en el catálogo público los productos con estado Activo. |
| RN-08 | Todo producto queda asociado a una fecha de ingreso al inventario. |
| RN-09 | El precio de un producto debe ser mayor que cero. |
| RN-10 | El stock inicial no puede ser negativo y no se puede agregar al carrito una cantidad mayor al stock disponible. |
| RN-11 | La cantidad mínima por ítem del carrito es 1 y debe ser un número entero. |
| RN-12 | Agregar al carrito no reserva ni descuenta stock; el descuento ocurre al confirmar el pedido. |
| RN-13 | El precio del ítem que se utiliza para confirmar la compra es el vigente al momento de confirmar el pedido. |
| RN-14 | La vida útil estimada del producto sirve como base para alertas de vencimiento y para el registro de merma. |
| RN-15 | El stock de un producto solo se modifica mediante movimientos de inventario, como entradas, ventas o merma. |
| RN-16 | Desactivar un producto no elimina su historial ni sus movimientos de inventario. |
| RN-17 | El nombre de una categoría es único. |
| RN-18 | Un arreglo personalizado no tiene precio fijo hasta que el administrador lo cotiza. |
| RN-19 | Un producto solo puede tener una promoción activa a la vez. |
| RN-20 | Las búsquedas y filtros del catálogo solo deben devolver productos activos. |
| RN-21 | El número de productos por página es configurable, con un valor por defecto de 12. |
| RN-22 | Todo pedido guarda de forma independiente los datos del comprador y del destinatario. |
| RN-23 | La dirección de entrega debe pertenecer a la zona de cobertura configurada por el administrador. |
| RN-24 | Cada franja horaria tiene un cupo máximo de pedidos configurado por el administrador. |
| RN-25 | El administrador puede definir fechas de alta demanda con cupos distintos a los normales. |
| RN-26 | El mensaje de dedicatoria tiene un máximo de 200 caracteres. |
| RN-27 | El pago en línea es simulado; no se integra una pasarela de pago real. |
| RN-28 | Todo pedido tiene al menos una transacción de pago asociada. |
| RN-29 | Los estados de un pedido siguen un ciclo definido: Confirmado → En preparación → En camino → Entregado, con posibilidad de pasar a Cancelado únicamente desde los estados permitidos. |
| RN-30 | El mensaje de error de credenciales inválidas nunca debe revelar si el correo existe o no. |
| RN-31 | Tras 5 intentos fallidos consecutivos, la cuenta se bloquea temporalmente. |
| RN-32 | Cerrar sesión invalida la sesión o token activo en el servidor. |
| RN-33 | El correo sigue siendo único también al momento de editar el perfil. |
| RN-34 | El enlace de recuperación de contraseña expira a los 30 minutos de haberse generado. |
| RN-35 | Un enlace de recuperación de contraseña solo puede utilizarse una vez. |
| RN-36 | Solo el administrador puede crear o desactivar cuentas de empleado y repartidor. |
| RN-37 | Solo se muestran productos con estado Activo en el catálogo público. |
| RN-38 | El stock de un producto solo se modifica a través de movimientos de inventario. |
| RN-39 | Desactivar un producto no elimina su historial ni sus movimientos de inventario. |
| RN-40 | El nombre de una categoría es único. |
| RN-41 | Un arreglo personalizado no tiene precio fijo hasta que el administrador lo cotiza. |
| RN-42 | Un producto solo puede tener una promoción activa a la vez. |
| RN-43 | El número de productos por página es configurable, con valor por defecto de 12. |
| RN-44 | El mensaje de dedicatoria tiene un máximo de 200 caracteres. |
| RN-45 | El pago en línea es simulado; no se integra una pasarela de pago real. |
| RN-46 | Todo pedido tiene al menos una transacción de pago asociada. |
| RN-47 | El stock mínimo para alertar es configurable por producto; si no se configura, no se genera alerta. |
| RN-48 | Los reportes de ventas y el ranking de productos vendidos solo contabilizan pedidos en estado Entregado. |

Nota de consistencia: cuando una regla específica repite una regla general, ambas se conservan para mantener la trazabilidad histórica con la Fase 1. En la implementación se aplicará una sola regla efectiva.

## 4. Restricciones

| ID | Restricción |
| --- | --- |
| R-01 | El sistema estará desarrollado inicialmente para una única floristería y no como plataforma multi-tienda/SaaS. |
| R-02 | El sistema será una aplicación web; una aplicación móvil nativa está fuera del alcance inicial. |
| R-03 | No se integrará una pasarela de pago real; el pago será simulado. |
| R-04 | No se integrarán empresas externas de mensajería o transporte. |
| R-05 | La facturación electrónica ante entidades de control está fuera del alcance actual. |
| R-06 | La cotización interactiva con precio dinámico para arreglos personalizados está fuera del alcance inicial; la solicitud será gestionada manualmente por el administrador. |
| R-07 | Los datos actuales de la floristería son genéricos y deberán validarse posteriormente con el negocio real. |
| R-08 | Los días y horarios de operación, franjas de entrega, zona de cobertura y cupos por franja aún deben definirse con el negocio real. |
| R-09 | El MVP está compuesto por las 27 historias de usuario clasificadas como prioridad Alta en la Fase 1. |

### 4.1 Alcance del MVP

El MVP comprende las 27 historias de usuario de prioridad Alta. El flujo principal es: registrarse → iniciar sesión → consultar catálogo → buscar/filtrar → agregar al carrito → registrar destinatario y entrega → confirmar pedido → gestionar pedido → gestionar inventario → realizar la entrega.

Las historias de prioridad Media corresponden a una segunda iteración y las de prioridad Baja son funcionalidades deseables posteriores.

## 5. Criterios de aceptación

### 5.1 Criterios de aceptación consolidados para los 43 requisitos

| RF | Criterio de aceptación consolidado |
| --- | --- |
| RF-001 | Se crea una cuenta Cliente con datos válidos y se rechazan correos duplicados o datos inválidos. |
| RF-002 | Con credenciales válidas se inicia sesión; con credenciales inválidas se rechaza sin revelar si el correo existe. |
| RF-003 | Al cerrar sesión se invalida la sesión activa y no se permite acceder a recursos protegidos. |
| RF-004 | El cliente puede modificar datos válidos y el sistema rechaza información inválida o un correo ya utilizado. |
| RF-005 | El sistema permite solicitar recuperación, no revela si el correo existe y rechaza enlaces expirados o ya utilizados. |
| RF-006 | El administrador puede crear y desactivar cuentas de empleados/repartidores y asignar uno o varios roles. |
| RF-007 | Los visitantes visualizan únicamente productos activos. |
| RF-008 | El detalle muestra como mínimo nombre, descripción, precio y disponibilidad; un producto inexistente o inactivo no se muestra. |
| RF-009 | El administrador puede crear productos con los datos obligatorios y el sistema rechaza precio menor o igual a cero y stock negativo. |
| RF-010 | El administrador puede modificar la información del producto y el stock no se modifica directamente desde el catálogo. |
| RF-011 | Al desactivar un producto deja de ofrecerse sin eliminar su historial ni movimientos. |
| RF-012 | El administrador puede gestionar categorías y ocasiones y el sistema impide duplicados según las reglas definidas. |
| RF-013 | El cliente puede enviar una solicitud de arreglo personalizado con una descripción obligatoria. |
| RF-014 | El administrador puede crear promociones con productos y vigencia; un producto no puede tener dos promociones activas simultáneamente. |
| RF-015 | Una búsqueda por nombre encuentra coincidencias sin distinguir mayúsculas ni tildes y solo devuelve productos activos. |
| RF-016 | Los filtros de categoría y ocasión muestran únicamente productos activos que cumplen el criterio. |
| RF-017 | El rango de precio devuelve productos activos dentro de los límites indicados y valida rangos inválidos. |
| RF-018 | Los resultados se muestran por páginas, con valor configurable y defecto de 12, conservando los filtros activos. |
| RF-019 | El sistema permite agregar una cantidad entera mayor o igual a 1 y no superior al stock disponible; agregar no descuenta stock. |
| RF-020 | La modificación de cantidad respeta el stock disponible; una cantidad cero puede producir el mismo efecto que eliminar el ítem. |
| RF-021 | El sistema elimina el producto del carrito después de confirmar la acción. |
| RF-022 | El total corresponde a la suma de cantidades por precio vigente y considera las promociones aplicables. |
| RF-023 | El pedido conserva de forma independiente los datos del comprador, destinatario y dirección, y valida la zona de cobertura. |
| RF-024 | Solo se permiten fechas y franjas válidas, dentro de operación y con cupo disponible. |
| RF-025 | La dedicatoria es opcional y no supera 200 caracteres. |
| RF-026 | Al confirmar se crea el pedido solo si la información es válida y existe stock suficiente; el stock se descuenta en la confirmación. |
| RF-027 | El cliente puede elegir un método de pago permitido dentro del alcance del pago simulado. |
| RF-028 | La transacción queda registrada con monto, método, fecha/hora y estado. |
| RF-029 | El cliente puede consultar únicamente sus propios pedidos. |
| RF-030 | El detalle muestra productos, destinatario, entrega y estado, respetando la autorización de acceso. |
| RF-031 | Solo se puede cancelar un pedido en los estados permitidos y la cancelación requiere confirmación. |
| RF-032 | El administrador puede consultar los pedidos y filtrarlos para gestionar la operación. |
| RF-033 | El administrador puede cambiar el estado respetando el ciclo definido. |
| RF-034 | El administrador puede asignar como máximo un repartidor a un pedido y solo cuando el estado lo permita. |
| RF-035 | El repartidor visualiza únicamente los pedidos que le fueron asignados. |
| RF-036 | El repartidor puede actualizar únicamente pedidos asignados y, al marcar Entregado, se registra fecha/hora real de entrega. |
| RF-037 | El administrador puede registrar entradas de inventario y consultar movimientos con fecha, cantidad y tipo. |
| RF-038 | Al confirmar el pedido se descuenta el stock y se registra el movimiento de venta; si una cancelación libera stock, se reintegra la cantidad correspondiente. |
| RF-039 | Se muestra alerta cuando el stock está por debajo del umbral configurable; sin umbral no se genera alerta. |
| RF-040 | La merma reduce el stock, exige motivo y no puede superar el stock disponible; se conserva fecha, cantidad y responsable. |
| RF-041 | El reporte de ventas muestra los datos del periodo seleccionado y solo contabiliza pedidos Entregados. |
| RF-042 | El ranking ordena productos por cantidad vendida y solo contabiliza pedidos Entregados. |
| RF-043 | El reporte muestra la cantidad de pedidos agrupada por estado, incluyendo cero cuando corresponda. |

## 6. Matriz de trazabilidad

La matriz demuestra la relación entre las necesidades definidas en la Fase 1 y los elementos de la Fase 2. Las 43 historias se mantienen trazables a un único requerimiento funcional, y cada requerimiento tiene un criterio de aceptación.

| HU | Épica | RF | Reglas de negocio aplicables | Criterio de aceptación |
| --- | --- | --- | --- | --- |
| HU-001 | EP-01 | RF-001 | RN-01, RN-02, RN-03, RN-04 | CA-RF-001 |
| HU-002 | EP-01 | RF-002 | RN-30, RN-31 | CA-RF-002 |
| HU-003 | EP-01 | RF-003 | RN-32 | CA-RF-003 |
| HU-004 | EP-01 | RF-004 | RN-33 | CA-RF-004 |
| HU-005 | EP-01 | RF-005 | RN-30, RN-34, RN-35 | CA-RF-005 |
| HU-006 | EP-01 | RF-006 | RN-G6, RN-06 | CA-RF-006 |
| HU-007 | EP-02 | RF-007 | RN-07 | CA-RF-007 |
| HU-008 | EP-02 | RF-008 | RN-07 | CA-RF-008 |
| HU-009 | EP-02 | RF-009 | RN-08, RN-09, RN-10, RN-14 | CA-RF-009 |
| HU-010 | EP-02 | RF-010 | RN-09, RN-15 | CA-RF-010 |
| HU-011 | EP-02 | RF-011 | RN-16 | CA-RF-011 |
| HU-012 | EP-02 | RF-012 | RN-17 | CA-RF-012 |
| HU-013 | EP-02 | RF-013 | RN-18 | CA-RF-013 |
| HU-014 | EP-02 | RF-014 | RN-19 | CA-RF-014 |
| HU-015 | EP-03 | RF-015 | RN-07 | CA-RF-015 |
| HU-016 | EP-03 | RF-016 | RN-07 | CA-RF-016 |
| HU-017 | EP-03 | RF-017 | RN-07 | CA-RF-017 |
| HU-018 | EP-03 | RF-018 | RN-21, RN-43 | CA-RF-018 |
| HU-019 | EP-04 | RF-019 | RN-10, RN-11, RN-12, RN-13 | CA-RF-019 |
| HU-020 | EP-04 | RF-020 | RN-10, RN-11 | CA-RF-020 |
| HU-021 | EP-04 | RF-021 | RN-13 | CA-RF-021 |
| HU-022 | EP-04 | RF-022 | RN-13, RN-19 | CA-RF-022 |
| HU-023 | EP-05 | RF-023 | RN-G2, RN-22, RN-23 | CA-RF-023 |
| HU-024 | EP-05 | RF-024 | RN-G1, RN-24, RN-25 | CA-RF-024 |
| HU-025 | EP-05 | RF-025 | RN-26, RN-44 | CA-RF-025 |
| HU-026 | EP-05 | RF-026 | RN-G1, RN-G2, RN-G4 | CA-RF-026 |
| HU-027 | EP-05 | RF-027 | RN-27, RN-45 | CA-RF-027 |
| HU-028 | EP-05 | RF-028 | RN-28, RN-46 | CA-RF-028 |
| HU-029 | EP-06 | RF-029 | RN-29 | CA-RF-029 |
| HU-030 | EP-06 | RF-030 | RN-29 | CA-RF-030 |
| HU-031 | EP-06 | RF-031 | RN-29 | CA-RF-031 |
| HU-032 | EP-06 | RF-032 | RN-29 | CA-RF-032 |
| HU-033 | EP-06 | RF-033 | RN-29, RN-30 | CA-RF-033 |
| HU-034 | EP-06 | RF-034 | RN-24, RN-25 | CA-RF-034 |
| HU-035 | EP-06 | RF-035 | RN-26 | CA-RF-035 |
| HU-036 | EP-06 | RF-036 | RN-26, RN-27 | CA-RF-036 |
| HU-037 | EP-07 | RF-037 | RN-G3, RN-15 | CA-RF-037 |
| HU-038 | EP-07 | RF-038 | RN-G3, RN-G4, RN-29 | CA-RF-038 |
| HU-039 | EP-07 | RF-039 | RN-47 | CA-RF-039 |
| HU-040 | EP-07 | RF-040 | RN-G3, RN-G5, RN-14 | CA-RF-040 |
| HU-041 | EP-08 | RF-041 | RN-48 | CA-RF-041 |
| HU-042 | EP-08 | RF-042 | RN-48 | CA-RF-042 |
| HU-043 | EP-08 | RF-043 | RN-29 | CA-RF-043 |
