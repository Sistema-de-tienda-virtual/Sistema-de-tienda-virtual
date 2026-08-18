# Fase 1 — Asignación de trabajo del equipo (semana 1)

Somos 4 integrantes. Las 43 historias del backlog ya tienen un borrador de detalle en
`historias-de-usuario/` (con datos genéricos, ver nota abajo). Cada integrante toma 2
épicas y es responsable de **revisar, ajustar y validar** las historias de esas épicas,
no de escribirlas desde cero.

| Integrante | Épicas asignadas | Historias a revisar | Rama de trabajo |
| ---------- | ---------------- | -------------------- | ---------------- |
| _(nombre 1)_ | EP-01, EP-02 | HU-001 a HU-014 | `fase-1/ep-01-ep-02` |
| _(nombre 2)_ | EP-03, EP-04 | HU-015 a HU-022 | `fase-1/ep-03-ep-04` |
| _(nombre 3)_ | EP-05, EP-06 | HU-023 a HU-036 | `fase-1/ep-05-ep-06` |
| _(nombre 4)_ | EP-07, EP-08 | HU-037 a HU-043 | `fase-1/ep-07-ep-08` |

> **Nota sobre los datos genéricos:** todo el documento (problema, actores, historias,
> reglas de negocio) usa el placeholder `[Floristería Aroma de Rosas]` y supuestos
> razonables (horarios, franjas de entrega, política de merma, etc.) porque el proyecto
> aún no trabaja con una floristería real. El objetivo es entregarlo más adelante a un
> negocio real en **Neiva**, así que al validar cada historia el equipo debe marcar con
> una nota los supuestos que habrá que confirmar con el negocio real (por ejemplo:
> zona de cobertura, días de operación, franjas de entrega concretas).

## Definición de "terminado" para la fase 1

Una historia se considera terminada cuando:

- [x] Tiene su archivo propio en `historias-de-usuario/` con la nomenclatura acordada
      *(hecho para las 43 historias, como borrador)*.
- [x] El formato "Como… quiero… para…" está completo y es específico.
- [x] Tiene **al menos 3 criterios de aceptación** en formato Dado/Cuando/Entonces,
      incluyendo al menos un escenario de error o alterno.
- [x] Están listadas las reglas de negocio que la afectan.
- [ ] Tiene responsable y estado confirmados (hoy: `_(asignar)_` / `Pendiente` para todas).
- [ ] Fue revisada y ajustada por el integrante responsable de su épica.
- [ ] Fue aprobada por otro integrante en un Pull Request.

## Cronograma de la semana 1

| Día | Actividad | Responsable |
| --- | --------- | ----------- |
| 1 | Reunión inicial: validar problema, objetivo, actores, alcance y supuestos genéricos | Todos |
| 2 | Revisar y ajustar el backlog y las épicas según lo acordado | Todos |
| 3-4 | Revisar y validar las historias de las épicas asignadas, asignarse responsable y estado | Cada uno |
| 5 | Revisión cruzada de Pull Requests | Todos |
| 5 | Priorización final y cierre del alcance del MVP | Todos |

## Pendientes por definir en la reunión

- [ ] Nombre real de la floristería y datos de contacto (reemplazar el placeholder en
      `01-definicion-del-proyecto.md`) cuando se trabaje con el negocio real en Neiva.
- [ ] Días y horarios de operación, y franjas horarias de entrega disponibles.
- [ ] ¿El carrito funciona para visitantes sin cuenta?
- [ ] ¿El registro requiere verificación por correo?
- [ ] Estados exactos del ciclo de vida de un pedido (ej.: Pendiente, Confirmado,
      En preparación, En camino, Entregado, Cancelado).
- [ ] Vida útil por tipo de producto, para el registro de merma.
- [ ] Confirmar que el pago se simula y no se integra una pasarela real.
- [ ] ¿El repartidor es personal propio del negocio o un servicio externo?
- [ ] Zona de cobertura de entregas y cupos máximos por franja horaria.
