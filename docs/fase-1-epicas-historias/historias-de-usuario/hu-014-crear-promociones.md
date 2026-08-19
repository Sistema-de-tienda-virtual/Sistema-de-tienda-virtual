# HU-014 — Crear promociones por temporada

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Baja |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** crear promociones con descuento para fechas de temporada (San Valentín, Día de
la Madre, Amor y Amistad)
**para** aumentar las ventas en esas fechas clave.

## Criterios de aceptación

**CA-1 — Creación de promoción**
- **Dado** que estoy en el panel de promociones
- **Cuando** selecciono uno o varios productos, defino un porcentaje de descuento y un
  rango de fechas de vigencia, y guardo
- **Entonces** el descuento se aplica automáticamente al precio de esos productos durante
  ese rango de fechas

**CA-2 — Descuento fuera de rango**
- **Dado** que la fecha actual está fuera del rango de vigencia de una promoción
- **Cuando** un cliente ve el producto
- **Entonces** el sistema muestra el precio normal, sin el descuento

**CA-3 — Porcentaje inválido**
- **Dado** que estoy creando una promoción
- **Cuando** ingreso un descuento mayor a 100% o menor o igual a 0%
- **Entonces** el sistema no permite guardar la promoción

## Reglas de negocio asociadas

- RN-42: Un producto solo puede tener una promoción activa a la vez.

## Notas y dependencias

- Depende de HU-009 (crear producto).
