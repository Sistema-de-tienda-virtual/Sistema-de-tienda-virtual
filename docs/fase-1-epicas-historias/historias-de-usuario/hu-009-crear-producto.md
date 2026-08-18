# HU-009 — Crear producto (flor o arreglo)

| Campo | Valor |
| ----- | ----- |
| **Épica** | EP-02 — Catálogo de productos |
| **Prioridad** | Alta (MVP) |
| **Estimación** | 5 puntos |
| **Responsable** | _(asignar)_ |
| **Estado** | Pendiente |

## Historia

**Como** administrador
**quiero** crear un producto indicando nombre, precio, stock inicial y vida útil estimada
**para** publicarlo en la tienda y controlar su rotación antes de que se deteriore.

## Criterios de aceptación

**CA-1 — Creación exitosa**
- **Dado** que estoy en el formulario de nuevo producto
- **Cuando** ingreso nombre, descripción, precio, stock inicial, categoría y vida útil
  estimada en días, y guardo
- **Entonces** el producto se publica en el catálogo con estado "Disponible" y con la fecha
  de ingreso registrada automáticamente

**CA-2 — Datos obligatorios incompletos**
- **Dado** que estoy en el formulario de nuevo producto
- **Cuando** dejo el nombre, el precio o el stock inicial vacíos y guardo
- **Entonces** el sistema señala los campos faltantes y no crea el producto

**CA-3 — Precio o stock inválido**
- **Dado** que estoy diligenciando el formulario
- **Cuando** ingreso un precio menor o igual a cero, o un stock negativo
- **Entonces** el sistema muestra el error correspondiente y no permite guardar

**CA-4 — Vida útil no informada**
- **Dado** que estoy creando un producto perecedero (por ejemplo, rosas frescas)
- **Cuando** no indico la vida útil estimada
- **Entonces** el sistema advierte que el producto no generará alertas de vencimiento hasta
  que se complete ese dato, pero permite guardarlo

## Reglas de negocio asociadas

- RN-14: Todo producto queda asociado a una fecha de ingreso al inventario.
- RN-15: El precio debe ser mayor a cero.
- RN-16: El stock inicial no puede ser negativo.
- RN-17: La vida útil estimada (en días) es la base para calcular alertas de vencimiento y
  para el registro de merma (HU-040).

## Notas y dependencias

- Relacionada con HU-010 (editar producto), HU-011 (desactivar producto) y HU-040
  (registro de merma).
- Definir en fase 2 si el producto admite múltiples imágenes.
