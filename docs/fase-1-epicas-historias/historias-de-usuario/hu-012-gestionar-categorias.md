# HU-012 — Gestionar categorías y ocasiones

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Media |
| **Estimación** | 3 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** crear, editar y desactivar categorías y ocasiones (cumpleaños, condolencias,
aniversario, etc.)
**para** organizar el catálogo y que el cliente encuentre productos según el motivo de su
compra.

## Criterios de aceptación

**CA-1 — Crear categoría**
- **Dado** que estoy en el panel de categorías
- **Cuando** ingreso un nombre único y guardo
- **Entonces** la categoría queda disponible para asignar a productos y para filtrar el
  catálogo (HU-016)

**CA-2 — Nombre duplicado**
- **Dado** que ya existe una categoría con el nombre que ingreso
- **Cuando** intento crearla
- **Entonces** el sistema no la crea y muestra "Ya existe una categoría con este nombre"

**CA-3 — Desactivar categoría en uso**
- **Dado** que una categoría tiene productos activos asociados
- **Cuando** el administrador intenta desactivarla
- **Entonces** el sistema advierte cuántos productos la usan antes de confirmar la
  desactivación

## Reglas de negocio asociadas

- RN-40: El nombre de una categoría es único.

## Notas y dependencias

- Relacionada con HU-009 (crear producto) y HU-016 (filtrar por categoría).
