# HU-002 — Iniciar sesión

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-01 — Gestión de usuarios y autenticación |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 2 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** cliente registrado
**quiero** iniciar sesión con mi correo y contraseña
**para** acceder a mi cuenta y a mis pedidos.

## Criterios de aceptación

**CA-1 — Inicio de sesión exitoso**
- **Dado** que tengo una cuenta activa
- **Cuando** ingreso mi correo y contraseña correctos y presiono "Iniciar sesión"
- **Entonces** el sistema me autentica y me redirige a mi panel según mi rol

**CA-2 — Credenciales incorrectas**
- **Dado** que estoy en el formulario de inicio de sesión
- **Cuando** ingreso una contraseña incorrecta
- **Entonces** el sistema muestra "Correo o contraseña incorrectos" y no inicia sesión

**CA-3 — Cuenta inexistente**
- **Dado** que estoy en el formulario de inicio de sesión
- **Cuando** ingreso un correo que no está registrado
- **Entonces** el sistema muestra el mismo mensaje genérico "Correo o contraseña
  incorrectos", sin indicar si el correo existe o no

**CA-4 — Bloqueo por intentos fallidos**
- **Dado** que he fallado 5 intentos consecutivos de inicio de sesión
- **Cuando** intento iniciar sesión de nuevo
- **Entonces** el sistema bloquea temporalmente los intentos para ese correo y me lo
  informa

## Reglas de negocio asociadas

- RN-30: El mensaje de error de credenciales inválidas nunca revela si el correo existe o
  no, por seguridad.
- RN-31: Tras 5 intentos fallidos consecutivos, la cuenta se bloquea temporalmente.

## Notas y dependencias

- Depende de HU-001 (registro).
- Relacionada con HU-005 (recuperar contraseña).
