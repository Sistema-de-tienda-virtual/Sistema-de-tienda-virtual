# Guía de trabajo del equipo

## Ramas

- `main` — versión estable y revisada. Protegida: solo se actualiza por Pull Request.
- `fase-N/descripcion-corta` — una rama por tarea.

Ejemplos: `fase-1/epica-catalogo`, `fase-2/requerimientos-no-funcionales`, `fase-4/script-sql`.

## Commits

Formato: `tipo(alcance): descripción en presente`

Tipos usados en el proyecto:

| Tipo    | Se usa para                                  |
| ------- | -------------------------------------------- |
| `docs`  | Documentación de las fases 1 a 5              |
| `feat`  | Nueva funcionalidad de código (fase 6)        |
| `fix`   | Corrección de un error                        |
| `chore` | Configuración, estructura, tareas de apoyo    |

Ejemplos:

```
docs(fase-1): agrega historias de usuario del carrito de compras
docs(fase-4): agrega script de creación de tablas
feat(catalogo): implementa búsqueda de productos por categoría
```

## Pull Requests

- Título claro que indique fase y contenido.
- Descripción con qué se hizo y qué falta.
- Al menos **1 revisión aprobada** de un compañero antes del merge.
- No mezclar trabajo de fases distintas en un mismo PR.

## Nomenclatura de archivos

- Todo en minúsculas, con guiones: `historia-hu-012-agregar-al-carrito.md`
- Sin espacios, sin tildes, sin caracteres especiales.
- Los diagramas se exportan a `.png` y se conserva también el archivo fuente editable.

## Reuniones

Cada reunión del equipo se registra en `docs/actas-reuniones/` usando
`docs/plantillas/plantilla-acta-reunion.md`, con nombre `acta-AAAA-MM-DD.md`.
