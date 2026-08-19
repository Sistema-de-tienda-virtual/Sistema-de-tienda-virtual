# HU-005 — Recuperar contraseña

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-01 — Gestión de usuarios y autenticación |
| **Prioridad** | Media |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente registrado
**quiero** recuperar mi contraseña si la olvido
**para** poder volver a entrar a mi cuenta sin depender de que un administrador me
ayude.

## Criterios de aceptación

**CA-1 — Solicitud de recuperación**
- **Dado** que olvidé mi contraseña
- **Cuando** ingreso mi correo en "¿Olvidaste tu contraseña?" y lo envío
- **Entonces** el sistema envía un enlace de recuperación válido por tiempo limitado a ese
  correo, si existe una cuenta asociada

**CA-2 — Correo no registrado**
- **Dado** que ingreso un correo que no tiene cuenta
- **Cuando** solicito la recuperación
- **Entonces** el sistema muestra el mismo mensaje genérico de confirmación de envío, sin
  revelar si el correo existe (ver RN-30 en HU-002)

**CA-3 — Enlace vencido**
- **Dado** que recibí un enlace de recuperación
- **Cuando** intento usarlo después de que expiró
- **Entonces** el sistema muestra "El enlace expiró" y me ofrece solicitar uno nuevo

**CA-4 — Nueva contraseña válida**
- **Dado** que estoy en el formulario de nueva contraseña desde un enlace vigente
- **Cuando** ingreso una contraseña que cumple las reglas (RN-02 en HU-001) y la confirmo
- **Entonces** el sistema actualiza la contraseña y me permite iniciar sesión con la nueva

## Reglas de negocio asociadas

- RN-34: El enlace de recuperación expira a las 30 minutos de haberse generado.
- RN-35: Un enlace de recuperación solo puede usarse una vez.

## Notas y dependencias

- Depende de HU-001 (registro) y HU-002 (inicio de sesión).
- Definir en fase 2 el proveedor de envío de correos.
