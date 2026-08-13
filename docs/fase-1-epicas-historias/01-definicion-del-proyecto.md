# Fase 1 — Definición del proyecto

> Borrador de trabajo. El equipo debe validar y ajustar cada sección en la reunión de la semana 1.

## 1. Problema

Los pequeños y medianos comercios que venden productos físicos dependen de canales
informales (WhatsApp, redes sociales, atención presencial) para gestionar sus ventas.
Esto genera:

- Pedidos perdidos o duplicados por registrarse manualmente.
- Desconocimiento del inventario real al momento de vender.
- Imposibilidad de vender fuera del horario de atención.
- Falta de información consolidada sobre ventas y productos más rotados.

## 2. Objetivo general

Desarrollar un sistema de tienda virtual que permita a un comercio publicar su catálogo
de productos, recibir y gestionar pedidos en línea, y controlar su inventario y sus ventas
desde un panel administrativo centralizado.

## 3. Objetivos específicos

1. Permitir al cliente consultar el catálogo, buscar y filtrar productos.
2. Permitir al cliente armar un carrito de compras y confirmar un pedido.
3. Registrar y autenticar usuarios con distintos niveles de acceso.
4. Permitir al administrador gestionar productos, categorías e inventario.
5. Permitir al administrador consultar y actualizar el estado de los pedidos.
6. Generar reportes básicos de ventas y productos.

## 4. Alcance

### Dentro del alcance (MVP)

- Catálogo de productos con búsqueda y filtros.
- Registro, inicio de sesión y perfil de usuario.
- Carrito de compras y confirmación de pedido.
- Gestión de productos, categorías e inventario.
- Gestión de estados de pedido.
- Reportes básicos de ventas.

### Fuera del alcance (por ahora)

- Integración con pasarela de pago real (se simula el pago).
- Integración con empresas de mensajería/transporte.
- Aplicación móvil nativa.
- Múltiples tiendas o vendedores (marketplace).
- Facturación electrónica ante entes de control.

## 5. Actores / usuarios

| Actor | Descripción | Necesidad principal |
| ----- | ----------- | ------------------- |
| **Visitante** | Persona que navega la tienda sin haber iniciado sesión. | Ver el catálogo y los detalles de los productos. |
| **Cliente registrado** | Usuario con cuenta creada. | Comprar productos y consultar sus pedidos. |
| **Administrador** | Encargado de la tienda. | Gestionar catálogo, inventario y pedidos. |
| **Sistema de pago (externo)** | Servicio que confirma el pago. | Confirmar o rechazar la transacción. |

## 6. Funcionalidades principales

1. Gestión de usuarios y autenticación.
2. Catálogo de productos y categorías.
3. Búsqueda y filtrado.
4. Carrito de compras.
5. Proceso de compra (checkout).
6. Gestión de pedidos.
7. Gestión de inventario.
8. Reportes.

## 7. Glosario

| Término | Definición |
| ------- | ---------- |
| **Producto** | Artículo publicado en la tienda, con precio y existencias. |
| **Categoría** | Agrupación de productos con características similares. |
| **Carrito** | Lista temporal de productos que el cliente pretende comprar. |
| **Pedido** | Carrito confirmado por el cliente, con estado y datos de entrega. |
| **Stock** | Cantidad disponible de un producto. |
| **MVP** | Producto mínimo viable: versión con lo indispensable para funcionar. |
