# Sistema de Tienda Virtual

Trabajo integrador — desarrollo de un sistema de tienda virtual (e-commerce) a la medida
para una floristería, aplicando el ciclo completo de análisis, diseño e implementación.

## Equipo

| Integrante | Rol principal | Usuario GitHub |
| ---------- | ------------- | -------------- |
| _(nombre)_ | _(rol)_       | _(@usuario)_   |
| _(nombre)_ | _(rol)_       | _(@usuario)_   |
| _(nombre)_ | _(rol)_       | _(@usuario)_   |
| _(nombre)_ | _(rol)_       | _(@usuario)_   |

## Fases del proyecto

| Fase | Etapa | Entregable | Estado |
| ---- | ----- | ---------- | ------ |
| 1 | Épica y Historias de usuario | Épicas + Historias de usuario | 🟡 En curso |
| 2 | Requerimientos | Documento de requerimientos | ⚪ Pendiente |
| 3 | Diagramas UML | Diagramas UML | ⚪ Pendiente |
| 4 | Base de datos | Modelo ER/UML + Script SQL | ⚪ Pendiente |
| 5 | Mockup / Prototipo | Prototipo navegable | ⚪ Pendiente |
| 6 | Programa funcional | MVP funcional | ⚪ Pendiente |

Leyenda: ⚪ Pendiente · 🟡 En curso · 🟢 Terminado

## Estructura del repositorio

```
docs/
  fase-1-epicas-historias/    Problema, objetivo, actores, épicas, historias
  fase-2-requerimientos/      RF, RNF, reglas de negocio, trazabilidad
  fase-3-uml/                 Casos de uso, clases, secuencia, actividades
  fase-4-base-de-datos/       Modelo ER, lógico, físico y scripts SQL
  fase-5-mockups/             Wireframes y prototipo navegable
  fase-6-desarrollo/          Stack, arquitectura y plan de pruebas
  actas-reuniones/            Bitácora de las reuniones del equipo
  plantillas/                 Plantillas reutilizables
src/                          Código fuente (a partir de la fase 6)
```

## Cómo trabajar en el repositorio

1. Actualizar la rama principal: `git pull origin main`
2. Crear una rama por tarea: `git checkout -b fase-1/historias-carrito`
3. Hacer commits pequeños y descriptivos (ver [CONTRIBUTING.md](CONTRIBUTING.md))
4. Subir la rama: `git push -u origin fase-1/historias-carrito`
5. Abrir un Pull Request y pedir revisión a un compañero
6. Al aprobarse, hacer merge a `main`

> Regla del equipo: **no se hace push directo a `main`**, todo entra por Pull Request.
