# HU-003 — Cerrar sesión

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-01 — Gestión de usuarios y autenticación |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 1 punto |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente registrado
**quiero** cerrar sesión
**para** proteger mi cuenta cuando uso un dispositivo compartido.

## Criterios de aceptación

**CA-1 — Cierre de sesión exitoso**
- **Dado** que tengo una sesión activa
- **Cuando** presiono "Cerrar sesión"
- **Entonces** el sistema termina mi sesión y me redirige a la página de inicio como
  visitante

**CA-2 — Acceso a páginas protegidas tras cerrar sesión**
- **Dado** que cerré sesión
- **Cuando** intento volver a una página que requiere autenticación (ej. mis pedidos)
  usando el botón "atrás" del navegador
- **Entonces** el sistema me redirige al inicio de sesión y no muestra información de mi
  cuenta

**CA-3 — Cierre de sesión en varias pestañas**
- **Dado** que tengo la misma cuenta abierta en dos pestañas
- **Cuando** cierro sesión en una de ellas
- **Entonces** la otra pestaña deja de tener acceso a las acciones que requieren sesión en
  la siguiente interacción

## Reglas de negocio asociadas

- RN-32: Cerrar sesión invalida el token/sesión activa en el servidor, no solo en el
  navegador.

## Notas y dependencias

- Depende de HU-002 (inicio de sesión).
