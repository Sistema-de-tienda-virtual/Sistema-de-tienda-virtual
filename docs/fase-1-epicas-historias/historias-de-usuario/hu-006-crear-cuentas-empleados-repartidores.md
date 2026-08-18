# HU-006 — Crear cuentas de empleados y repartidores

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-01 — Gestión de usuarios y autenticación |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** crear cuentas para empleados y repartidores asignándoles su rol
**para** que el equipo del negocio pueda usar el sistema según sus funciones.

## Criterios de aceptación

**CA-1 — Creación exitosa**
- **Dado** que estoy en el panel de gestión de usuarios
- **Cuando** ingreso nombre, correo y selecciono el rol "Empleado" o "Repartidor", y guardo
- **Entonces** el sistema crea la cuenta con ese rol y envía al correo indicado los datos
  para establecer su contraseña

**CA-2 — Correo ya usado**
- **Dado** que el correo ingresado ya tiene una cuenta (de cualquier rol)
- **Cuando** intento crear la cuenta
- **Entonces** el sistema no la crea y muestra "Ya existe una cuenta con este correo"

**CA-3 — Usuario con más de un rol**
- **Dado** que un usuario ya tiene el rol "Empleado"
- **Cuando** el administrador le asigna también el rol "Repartidor"
- **Entonces** el sistema permite que la cuenta tenga ambos roles activos (ver RN-G6)

**CA-4 — Desactivar una cuenta de empleado o repartidor**
- **Dado** que un empleado ya no trabaja en el negocio
- **Cuando** el administrador desactiva su cuenta
- **Entonces** esa persona no puede iniciar sesión, pero su historial de acciones (pedidos
  preparados, entregas) se conserva

## Reglas de negocio asociadas

- RN-G6: Un usuario puede tener más de un rol (ver `01-definicion-del-proyecto.md`).
- RN-36: Solo el administrador puede crear o desactivar cuentas de empleado y repartidor.

## Notas y dependencias

- Precede a HU-034 (asignar repartidor) y HU-040 (registrar merma).
