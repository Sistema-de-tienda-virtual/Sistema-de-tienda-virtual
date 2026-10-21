# Fase 4 — Base de datos

**Entregable:** Modelo ER/UML + script SQL.

## Contenido

- `modelos/` — modelo conceptual, modelo lógico y modelo físico (imagen + fuente editable)
- `scripts/01-crear-tablas.sql` — DDL con claves primarias, foráneas y restricciones
- `scripts/02-datos-prueba.sql` — `INSERT` de datos de prueba
- `scripts/03-consultas.sql` — consultas de verificación
- `scripts/diccionario-de-datos.md` — descripción de cada tabla, campo, tipo y restricción

## Entregado

- [Modelo conceptual (MER)](modelos/modelo_conceptual_mer/modelo_conceptual.png) — Diagrama ER de entidades y relaciones
- [Modelo integrado](modelos/modelo-integrado.md) — entidades, atributos, claves, relaciones y diccionario de datos consolidado
- [Modelo físico](modelos/modelo-fisico.md) — motor, tipos, acciones referenciales e índices

- [Aporte de Juan al catálogo](modelos/aporte-juan-catalogo-fase-4.md) — documentación Markdown alineada con el SQL
- [Modelo conceptual y lógico de Iván y Juan](modelos/modelo-conceptual-y-logico-fase-4-ivan-juan.md) — usuarios, seguridad y direcciones de entrega
- Catálogo: [diagrama editable](modelos/modelo-logico-catalogo-juan.drawio) e [imagen PNG](modelos/modelo-logico-catalogo-juan.png)
- Usuarios y entregas: [diagrama editable](modelos/modelo-logico-usuarios-ivan-juan.drawio) e [imagen PNG](modelos/modelo-logico-usuarios-ivan-juan.png)
- [Script de creación de tablas](scripts/01-crear-tablas.sql) — DDL con 20 tablas en singular, normalizadas hasta 3FN
- [Datos de prueba](scripts/02-datos-prueba.sql) — inserciones de ejemplo
- [Consultas de verificación](scripts/03-consultas.sql) — comprobación de tablas, relaciones y totales
- [Diccionario de datos](scripts/diccionario-de-datos.md) — documentación de tablas y columnas

![Modelo conceptual](modelos/modelo_conceptual_mer/modelo_conceptual.png)

## Criterios

- El modelo debe quedar normalizado **hasta 3FN**. ✅
- Toda tabla tiene clave primaria definida. ✅
- Toda relación tiene su clave foránea con la acción `ON DELETE` / `ON UPDATE` declarada. ✅
- Los scripts deben ejecutarse en orden y sin errores desde cero. ✅

## Modernización (Oct 2026)

- **Tablas en singular** (`usuario`, `producto`, `categoria`, etc.), según los scripts SQL del proyecto.
- **Integridad referencial completa** — Soft delete vs hard delete bien diferenciado
- **Índices optimizados** — Por búsquedas frecuentes (RF-015, RF-029, RF-032, etc.)
- **Documentación técnica** — Diccionario de datos con 838 líneas de detalles
