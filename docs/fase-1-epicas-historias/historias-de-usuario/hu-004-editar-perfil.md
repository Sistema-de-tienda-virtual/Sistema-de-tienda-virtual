# HU-004 — Editar datos de perfil

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-01 — Gestión de usuarios y autenticación |
| **Prioridad** | Media |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente registrado
**quiero** editar mis datos de perfil (nombre, teléfono, dirección habitual)
**para** mantener mi información actualizada y agilizar mis próximas compras.

## Criterios de aceptación

**CA-1 — Edición exitosa**
- **Dado** que estoy en la pantalla de mi perfil
- **Cuando** modifico mi nombre o teléfono con datos válidos y guardo
- **Entonces** el sistema actualiza mis datos y muestra un mensaje de confirmación

**CA-2 — Correo duplicado al cambiarlo**
- **Dado** que intento cambiar mi correo por uno que ya usa otra cuenta
- **Cuando** guardo el cambio
- **Entonces** el sistema no permite el cambio y muestra "Ese correo ya está en uso"

**CA-3 — Campo obligatorio vacío**
- **Dado** que estoy editando mi perfil
- **Cuando** dejo el nombre vacío y guardo
- **Entonces** el sistema no guarda el cambio y señala el campo como obligatorio

## Reglas de negocio asociadas

- RN-33: El correo sigue siendo único por cuenta también al momento de editarlo (ver
  RN-01 en HU-001).

## Notas y dependencias

- Depende de HU-002 (inicio de sesión).
