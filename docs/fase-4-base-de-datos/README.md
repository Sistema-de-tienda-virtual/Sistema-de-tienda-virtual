# Fase 4 — Base de datos

**Entregable:** Modelo ER/UML + script SQL.

## Contenido

- `modelos/` — modelo conceptual, modelo lógico y modelo físico (imagen + fuente editable)
- `scripts/01-crear-tablas.sql` — DDL con claves primarias, foráneas y restricciones
- `scripts/02-datos-prueba.sql` — `INSERT` de datos de prueba
- `scripts/03-consultas.sql` — consultas de verificación
- `diccionario-de-datos.md` — descripción de cada tabla, campo, tipo y restricción

## Entregado

- [Modelo conceptual (MER)](modelos/modelo_conceptual_mer/modelo_conceptual.png) — Diagrama ER de entidades y relaciones
- [Modelo integrado](modelos/modelo-integrado.md) — entidades, atributos, claves, relaciones y diccionario de datos consolidado
- [Modelo físico](modelos/modelo-fisico.md) — motor, tipos, acciones referenciales e índices
- [Modelo lógico gráfico](modelos/modelo-logico-catalogo-juan.drawio) — Diagrama editable Draw.io (aporte de Juan)
- [Script de creación de tablas](scripts/01-crear-tablas.sql) — DDL con 20 tablas en plural, normalizadas hasta 3FN
- [Datos de prueba](scripts/02-datos-prueba.sql) — Inserciones de ejemplo para testing
- [Consultas analíticas](scripts/03-consultas.sql) — Verificación y reportes
- [Diccionario de datos](scripts/diccionario-de-datos.md) — Documentación de todas las tablas y columnas

![Modelo conceptual](modelos/modelo_conceptual_mer/modelo_conceptual.png)

## Criterios

- El modelo debe quedar normalizado **hasta 3FN**. ✅
- Toda tabla tiene clave primaria definida. ✅
- Toda relación tiene su clave foránea con la acción `ON DELETE` / `ON UPDATE` declarada. ✅
- Los scripts deben ejecutarse en orden y sin errores desde cero. ✅

## Modernización (Oct 2026)

- **Tablas en plural** (usuarios, productos, categorias, etc.) — Alineación con estándares REST y ORMs modernos (Prisma, TypeORM)
- **Integridad referencial completa** — Soft delete vs hard delete bien diferenciado
- **Índices optimizados** — Por búsquedas frecuentes (RF-015, RF-029, RF-032, etc.)
- **Documentación técnica** — Diccionario de datos con 838 líneas de detalles
