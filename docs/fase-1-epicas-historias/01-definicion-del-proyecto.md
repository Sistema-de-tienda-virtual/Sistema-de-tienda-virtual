# Fase 1 — Definición del proyecto

> **Nombre de la floristería usado en este documento:** `[Floristería Aroma de Rosas]`
> *(nombre de ejemplo — reemplazar por el nombre real del negocio antes de la entrega final.
> Todo el documento asume un software **a la medida para un único negocio**, no una
> plataforma multi-tienda.)*

## 1. Problema

`[Floristería Aroma de Rosas]` es un negocio [de barrio / local físico] que vende flores,
ramos y arreglos, y que hoy gestiona la mayoría de su operación de forma manual e informal:
pedidos por WhatsApp y llamadas, cuadernos o Excel para el inventario, y cobro únicamente
en efectivo o transferencia manual.

**Cómo se identificó el problema:** entrevista con el/la propietario(a) y observación del
proceso de un pedido de principio a fin, durante la semana 1 del proyecto.
*(Anexar el guion de entrevista usado en `docs/actas-reuniones/`.)*

Consecuencias observadas:

- **Pedidos perdidos o confundidos**: los pedidos llegan mezclados con mensajes personales
  por WhatsApp; no hay un registro único ni un número de pedido.
- **Desconocimiento del inventario real**: no se sabe con certeza cuántas flores de cada
  tipo hay disponibles al momento de vender, ni cuánto stock se pierde por deterioro.
- **Errores en la fecha y hora de entrega**: al no existir una agenda formal, se han
  aceptado más pedidos de los que se pueden entregar en fechas de alta demanda
  (San Valentín, Día de la Madre, Amor y Amistad).
- **Falta de trazabilidad del pedido**: comprador y destinatario no siempre son la misma
  persona (se compra para regalar), y hoy no queda un registro formal de a quién y dónde
  se debe entregar, ni del mensaje de dedicatoria.
- **Nula presencia digital fuera del horario de atención**: el cliente solo puede pedir si
  encuentra a alguien disponible por WhatsApp o en el local.
- **Sin información consolidada**: el negocio no tiene cómo saber qué productos rotan más,
  cuánto se vendió en un periodo, ni cuánta mercancía se pierde por vencimiento (merma).

**Por qué un software a la medida y no una plataforma genérica de e-commerce:** el producto
que se vende es perecedero (vida útil corta) y la mayoría de los pedidos se hacen **para una
fecha y franja horaria específica**, con un destinatario distinto de quien compra y un
mensaje de dedicatoria. Estas reglas de negocio no las resuelve de forma nativa un
e-commerce genérico (tipo tienda de ropa o tecnología), y justifican un desarrollo propio.

## 2. Objetivo general

Desarrollar un sistema de tienda virtual a la medida para `[Floristería Aroma de Rosas]`
que permita publicar su catálogo de flores y arreglos, recibir y gestionar pedidos en línea
—incluyendo fecha, franja de entrega y datos del destinatario—, controlar su inventario
perecedero y dar seguimiento a las entregas, desde un panel administrativo centralizado.

## 3. Objetivos específicos

1. Permitir al cliente consultar el catálogo, buscar y filtrar productos por categoría,
   ocasión y precio.
2. Permitir al cliente armar un carrito de compras y confirmar un pedido indicando
   destinatario, dirección, fecha, franja horaria y mensaje de dedicatoria.
3. Registrar y autenticar usuarios con distintos niveles de acceso (cliente, administrador,
   empleado, repartidor).
4. Permitir al administrador gestionar productos, categorías, promociones e inventario,
   incluyendo el registro de merma por deterioro.
5. Permitir al administrador y al repartidor consultar y actualizar el estado de los
   pedidos, desde la confirmación hasta la entrega.
6. Generar reportes básicos de ventas, productos más vendidos y estado de los pedidos.

## 4. Alcance

### Dentro del alcance (MVP)

- Catálogo de productos con búsqueda y filtros (nombre, categoría/ocasión, precio).
- Registro, inicio de sesión y perfil de usuario (cliente, administrador, empleado,
  repartidor).
- Carrito de compras.
- Checkout con destinatario, dirección, fecha y franja de entrega, y mensaje de
  dedicatoria.
- Gestión de productos, categorías e inventario (incluye registro de merma).
- Gestión de estados de pedido y asignación de repartidor.
- Reportes básicos de ventas y productos más vendidos.
- Pago **simulado** (sin pasarela real).

### Fuera del alcance (por ahora)

- Integración con una pasarela de pago real.
- Integración con empresas de mensajería/transporte externas.
- Aplicación móvil nativa.
- Multi-tienda o modelo SaaS (varias floristerías en la misma plataforma).
- Cotización interactiva de arreglos personalizados con precio dinámico (se registra como
  solicitud que el administrador confirma manualmente).
- Facturación electrónica ante entes de control.

## 5. Actores del sistema

| Actor | Descripción | Necesidad principal |
| ----- | ----------- | -------------------- |
| **Visitante** | Persona que navega la tienda sin haber iniciado sesión. | Ver el catálogo y el detalle de los productos. |
| **Cliente registrado** | Usuario con cuenta creada. | Comprar, indicar destinatario y fecha de entrega, y consultar sus pedidos. |
| **Administrador** | Propietario(a) o encargado(a) del negocio. | Gestionar catálogo, inventario, pedidos, promociones y usuarios. |
| **Empleado (florista)** | Persona que prepara los pedidos y actualiza el inventario. | Registrar entradas, salidas y merma; marcar pedidos como preparados. |
| **Repartidor** | Persona que realiza las entregas. | Consultar los pedidos asignados y actualizar el estado de la entrega. |
| **Sistema de pago (externo, simulado)** | Servicio que confirma el pago. | Confirmar o rechazar la transacción. |

> Nota para el equipo: en un negocio pequeño el administrador y el florista pueden ser la
> misma persona. El sistema debe permitir que un mismo usuario tenga más de un rol asignado.

## 6. Funcionalidades principales

1. Gestión de usuarios, autenticación y roles.
2. Catálogo de productos, categorías y promociones.
3. Búsqueda y filtrado.
4. Carrito de compras.
5. Proceso de compra (checkout): destinatario, entrega, dedicatoria y pago.
6. Gestión de pedidos y asignación de repartidor.
7. Gestión de inventario y merma.
8. Reportes.

## 7. Reglas de negocio generales

- RN-G1: Un pedido siempre debe tener una fecha y franja horaria de entrega válidas
  (no anteriores a la fecha/hora actual, ni fuera de los días y horarios de operación
  del negocio).
- RN-G2: El comprador y el destinatario de un pedido pueden ser personas distintas; el
  pedido guarda los datos de ambos.
- RN-G3: El stock de un producto nunca puede quedar en un valor negativo.
- RN-G4: El stock se descuenta al **confirmar** el pedido, no al agregarlo al carrito.
- RN-G5: Todo producto marcado como merma (deteriorado/vencido) se descuenta del stock
  disponible y queda registrado con fecha y motivo.
- RN-G6: Un usuario puede tener más de un rol (por ejemplo, administrador y empleado a la
  vez).

*(Las reglas de negocio específicas de cada historia se detallan en su propio archivo,
dentro de `historias-de-usuario/`.)*

## 8. Glosario

| Término | Definición |
| ------- | ---------- |
| **Producto** | Flor, ramo o arreglo publicado en la tienda, con precio y existencias. |
| **Categoría / Ocasión** | Agrupación de productos por tipo o por motivo de compra (cumpleaños, condolencias, aniversario, etc.). |
| **Carrito** | Lista temporal de productos que el cliente pretende comprar. |
| **Pedido** | Carrito confirmado por el cliente, con destinatario, fecha/franja de entrega, dedicatoria, estado y datos de pago. |
| **Destinatario** | Persona que recibe el pedido, cuando es distinta de quien compra. |
| **Dedicatoria** | Mensaje de texto opcional/obligatorio que acompaña el arreglo. |
| **Franja de entrega** | Rango horario en el que el pedido debe ser entregado. |
| **Stock** | Cantidad disponible de un producto. |
| **Merma** | Producto perdido por deterioro, vencimiento o daño; se descuenta del inventario. |
| **MVP** | Producto mínimo viable: versión con lo indispensable para funcionar. |
