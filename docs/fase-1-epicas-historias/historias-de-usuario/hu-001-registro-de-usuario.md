# HU-001 — Registro de usuario

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-01 — Gestión de usuarios y autenticación |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** visitante de la tienda de flores
**quiero** registrarme con mi correo y una contraseña
**para** tener una cuenta que me permita comprar arreglos y consultar mis pedidos.

## Criterios de aceptación

**CA-1 — Registro exitoso**
- **Dado** que estoy en el formulario de registro y no tengo cuenta
- **Cuando** ingreso nombre, correo válido y una contraseña que cumple las reglas, y confirmo
- **Entonces** el sistema crea mi cuenta con rol `Cliente`, me muestra un mensaje de confirmación y me lleva a la pantalla de inicio de sesión

**CA-2 — Correo ya registrado**
- **Dado** que ya existe una cuenta con el correo que ingresé
- **Cuando** intento registrarme
- **Entonces** el sistema no crea la cuenta y muestra el mensaje "Ya existe una cuenta con este correo"

**CA-3 — Datos inválidos**
- **Dado** que estoy en el formulario de registro
- **Cuando** dejo un campo obligatorio vacío o el correo tiene un formato incorrecto
- **Entonces** el sistema señala el campo con error y no envía el formulario

**CA-4 — Contraseña débil**
- **Dado** que estoy diligenciando el formulario
- **Cuando** ingreso una contraseña de menos de 8 caracteres o sin al menos una letra y un número
- **Entonces** el sistema muestra las reglas de la contraseña y no permite continuar

## Reglas de negocio asociadas

- RN-01: El correo electrónico es único por cuenta.
- RN-02: La contraseña debe tener mínimo 8 caracteres, con al menos una letra y un número.
- RN-03: Toda cuenta creada desde el formulario público recibe el rol `Cliente`.
- RN-04: Las contraseñas se almacenan cifradas, nunca en texto plano.

## Notas y dependencias

- Base para HU-002 (inicio de sesión).
- Definir en fase 2 si el registro requiere verificación por correo.
