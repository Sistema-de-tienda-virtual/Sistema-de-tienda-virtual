# Fase 4 — Base de datos

**Entregable:** Modelo ER/UML + script SQL.

## Contenido

- `modelos/` — modelo conceptual, modelo lógico y modelo físico (imagen + fuente editable)
- `scripts/01-crear-tablas.sql` — DDL con claves primarias, foráneas y restricciones
- `scripts/02-datos-prueba.sql` — `INSERT` de datos de prueba
- `scripts/03-consultas.sql` — consultas de verificación
- `scripts/diccionario-de-datos.md` — descripción de cada tabla, campo, tipo y restricción

## Entregado

- [Modelo conceptual (MER)](modelos/modelo_conceptual_mer/modelo_conceptual.png)
- [Modelo integrado](modelos/modelo-integrado.md) — entidades, atributos, claves, relaciones y diccionario de datos consolidado
- [Modelo físico](modelos/modelo-fisico.md) — motor, tipos, acciones referenciales e índices
- [Aporte de Juan al catálogo](modelos/aporte-juan-catalogo-fase-4.md) — documentación Markdown alineada con el SQL
- [Modelo conceptual y lógico de Iván y Juan](modelos/modelo-conceptual-y-logico-fase-4-ivan-juan.md) — usuarios, seguridad y direcciones de entrega
- Catálogo: [diagrama editable](modelos/modelo-logico-catalogo-juan.drawio) e [imagen PNG](modelos/modelo-logico-catalogo-juan.png)
- Usuarios y entregas: [diagrama editable](modelos/modelo-logico-usuarios-ivan-juan.drawio) e [imagen PNG](modelos/modelo-logico-usuarios-ivan-juan.png)
- [Script de creación de tablas](scripts/01-crear-tablas.sql)

![Modelo conceptual](modelos/modelo_conceptual_mer/modelo_conceptual.png)

## Criterios

- El modelo debe quedar normalizado **hasta 3FN**.
- Toda tabla tiene clave primaria definida.
- Toda relación tiene su clave foránea con la acción `ON DELETE` / `ON UPDATE` declarada.
- Los scripts deben ejecutarse en orden y sin errores desde cero.
