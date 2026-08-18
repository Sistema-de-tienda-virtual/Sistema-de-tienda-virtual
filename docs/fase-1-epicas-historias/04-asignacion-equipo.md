# Fase 1 — Asignación de trabajo del equipo (semana 1)

Somos 4 integrantes. Cada uno toma 2 épicas y desarrolla el detalle de sus historias
en `historias-de-usuario/`, usando `docs/plantillas/plantilla-historia-usuario.md`.

| Integrante | Épicas asignadas | Historias a detallar | Rama de trabajo |
| ---------- | ---------------- | --------------------- | ---------------- |
| _(nombre 1)_ | EP-01, EP-02 | HU-001 a HU-014 | `fase-1/ep-01-ep-02` |
| _(nombre 2)_ | EP-03, EP-04 | HU-015 a HU-022 | `fase-1/ep-03-ep-04` |
| _(nombre 3)_ | EP-05, EP-06 | HU-023 a HU-036 | `fase-1/ep-05-ep-06` |
| _(nombre 4)_ | EP-07, EP-08 | HU-037 a HU-043 | `fase-1/ep-07-ep-08` |

> HU-001, HU-009, HU-019, HU-023, HU-024, HU-033, HU-034, HU-036 y HU-040 ya están
> detalladas y sirven como ejemplo del nivel esperado (una por cada épica).

## Definición de "terminado" para la fase 1

Una historia se considera terminada cuando:

- [ ] Tiene su archivo propio en `historias-de-usuario/` con la nomenclatura acordada.
- [ ] El formato "Como… quiero… para…" está completo y es específico.
- [ ] Tiene **al menos 3 criterios de aceptación** en formato Dado/Cuando/Entonces,
      incluyendo al menos un escenario de error o alterno.
- [ ] Están listadas las reglas de negocio que la afectan.
- [ ] Tiene prioridad, estimación y responsable asignados en el backlog.
- [ ] Fue revisada y aprobada por otro integrante en un Pull Request.

## Cronograma de la semana 1

| Día | Actividad | Responsable |
| --- | --------- | ----------- |
| 1 | Reunión inicial: validar problema, objetivo, actores y alcance | Todos |
| 2 | Ajustar épicas y backlog según lo acordado | Todos |
| 3-4 | Detallar las historias asignadas | Cada uno |
| 5 | Revisión cruzada de Pull Requests | Todos |
| 5 | Priorización final y cierre del alcance del MVP | Todos |

## Pendientes por definir en la reunión

- [ ] Nombre real de la floristería y datos de contacto (reemplazar el placeholder en
      `01-definicion-del-proyecto.md`).
- [ ] Días y horarios de operación, y franjas horarias de entrega disponibles.
- [ ] ¿El carrito funciona para visitantes sin cuenta?
- [ ] ¿El registro requiere verificación por correo?
- [ ] Estados exactos del ciclo de vida de un pedido (ej.: Pendiente, Confirmado,
      En preparación, En camino, Entregado, Cancelado).
- [ ] Vida útil por tipo de producto, para el registro de merma.
- [ ] Confirmar que el pago se simula y no se integra una pasarela real.
- [ ] ¿El repartidor es personal propio del negocio o un servicio externo?
