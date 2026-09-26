FASE 1 ÉPICAS E HISTORIAS DE USUARIO

sistema de tienda virtual a la medida para una floristería

Aprendices:

Román Alberto Bolaños Cerquera

Ivan Andres Cortes Olaya

### Juan Felipe Cortes Quintero

### Jorge Steven Gutierre Fierro

Instructor:

Ing. Carlos Julio cadena

Programa: Análisis y Desarrollo de Software

Ficha: 3239137

Servicio Nacional de Aprendizaje -- SENA

Centro de la Industria, la Empresa y los Servicios -- CIES

Neiva -- Huila

2026

# 1. Definición del proyecto

Floristería Aroma de Rosas.

1.  Problema

Floristería Aroma de Rosas es un negocio local físico que vende flores,
ramos y arreglos, y que hoy gestiona la mayoría de su operación de forma
manual e informal: pedidos por WhatsApp y llamadas, cuadernos o Excel
para el inventario, y cobro únicamente en efectivo o transferencia
manual.

Cómo se identificó el problema: entrevista con la propietaria y
observación del proceso de un pedido de principio a fin, durante la
semana 1 del proyecto.

Consecuencias observadas:

Pedidos perdidos o confundidos: los pedidos llegan mezclados con
mensajes personales por WhatsApp; no hay un registro único ni un número
de pedido.

Desconocimiento del inventario real: no se sabe con certeza cuántas
flores de cada tipo hay disponibles al momento de vender, ni cuánto
stock se pierde por deterioro.

Errores en la fecha y hora de entrega: al no existir una agenda formal,
se han aceptado más pedidos de los que se pueden entregar en fechas de
alta demanda (San Valentín, Día de la Madre, Amor y Amistad).

Falta de trazabilidad del pedido: comprador y destinatario no siempre
son la misma persona (se compra para regalar), y hoy no queda un
registro formal de a quién y dónde se debe entregar, ni del mensaje de
dedicatoria.

Nula presencia digital fuera del horario de atención: El cliente solo
puede pedir si encuentra a alguien disponible por WhatsApp o en el
local.

Sin información consolidada: el negocio no tiene cómo saber qué
productos rotan más, cuánto se vendió en un periodo, ni cuánta mercancía
se pierde por vencimiento (merma).

Por qué un software a la medida y no una plataforma genérica de
e-commerce: el producto que se vende es perecedero (vida útil corta) y
la mayoría de los pedidos se hacen para una fecha y franja horaria
específica, con un destinatario distinto de quien compra y un mensaje de
dedicatoria.

Estas reglas de negocio no las resuelve de forma nativa un e-commerce
genérico (tipo tienda de ropa o tecnología), y justifican un desarrollo
propio.

# 2. Objetivo general

Desarrollar un sistema de tienda virtual a la medida para Floristería
Aroma de Rosas que permita publicar su catálogo de flores y arreglos,
recibir y gestionar pedidos en línea incluyendo fecha, franja de entrega
y datos del destinatario, controlar su inventario perecedero y dar
seguimiento a las entregas, desde un panel administrativo centralizado.

# 3. Objetivos específicos

Permitir al cliente consultar el catálogo, buscar y filtrar productos
por categoría,ocasión y precio.

Permitir al cliente armar un carrito de compras y confirmar un pedido
indicando destinatario, dirección, fecha, franja horaria y mensaje de
dedicatoria.

Registrar y autenticar usuarios con distintos niveles de acceso
(cliente, administrador, empleado, repartidor).

Permitir al administrador gestionar productos, categorías, promociones e
inventario, incluyendo el registro de merma por deterioro.

Permitir al administrador y al repartidor consultar y actualizar el
estado de los pedidos, desde la confirmación hasta la entrega.

Generar reportes básicos de ventas, productos más vendidos y estado de
los pedidos.

# 4. Alcance

Dentro del alcance (MVP)

Catálogo de productos con búsqueda y filtros (nombre, categoría,ocasión,
precio).

Registro, inicio de sesión y perfil de usuario (cliente, administrador,
empleado,repartidor).

Carrito de compras.

Checkout con destinatario, dirección, fecha y franja de entrega, y
mensaje de dedicatoria.

Gestión de productos, categorías e inventario (incluye registro de
merma).

Gestión de estados de pedido y asignación de repartidor.

Reportes básicos de ventas y productos más vendidos.

Pago simulado (sin pasarela real).

# 5. Actores del sistema

  -----------------------------------------------------------------------
  Actor                   Descripción             Necesidad principal
  ----------------------- ----------------------- -----------------------
  Visitante               Persona que navega la   Ver el catálogo y el
                          tienda sin haber        detalle de los
                          iniciado sesión.        productos.

  Cliente registrado      Usuario con cuenta      Comprar, indicar
                          creada.                 destinatario y fecha de
                                                  entrega, y consultar
                                                  sus pedidos.

  Administrador           Propietario(a) o        Gestionar catálogo,
                          encargado(a) del        inventario, pedidos,
                          negocio.                promociones y usuarios.

  Empleado (florista)     Persona que prepara los Registrar entradas,
                          pedidos y actualiza el  salidas y merma; marcar
                          inventario.             pedidos como
                                                  preparados.

  Repartidor              Persona que realiza las Consultar los pedidos
                          entregas.               asignados y actualizar
                                                  el estado de la
                                                  entrega.

  Sistema de pago         Servicio que confirma   Confirmar o rechazar la
  (externo, simulado)     el pago.                transacción.
  -----------------------------------------------------------------------

# 6. Reglas de negocio generales

RN-G1: Un pedido siempre debe tener una fecha y franja horaria de
entrega válidas (No anteriores a la fecha,hora actual, ni fuera de los
días y horarios de operación del negocio).

RN-G2: El comprador y el destinatario de un pedido pueden ser personas
distintas; el pedido guarda los datos de ambos.

RN-G3: El stock de un producto nunca puede quedar en un valor negativo.

RN-G4: El stock se descuenta al confirmar el pedido, no al agregarlo al
carrito.

RN-G5: Todo producto marcado como merma (deteriorado/vencido) se
descuenta del stock disponible y queda registrado con fecha y motivo.

RN-G6: Un usuario puede tener más de un rol (Por ejemplo, administrador
y empleado a la vez).

# 7. Glosario

  -----------------------------------------------------------------------
  Término                             Definición
  ----------------------------------- -----------------------------------
  Producto                            Flor, ramo o arreglo publicado en
                                      la tienda, con precio y
                                      existencias.

  Categoría / Ocasión                 Agrupación de productos por tipo o
                                      por motivo de compra (cumpleaños,
                                      condolencias, aniversario, etc.).

  Carrito                             Lista temporal de productos que el
                                      cliente pretende comprar.

  Pedido                              Carrito confirmado por el cliente,
                                      con destinatario, fecha/franja de
                                      entrega, dedicatoria, estado y
                                      datos de pago.

  Destinatario                        Persona que recibe el pedido,
                                      cuando es distinta de quien compra.

  Dedicatoria                         Mensaje de texto
                                      opcional/obligatorio que acompaña
                                      el arreglo.

  Franja de entrega                   Rango horario en el que el pedido
                                      debe ser entregado.

  Stock                               Cantidad disponible de un producto.

  Merma                               Producto perdido por deterioro,
                                      vencimiento o daño; se descuenta
                                      del inventario.

  MVP                                 Producto mínimo viable: versión con
                                      lo indispensable para funcionar.
  -----------------------------------------------------------------------

# 8. Épicas

Cada Ëpicas agrupa un conjunto de historias de usuario que persiguen un
mismo objetivo de negocio. El identificador de la épica (EP-xx) se usa
después en la matriz de trazabilidad de la fase 2.

  ----------------------------------------------------------------------------------
  ID             Épica           Descripción          Actor principal Responsable
  -------------- --------------- -------------------- --------------- --------------
  EP-01          Gestión de      Permitir el          Visitante /     Román Alberto
                 usuarios y      registro, inicio de  Cliente /       Bolaños
                 autenticación   sesión y             Administrador   Cerquera
                                 administración de                    
                                 perfiles y roles                     
                                 (cliente,                            
                                 administrador,                       
                                 empleado,                            
                                 repartidor).                         

  EP-02          Catálogo de     Publicar y organizar Cliente /       Román Alberto
                 productos       flores y arreglos    Administrador   Bolaños
                                 por                                  Cerquera
                                 categoría/ocasión,                   
                                 con su información,                  
                                 disponibilidad y                     
                                 promociones.                         

  EP-03          Búsqueda y      Permitir encontrar   Visitante /     Ivan Andres
                 navegación      productos mediante   Cliente         Cortes Olaya
                                 búsqueda por texto,                  
                                 filtros y                            
                                 ordenamiento.                        

  EP-04          Carrito de      Permitir agregar,    Cliente         Ivan Andres
                 compras         modificar y eliminar                 Cortes Olaya
                                 productos antes de                   
                                 confirmar la compra.                 

  EP-05          Proceso de      Confirmar el pedido  Cliente         Juan Felipe
                 compra          registrando                          Cortes
                 (checkout)      destinatario,                        Quintero
                                 dirección, fecha y                   
                                 franja de entrega,                   
                                 dedicatoria y método                 
                                 de pago.                             

  EP-06          Gestión de      Consultar pedidos,   Cliente /       Juan Felipe
                 pedidos y       administrar su ciclo Administrador / Cortes
                 entregas        de estados y         Repartidor      Quintero
                                 coordinar la entrega                 
                                 con el repartidor.                   

  EP-07          Gestión de      Controlar las        Administrador / Jorge Steven
                 inventario      existencias de cada  Empleado        Gutierre
                                 producto, sus                        Fierro
                                 movimientos y la                     
                                 merma por deterioro.                 

  EP-08          Reportes y      Consultar            Administrador   Jorge Steven
                 estadísticas    información                          Gutierre
                                 consolidada de                       Fierro
                                 ventas, productos y                  
                                 pedidos.                             
  ----------------------------------------------------------------------------------

Detalle de las épicas

EP-01 --- Gestión de usuarios y autenticación

Objetivo: que cada persona acceda al sistema con una identidad y unos
permisos definidos, considerando que un mismo usuario puede tener más de
un rol (ver RN-G6 en 01-definición-del-proyecto.md).

Incluye: registro, inicio y cierre de sesión, recuperación de
contraseña, edición de perfil, gestión de usuarios y roles por parte del
administrador (empleados, repartidores).

EP-02 --- Catálogo de productos

Objetivo: que el cliente conozca qué se vende y el administrador
mantenga esa información al día, incluyendo la naturaleza perecedera del
producto.

Incluye: listado de productos, detalle, imágenes, categorías,ocasiones,
promociones, crear,editar,desactivar productos, solicitud de arreglo
personalizado.

EP-03 --- Búsqueda y navegación

Objetivo: que el cliente encuentre rápidamente lo que busca.

Incluye: búsqueda por nombre, filtro por categoría,ocasión y precio,
ordenamiento, paginación.

EP-04 --- Carrito de compras

Objetivo: que el cliente reúna varios productos antes de comprar.

Incluye: agregar al carrito, cambiar cantidades, eliminar ítems, ver
total.

EP-05 --- Proceso de compra (checkout)

Objetivo: convertir el carrito en un pedido registrado con todos los
datos que exige una entrega de flores.

Incluye: datos del destinatario y dirección de entrega, selección de
fecha y franja horaria, mensaje de dedicatoria, selección de método de
pago (simulado), confirmación.

EP-06 --- Gestión de pedidos y entregas

Objetivo: dar seguimiento al pedido desde que se confirma hasta que se
entrega.

Incluye: historial del cliente, detalle y cancelación del pedido,
listado administrativo, cambio de estado, asignación de repartidor,
actualización del estado de entrega por el repartidor.

EP-07 --- Gestión de inventario

Objetivo: que no se venda lo que no hay ni lo que ya se deterioró.

Incluye: stock por producto, descuento automático al confirmar pedido,
alerta de stock bajo, registro de merma (producto deteriorado o
vencido), ajustes manuales.

EP-08 --- Reportes y estadísticas

Objetivo: apoyar la toma de decisiones del negocio.

Incluye: ventas por período, productos más vendidos, pedidos por estado.

# 9. Historias de usuario

Prioridad: Alta = entra al MVP · Media = segunda iteración · Baja =
deseable.

EP-01 --- Gestión de usuarios y autenticación

  --------------------------------------------------------------------------------
  ID          Como...         Quiero...      Para...       Prioridad   Est.
  ----------- --------------- -------------- ------------- ----------- -----------
  HU-001      Visitante       registrarme    tener una     Alta        3
                              con correo y   cuenta para               
                              contraseña     comprar                   

  HU-002      Cliente         iniciar sesión acceder a mi  Alta        2
                                             cuenta y mis              
                                             pedidos                   

  HU-003      Cliente         cerrar sesión  proteger mi   Alta        1
                                             cuenta                    

  HU-004      Cliente         editar mis     mantener mi   Media       2
                              datos de       información               
                              perfil         actualizada               

  HU-005      Cliente         recuperar mi   volver a      Media       3
                              contraseña     entrar si la              
                                             olvido                    

  HU-006      Administrador   crear cuentas  que el equipo Alta        3
                              de empleados y del negocio               
                              repartidores   use el                    
                              con su rol     sistema                   
  --------------------------------------------------------------------------------

EP-02 --- Catálogo de productos

  -----------------------------------------------------------------------------------
  ID          Como...         Quiero...       Para...         Prioridad   Est.
  ----------- --------------- --------------- --------------- ----------- -----------
  HU-007      Visitante       ver el listado  conocer qué     Alta        3
                              de productos    vende la                    
                                              floristería                 

  HU-008      Visitante       ver el detalle  decidir si lo   Alta        2
                              de un producto  compro                      

  HU-009      Administrador   crear un        publicarlo en   Alta        5
                              producto        la tienda                   
                              indicando                                   
                              precio, stock y                             
                              vida útil                                   

  HU-010      Administrador   editar un       corregir su     Alta        3
                              producto        precio,                     
                                              descripción o               
                                              vida útil                   

  HU-011      Administrador   desactivar un   dejar de        Media       2
                              producto        ofrecerlo sin               
                                              perder su                   
                                              historial                   

  HU-012      Administrador   gestionar       organizar el    Media       3
                              categorías y    catálogo                    
                              ocasiones       (cumpleaños,                
                                              condolencias,               
                                              aniversario,                
                                              etc.)                       

  HU-013      Cliente         solicitar un    pedir algo que  Baja        5
                              arreglo         no está en el               
                              personalizado   catálogo                    
                              describiendo lo                             
                              que quiero                                  

  HU-014      Administrador   crear           aumentar ventas Baja        3
                              promociones por en fechas clave             
                              temporada       (San Valentín,              
                                              Día de la                   
                                              Madre)                      
  -----------------------------------------------------------------------------------

EP-03 --- Búsqueda y navegación

  -------------------------------------------------------------------------
  ID          Como...     Quiero...   Para...       Prioridad   Est.
  ----------- ----------- ----------- ------------- ----------- -----------
  HU-015      Visitante   buscar      encontrar     Alta        3
                          productos   rápido lo que             
                          por nombre  necesito                  

  HU-016      Visitante   filtrar     ver solo lo   Alta        2
                          productos   que me                    
                          por         interesa                  
                          categoría u                           
                          ocasión                               

  HU-017      Visitante   filtrar por ajustarme a   Media       2
                          rango de    mi                        
                          precio      presupuesto               

  HU-018      Visitante   ver los     navegar       Media       2
                          productos   cómodamente               
                          paginados   el catálogo               
  -------------------------------------------------------------------------

EP-04 --- Carrito de compras

  ------------------------------------------------------------------------
  ID          Como...     Quiero...   Para...      Prioridad   Est.
  ----------- ----------- ----------- ------------ ----------- -----------
  HU-019      Cliente     agregar un  reservarlo   Alta        3
                          producto al para                     
                          carrito     comprarlo                

  HU-020      Cliente     modificar   ajustar mi   Alta        2
                          la cantidad compra                   
                          de un ítem                           

  HU-021      Cliente     eliminar un quitar lo    Alta        2
                          ítem del    que ya no                
                          carrito     quiero                   

  HU-022      Cliente     ver el      saber cuánto Alta        2
                          total del   voy a pagar              
                          carrito                              
  ------------------------------------------------------------------------

EP-05 --- Proceso de compra (checkout)

  ---------------------------------------------------------------------------
  ID          Como...     Quiero...      Para...      Prioridad   Est.
  ----------- ----------- -------------- ------------ ----------- -----------
  HU-023      Cliente     indicar los    pedir flores Alta        3
                          datos del      para regalar             
                          destinatario y a otra                   
                          la dirección   persona                  
                          de entrega                              

  HU-024      Cliente     elegir la      recibir el   Alta        5
                          fecha y la     pedido                   
                          franja horaria cuando lo                
                          de entrega     necesito                 

  HU-025      Cliente     escribir un    acompañar el Media       2
                          mensaje de     arreglo con              
                          dedicatoria    un mensaje               
                                         personal                 

  HU-026      Cliente     confirmar mi   formalizar   Alta        5
                          pedido         la compra                

  HU-027      Cliente     elegir el      pagar como   Media       3
                          método de pago me convenga              

  HU-028      Sistema     registrar la   dejar        Media       3
                          transacción de evidencia de             
                          pago           cada cobro               
  ---------------------------------------------------------------------------

EP-06 --- Gestión de pedidos y entregas

  --------------------------------------------------------------------------------
  ID          Como...         Quiero...    Para...         Prioridad   Est.
  ----------- --------------- ------------ --------------- ----------- -----------
  HU-029      Cliente         ver el       hacer           Alta        3
                              historial de seguimiento a               
                              mis pedidos  mis compras                 

  HU-030      Cliente         ver el       revisar qué     Alta        2
                              detalle y    compré, para                
                              estado de un quién y cuándo              
                              pedido       llega                       

  HU-031      Cliente         cancelar un  arrepentirme a  Baja        3
                              pedido no    tiempo                      
                              despachado                               

  HU-032      Administrador   ver todos    gestionar la    Alta        3
                              los pedidos  operación del               
                                           negocio                     

  HU-033      Administrador   cambiar el   informar el     Alta        3
                              estado de un avance al                   
                              pedido       cliente                     

  HU-034      Administrador   asignar un   coordinar la    Alta        3
                              repartidor a entrega                     
                              un pedido                                

  HU-035      Repartidor      consultar    saber qué debo  Alta        2
                              los pedidos  entregar y                  
                              que tengo    dónde                       
                              asignados                                

  HU-036      Repartidor      actualizar   informar al     Alta        2
                              el estado de cliente y al                
                              la entrega   administrador               
  --------------------------------------------------------------------------------

EP-07 --- Gestión de inventario

  --------------------------------------------------------------------------------
  ID          Como...         Quiero...      Para...       Prioridad   Est.
  ----------- --------------- -------------- ------------- ----------- -----------
  HU-037      Administrador   registrar el   saber cuánto  Alta        3
                              stock de un    hay                       
                              producto       disponible                

  HU-038      Sistema         descontar      mantener el   Alta        3
                              stock al       inventario                
                              confirmar un   exacto                    
                              pedido                                   

  HU-039      Administrador   ver alertas de reabastecer a Media       3
                              stock bajo     tiempo                    

  HU-040      Empleado        registrar la   mantener el   Alta        3
                              merma de       inventario                
                              flores         real y no                 
                              deterioradas o vender lo                 
                              vencidas       dañado                    
  --------------------------------------------------------------------------------

EP-08 --- Reportes y estadísticas

  -----------------------------------------------------------------------------
  ID          Como...         Quiero...   Para...       Prioridad   Est.
  ----------- --------------- ----------- ------------- ----------- -----------
  HU-041      Administrador   ver el      conocer el    Media       5
                              reporte de  desempeño del             
                              ventas por  negocio                   
                              período                               

  HU-042      Administrador   ver los     decidir qué   Baja        3
                              productos   reabastecer               
                              más                                   
                              vendidos                              

  HU-043      Administrador   ver el      identificar   Baja        3
                              reporte de  cuellos de                
                              pedidos por botella en la             
                              estado      operación                 
  -----------------------------------------------------------------------------

Resumen de priorización

  Prioridad    Historias   Puntos
  ------------ ----------- --------
  Alta (MVP)   27          76
  Media        11          30
  Baja         5           17

Alcance del MVP

El MVP lo componen las 27 historias de prioridad Alta, que cubren el
flujo completo:

Quedan fuera del MVP (Media/Baja): recuperar contraseña, categorías
avanzadas, arreglos personalizados a cotizar, promociones, dedicatoria,
método de pago seleccionable, registro formal de transacciones,
cancelación de pedidos, alertas de stock bajo y los reportes distintos
al de ventas.

Estados posibles de una historia: Pendiente · En curso · En revisión ·
Terminada.

4.  Asignación de trabajo del equipo

Somos 4 integrantes. Las 43 historias del backlog cuentan con un detalle
definido. Cada integrante tiene asignadas 2 épicas y es responsable de
revisar, ajustar y validar las historias correspondientes a esas épicas
mediante Pull Request.

  ----------------------------------------------------------------------------
  Integrante        Épicas asignadas  Historias a       Rama de trabajo
                                      revisar           
  ----------------- ----------------- ----------------- ----------------------
  Román Alberto     EP-01, EP-02      HU-001 a HU-014   `fase-1/ep-01-ep-02`
  Bolaños Cerquera                                      

  Ivan Andres       EP-03, EP-04      HU-015 a HU-022   `fase-1/ep-03-ep-04`
  Cortes Olaya                                          

  Juan Felipe       EP-05, EP-06      HU-023 a HU-036   `fase-1/ep-05-ep-06`
  Cortes Quintero                                       

  Jorge Steven      EP-07, EP-08      HU-037 a HU-043   `fase-1/ep-07-ep-08`
  Gutierre Fierro                                       
  ----------------------------------------------------------------------------

El repositorio cuenta con templates predefinidos para Pull Requests e
Issues, los cuales permiten estandarizar la creación de solicitudes y
reportes durante el desarrollo del proyecto. Estos templates facilitan
la organización de los cambios, la descripción de incidencias y el
proceso de revisión por parte del equipo.

### Templates de Pull Requests e Issues

Definición de "terminado" para la fase 1

Una historia se considera terminada cuando:

\[x\] Tiene su archivo propio en historias-de-usuario/ con la
nomenclatura acordada

\[x\] El formato "Como... quiero... para..." está completo y es
específico.

\[x\] Tiene al menos 3 criterios de aceptación en formato
Dado/Cuando/Entonces,

incluyendo al menos un escenario de error o alterno.

\[x\] Están listadas las reglas de negocio que la afectan.

\[x\] Tiene responsable y estado confirmados para las 43 historias.

\[x\] Fue revisada y ajustada por el integrante responsable de su épica.

\[x\] Fue aprobada mediante revisión cruzada en Pull Request.

Cronograma de la semana 1

  -----------------------------------------------------------------------
  Día                     Actividad               Responsable
  ----------------------- ----------------------- -----------------------
  1                       Reunión inicial:        Todos
                          validar problema,       
                          objetivo, actores,      
                          alcance y supuestos     
                          genéricos.              

  2                       Revisar y ajustar el    Todos
                          backlog y las épicas    
                          según lo acordado.      

  3-4                     Revisar y validar las   Cada uno
                          historias de las épicas 
                          asignadas, asignarse    
                          responsable y estado.   

  5                       Revisión cruzada de     Todos
                          Pull Requests           

  5                       Priorización final y    Todos
                          cierre del alcance del  
                          MVP                     
  -----------------------------------------------------------------------

Aspectos a validar en fase 2

\[ \] Validar nombre comercial y datos de contacto con el negocio real
en Neiva.

\[ \] Validar días, horarios de operación y franjas de entrega.

\[ \] Definir si el carrito estará disponible para visitantes sin
cuenta.

\[ \] Definir si el registro requiere verificación por correo.

\[ \] Confirmar en fase 2 los estados definitivos del ciclo de vida del
pedido.

En preparación, En camino, Entregado, Cancelado).

\[ \] Definir la vida útil por tipo de producto para el registro de
merma.

\[ \] Confirmar en fase 2 el alcance del pago simulado y la no
integración de una pasarela real.

\[ \] Definir si el repartidor pertenece al negocio o corresponde a un
servicio externo.

\[ \] Definir zona de cobertura y cupos máximos por franja horaria.

5.  Detalle de historias de usuario

Criterio de estimación temporal inicial: para esta versión de
planificación se toma 1 Story Point ≈ 2 horas de trabajo efectivo. Esta
equivalencia es una referencia inicial y deberá recalibrarse con la
velocidad real observada en los sprints.

A continuación, el detalle completo de cada historia de usuario del
backlog, en formato Dado/Cuando/Entonces, con sus reglas de negocio y
notas de dependencia.

HU-001 --- Registro de usuario

  Campo             Valor
  ----------------- -----------------------------------------------
  Épica             EP-01 --- Gestión de usuarios y autenticación
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como visitante de la tienda de flores quiero registrarme con mi correo y
una contraseña

para tener una cuenta que me permita comprar arreglos y consultar mis
pedidos.

Criterios de aceptación

CA-1 --- Registro exitoso

Dado que estoy en el formulario de registro y no tengo cuenta

Cuando ingresó nombre, correo válido y una contraseña que cumple las
reglas, y confirmó

Entonces el sistema crea mi cuenta con rol Cliente, me muestra un
mensaje de confirmación y me lleva a la pantalla de inicio de sesión

CA-2 --- Correo ya registrado

Dado que ya existe una cuenta con el correo que ingresé

Cuando intento registrarme

Entonces el sistema no crea la cuenta y muestra el mensaje "Ya existe
una cuenta con este correo"

CA-3 --- Datos inválidos

Dado que estoy en el formulario de registro

Cuando dejo un campo obligatorio vacío o el correo tiene un formato
incorrecto

Entonces el sistema señala el campo con error y no envía el formulario

CA-4 --- Contraseña débil

Dado que estoy diligenciando el formulario

Cuando ingreso una contraseña de menos de 8 caracteres o sin al menos
una letra y un número

Entonces el sistema muestra las reglas de la contraseña y no permite
continuar

Reglas de negocio asociadas

RN-01: El correo electrónico es único por cuenta.

RN-02: La contraseña debe tener mínimo 8 caracteres, con al menos una
letra y un número.

RN-03: Toda cuenta creada desde el formulario público recibe el rol
Cliente.

RN-04: Las contraseñas se almacenan cifradas, nunca en texto plano.

Notas y dependencias

Base para HU-002 (inicio de sesión).

Definir en fase 2 si el registro requiere verificación por correo.

HU-002 --- Iniciar sesión

  Campo             Valor
  ----------------- -----------------------------------------------
  Épica             EP-01 --- Gestión de usuarios y autenticación
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como cliente registrado

quiero iniciar sesión con mi correo y contraseña para acceder a mi
cuenta y a mis pedidos.

Criterios de aceptación

CA-1 --- Inicio de sesión exitoso

Dado que tengo una cuenta activa

Cuando ingreso mi correo y contraseña correctos y presiono "Iniciar
sesión"

Entonces el sistema me autentica y me redirige a mi panel según mi rol

CA-2 --- Credenciales incorrectas

Dado que estoy en el formulario de inicio de sesión

Cuando ingreso una contraseña incorrecta

Entonces el sistema muestra "Correo o contraseña incorrectos" y no
inicia sesión

CA-3 --- Cuenta inexistente

Dado que estoy en el formulario de inicio de sesión

Cuando ingreso un correo que no está registrado

Entonces el sistema muestra el mismo mensaje genérico "Correo o
contraseña

incorrectos", sin indicar si el correo existe o no

CA-4 --- Bloqueo por intentos fallidos

Dado que he fallado 5 intentos consecutivos de inicio de sesión

Cuando intento iniciar sesión de nuevo

Entonces el sistema bloquea temporalmente los intentos para ese correo y
me lo

informa

Reglas de negocio asociadas

RN-30: El mensaje de error de credenciales inválidas nunca revela si el
correo existe o

no, por seguridad.

RN-31: Tras 5 intentos fallidos consecutivos, la cuenta se bloquea
temporalmente.

Notas y dependencias

Depende de HU-001 (registro).

Relacionada con HU-005 (recuperar contraseña).

HU-003 --- Cerrar sesión

  Campo             Valor
  ----------------- -----------------------------------------------
  Épica             EP-01 --- Gestión de usuarios y autenticación
  Prioridad         Alta (MVP)
  Estimación        1 punto
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   2 horas

Historia

Como cliente registrado quiero cerrar sesión para proteger mi cuenta
cuando uso un dispositivo compartido.

Criterios de aceptación

CA-1 --- Cierre de sesión exitoso

Dado que tengo una sesión activa Cuando presiono "Cerrar sesión"

Entonces el sistema termina mi sesión y me redirige a la página de
inicio como

visitante

CA-2 --- Acceso a páginas protegidas tras cerrar sesión

Dado que cerré sesión

Cuando intento volver a una página que requiere autenticación (ej. mis
pedidos)

usando el botón "atrás" del navegador

Entonces el sistema me redirige al inicio de sesión y no muestra
información de mi

cuenta

CA-3 --- Cierre de sesión en varias pestañas

Dado que tengo la misma cuenta abierta en dos pestañas

Cuando cierro sesión en una de ellas

Entonces la otra pestaña deja de tener acceso a las acciones que
requieren sesión en

la siguiente interacción

Reglas de negocio asociadas

RN-32: Cerrar sesión invalida el token/sesión activa en el servidor, no
solo en el

navegador.

Notas y dependencias

Depende de HU-002 (inicio de sesión).

HU-004 --- Editar datos de perfil

  Campo             Valor
  ----------------- -----------------------------------------------
  Épica             EP-01 --- Gestión de usuarios y autenticación
  Prioridad         Media
  Estimación        2 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como cliente registrado quiero editar mis datos de perfil (nombre,
teléfono, dirección habitual)

para mantener mi información actualizada y agilizar mis próximas
compras.

Criterios de aceptación

CA-1 --- Edición exitosa

Dado que estoy en la pantalla de mi perfil

Cuando modifico mi nombre o teléfono con datos válidos y guardo

Entonces el sistema actualiza mis datos y muestra un mensaje de
confirmación

CA-2 --- Correo duplicado al cambiarlo

Dado que intento cambiar mi correo por uno que ya usa otra cuenta

Cuando guardo el cambio

Entonces el sistema no permite el cambio y muestra "Ese correo ya está
en uso"

CA-3 --- Campo obligatorio vacío

Dado que estoy editando mi perfil

Cuando dejo el nombre vacío y guardo

Entonces el sistema no guarda el cambio y señala el campo como
obligatorio

Reglas de negocio asociadas

RN-33: El correo sigue siendo único por cuenta también al momento de
editarlo (ver

RN-01 en HU-001).

Notas y dependencias

Depende de HU-002 (inicio de sesión).

HU-005 --- Recuperar contraseña

  Campo             Valor
  ----------------- -----------------------------------------------
  Épica             EP-01 --- Gestión de usuarios y autenticación
  Prioridad         Media
  Estimación        3 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como cliente registrado quiero recuperar mi contraseña si la olvido para
poder volver a entrar a mi cuenta sin depender de que un administrador
me ayude.

Criterios de aceptación

CA-1 --- Solicitud de recuperación

Dado que olvidé mi contraseña

Cuando ingreso mi correo en "¿Olvidaste tu contraseña?" y lo envío

Entonces el sistema envía un enlace de recuperación válido por tiempo
limitado a ese

correo, si existe una cuenta asociada

CA-2 --- Correo no registrado

Dado que ingreso un correo que no tiene cuenta

Cuando solicito la recuperación

Entonces el sistema muestra el mismo mensaje genérico de confirmación de
envío, sin

revelar si el correo existe (ver RN-30 en HU-002)

CA-3 --- Enlace vencido

Dado que recibí un enlace de recuperación

Cuando intento usarlo después de que expiró

Entonces el sistema muestra "El enlace expiró" y me ofrece solicitar uno
nuevo

CA-4 --- Nueva contraseña válida

Dado que estoy en el formulario de nueva contraseña desde un enlace
vigente

Cuando ingreso una contraseña que cumple las reglas (RN-02 en HU-001) y
la confirmo

Entonces el sistema actualiza la contraseña y me permite iniciar sesión
con la nueva

Reglas de negocio asociadas

RN-34: El enlace de recuperación expira a las 30 minutos de haberse
generado.

RN-35: Un enlace de recuperación solo puede usarse una vez.

Notas y dependencias

Depende de HU-001 (registro) y HU-002 (inicio de sesión).

Definir en fase 2 el proveedor de envío de correos.

HU-006 --- Crear cuentas de empleados y repartidores

  Campo             Valor
  ----------------- -----------------------------------------------
  Épica             EP-01 --- Gestión de usuarios y autenticación
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero crear cuentas para empleados y repartidores
asignándoles su rol

para que el equipo del negocio pueda usar el sistema según sus
funciones.

Criterios de aceptación

CA-1 --- Creación exitosa

Dado que estoy en el panel de gestión de usuarios

Cuando ingreso nombre, correo y selecciono el rol "Empleado" o
"Repartidor", y guardo

Entonces el sistema crea la cuenta con ese rol y envía al correo
indicado los datos

para establecer su contraseña

CA-2 --- Correo ya usado

Dado que el correo ingresado ya tiene una cuenta (de cualquier rol)

Cuando intento crear la cuenta

Entonces el sistema no la crea y muestra "Ya existe una cuenta con este
correo"

CA-3 --- Usuario con más de un rol

Dado que un usuario ya tiene el rol "Empleado"

Cuando el administrador le asigna también el rol "Repartidor"

Entonces el sistema permite que la cuenta tenga ambos roles activos (ver
RN-G6)

CA-4 --- Desactivar una cuenta de empleado o repartidor

Dado que un empleado ya no trabaja en el negocio

Cuando el administrador desactiva su cuenta

Entonces esa persona no puede iniciar sesión, pero su historial de
acciones (pedidos

preparados, entregas) se conserva

Reglas de negocio asociadas

RN-G6: Un usuario puede tener más de un rol (ver
01-definicion-del-proyecto.md).

RN-36: Solo el administrador puede crear o desactivar cuentas de
empleado y repartidor.

Notas y dependencias

Precede a HU-034 (asignar repartidor) y HU-040 (registrar merma).

HU-007 --- Ver listado de productos

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de productos
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como visitante quiero ver el listado de productos disponibles para
conocer qué flores y arreglos vende la floristería.

Criterios de aceptación

CA-1 --- Listado con productos disponibles

Dado que hay productos activos y con stock

Cuando entro a la página del catálogo

Entonces veo cada producto con su imagen, nombre y precio

CA-2 --- Catálogo vacío

Dado que no hay ningún producto activo

Cuando entro al catálogo

Entonces el sistema muestra el mensaje "Por el momento no hay productos
disponibles"

CA-3 --- Productos sin stock

Dado que un producto está activo pero con stock 0

Cuando veo el listado

Entonces el producto aparece marcado como "Agotado" y no se puede
agregar al carrito

desde el listado

CA-4 --- Productos desactivados no aparecen

Dado que un producto fue desactivado por el administrador (HU-011)

Cuando un visitante consulta el catálogo

Entonces ese producto no aparece en el listado

Reglas de negocio asociadas

RN-37: Solo se muestran en el catálogo público los productos con estado
"Activo".

Notas y dependencias

Precede a HU-008 (detalle de producto) y HU-019 (agregar al carrito).

HU-008 --- Ver detalle de un producto

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de productos
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como visitante quiero ver el detalle de un producto (descripción,
precio, categoría, stock) para decidir si lo compro.

Criterios de aceptación

CA-1 --- Detalle completo

Dado que selecciono un producto del listado

Cuando entro a su página de detalle

Entonces veo su nombre, descripción, precio, imagen, categoría/ocasión y

disponibilidad

CA-2 --- Producto sin stock

Dado que el producto tiene stock 0

Cuando veo su detalle

Entonces el botón "Agregar al carrito" aparece deshabilitado con la
etiqueta

"Agotado" (ver CA-4 de HU-019)

CA-3 --- Producto inexistente o desactivado

Dado que accedo a la URL de un producto que no existe o fue desactivado

Cuando intento ver su detalle

Entonces el sistema muestra una página de "Producto no encontrado"

Reglas de negocio asociadas

RN-37: Solo se muestran productos con estado "Activo" (ver HU-007).

Notas y dependencias

Depende de HU-007 (listado de productos).

Precede a HU-019 (agregar al carrito).

HU-009 --- Crear producto (flor o arreglo)

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de productos
  Prioridad         Alta (MVP)
  Estimación        5 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   10 horas

Historia

Como administrador quiero crear un producto indicando nombre, precio,
stock inicial y vida útil estimada

para publicarlo en la tienda y controlar su rotación antes de que se
deteriore.

Criterios de aceptación

CA-1 --- Creación exitosa

Dado que estoy en el formulario de nuevo producto

Cuando ingreso nombre, descripción, precio, stock inicial, categoría y
vida útil

estimada en días, y guardo

Entonces el producto se publica en el catálogo con estado "Disponible" y
con la fecha

de ingreso registrada automáticamente

CA-2 --- Datos obligatorios incompletos

Dado que estoy en el formulario de nuevo producto

Cuando dejo el nombre, el precio o el stock inicial vacíos y guardo

Entonces el sistema señala los campos faltantes y no crea el producto

CA-3 --- Precio o stock inválido

Dado que estoy diligenciando el formulario

Cuando ingreso un precio menor o igual a cero, o un stock negativo

Entonces el sistema muestra el error correspondiente y no permite
guardar

CA-4 --- Vida útil no informada

Dado que estoy creando un producto perecedero (por ejemplo, rosas
frescas)

Cuando no indico la vida útil estimada

Entonces el sistema advierte que el producto no generará alertas de
vencimiento hasta

que se complete ese dato, pero permite guardarlo

Reglas de negocio asociadas

RN-14: Todo producto queda asociado a una fecha de ingreso al
inventario.

RN-15: El precio debe ser mayor a cero.

RN-16: El stock inicial no puede ser negativo.

RN-17: La vida útil estimada (en días) es la base para calcular alertas
de vencimiento y

para el registro de merma (HU-040).

Notas y dependencias

Relacionada con HU-010 (editar producto), HU-011 (desactivar producto) y
HU-040

(registro de merma).

Definir en fase 2 si el producto admite múltiples imágenes.

HU-010 --- Editar producto

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de productos
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero editar un producto existente para corregir su
precio, descripción o vida útil cuando cambien las condiciones.

Criterios de aceptación

CA-1 --- Edición exitosa

Dado que estoy viendo el formulario de edición de un producto

Cuando modifico su precio o descripción con datos válidos y guardo

Entonces el sistema actualiza el producto y los cambios se reflejan de
inmediato en

el catálogo público

CA-2 --- Precio inválido

Dado que estoy editando un producto

Cuando ingreso un precio menor o igual a cero

Entonces el sistema no guarda el cambio y muestra el error
correspondiente

CA-3 --- Edición del stock desde este formulario

Dado que estoy editando un producto

Cuando intento modificar directamente el campo de stock

Entonces el sistema no lo permite desde aquí y me redirige al módulo de
inventario

(HU-037), para no perder la trazabilidad de los movimientos

Reglas de negocio asociadas

RN-15: El precio debe ser mayor a cero (ver HU-009).

RN-38: El stock de un producto solo se modifica a través de movimientos
de inventario

(entradas, ventas, merma), no editando el producto directamente.

Notas y dependencias

Depende de HU-009 (crear producto).

HU-011 --- Desactivar producto

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de productos
  Prioridad         Media
  Estimación        2 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como administrador quiero desactivar un producto para dejar de ofrecerlo
en el catálogo sin perder su historial de ventas.

Criterios de aceptación

CA-1 --- Desactivación exitosa

Dado que un producto está activo

Cuando el administrador lo desactiva

Entonces el producto deja de aparecer en el catálogo público, pero se
conserva en el

sistema con su historial de ventas y movimientos de inventario

CA-2 --- Reactivar un producto

Dado que un producto está desactivado y tiene stock disponible

Cuando el administrador lo reactiva

Entonces el producto vuelve a aparecer en el catálogo público

CA-3 --- Producto en un carrito al momento de desactivarse

Dado que un cliente tiene el producto en su carrito

Cuando el administrador lo desactiva antes de que el cliente confirme el
pedido

Entonces el sistema no permite confirmar el pedido con ese producto y le
avisa al

cliente que ya no está disponible

Reglas de negocio asociadas

RN-39: Desactivar un producto no elimina su historial ni sus movimientos
de inventario.

Notas y dependencias

Depende de HU-009 (crear producto).

Relacionada con HU-026 (confirmar pedido).

HU-012 --- Gestionar categorías y ocasiones

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de Productos
  Prioridad         Media
  Estimación        3 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero crear, editar y desactivar categorías y
ocasiones (cumpleaños, condolencias, aniversario, etc.)

para organizar el catálogo y que el cliente encuentre productos según el
motivo de su compra.

Criterios de aceptación

CA-1 --- Crear categoría

Dado que estoy en el panel de categorías

Cuando ingreso un nombre único y guardo

Entonces la categoría queda disponible para asignar a productos y para
filtrar el

catálogo (HU-016)

CA-2 --- Nombre duplicado

Dado que ya existe una categoría con el nombre que ingreso

Cuando intento crearla

Entonces el sistema no la crea y muestra "Ya existe una categoría con
este nombre"

CA-3 --- Desactivar categoría en uso

Dado que una categoría tiene productos activos asociados

Cuando el administrador intenta desactivarla

Entonces el sistema advierte cuántos productos la usan antes de
confirmar la

desactivación

Reglas de negocio asociadas

RN-40: El nombre de una categoría es único.

Notas y dependencias

Relacionada con HU-009 (crear producto) y HU-016 (filtrar por
categoría).

HU-013 --- Solicitar un arreglo personalizado

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de productos
  Prioridad         Baja
  Estimación        5 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   10 horas

Historia

Como cliente quiero describir un arreglo personalizado que no está en el
catálogo (colores, presupuesto, ocasión)

para pedir algo a la medida de lo que necesito.

Criterios de aceptación

CA-1 --- Envío de solicitud

Dado que estoy en la sección "Arreglo personalizado"

Cuando describo lo que quiero, indico un presupuesto aproximado y envío
la

solicitud

Entonces el sistema la registra como "Pendiente de cotizar" y notifica
al

administrador

CA-2 --- Respuesta del administrador con cotización

Dado que el administrador revisó una solicitud

Cuando define un precio final y lo envía

Entonces el cliente recibe la cotización y puede aceptarla para
convertirla en un

pedido, o rechazarla

CA-3 --- Solicitud incompleta

Dado que estoy llenando el formulario de solicitud

Cuando no describo lo que quiero (campo vacío)

Entonces el sistema no permite enviarla

Reglas de negocio asociadas

RN-41: Un arreglo personalizado no tiene precio fijo hasta que el
administrador lo

cotiza.

Notas y dependencias

Al aceptarse la cotización, sigue el flujo normal de checkout (EP-05).

Definir en fase 2 el tiempo máximo de respuesta del administrador.

HU-014 --- Crear promociones por temporada

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-02 --- Catálogo de productos
  Prioridad         Baja
  Estimación        3 puntos
  Responsable       Román Alberto Bolaños Cerquera
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero crear promociones con descuento para fechas de
temporada (San Valentín, Día de la Madre, Amor y Amistad)

para aumentar las ventas en esas fechas clave.

Criterios de aceptación

CA-1 --- Creación de promoción

Dado que estoy en el panel de promociones

Cuando selecciono uno o varios productos, defino un porcentaje de
descuento y un

rango de fechas de vigencia, y guardo

Entonces el descuento se aplica automáticamente al precio de esos
productos durante

ese rango de fechas

CA-2 --- Descuento fuera de rango

Dado que la fecha actual está fuera del rango de vigencia de una
promoción

Cuando un cliente ve el producto

Entonces el sistema muestra el precio normal, sin el descuento

CA-3 --- Porcentaje inválido

Dado que estoy creando una promoción

Cuando ingreso un descuento mayor a 100% o menor o igual a 0%

Entonces el sistema no permite guardar la promoción

Reglas de negocio asociadas

RN-42: Un producto solo puede tener una promoción activa a la vez.

Notas y dependencias

Depende de HU-009 (crear producto).

HU-015 --- Buscar productos por nombre

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-03 --- Búsqueda y navegación
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como visitante quiero buscar productos escribiendo su nombre para
encontrar rápido lo que necesito sin recorrer todo el catálogo.

Criterios de aceptación

CA-1 --- Resultados encontrados

Dado que escribo un término que coincide con el nombre de uno o más
productos

Cuando ejecuto la búsqueda

Entonces el sistema muestra los productos activos cuyo nombre contiene
ese término

CA-2 --- Sin resultados

Dado que escribo un término que no coincide con ningún producto

Cuando ejecuto la búsqueda

Entonces el sistema muestra "No se encontraron productos para tu
búsqueda"

CA-3 --- Búsqueda vacía

Dado que dejo el campo de búsqueda vacío

Cuando intento buscar

Entonces el sistema muestra el catálogo completo, igual que HU-007

CA-4 --- Búsqueda sin distinguir mayúsculas ni tildes

Dado que un producto se llama "Ramo de Rosas"

Cuando busco "ramo de rosas" o "RAMO DE ROSAS"

Entonces el sistema lo encuentra igual, sin importar mayúsculas ni
tildes

Reglas de negocio asociadas

RN-37: Solo se muestran productos activos (ver HU-007).

Notas y dependencias

Depende de HU-007 (listado de productos).

HU-016 --- Filtrar productos por categoría u ocasión

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-03 --- Búsqueda y navegación
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como visitante quiero filtrar los productos por categoría u ocasión para
ver solo lo que me interesa según el motivo de mi compra.

Criterios de aceptación

CA-1 --- Filtro aplicado

Dado que estoy en el catálogo

Cuando selecciono la categoría/ocasión "Condolencias"

Entonces el sistema muestra únicamente los productos activos de esa
categoría

CA-2 --- Combinar con búsqueda por nombre

Dado que ya filtré por una categoría

Cuando además escribo un término de búsqueda

Entonces el sistema muestra solo los productos que cumplen ambos
criterios

CA-3 --- Categoría sin productos

Dado que selecciono una categoría que no tiene productos activos

Cuando aplico el filtro

Entonces el sistema muestra "No hay productos en esta categoría"

CA-4 --- Quitar el filtro

Dado que tengo un filtro de categoría aplicado

Cuando lo quito

Entonces el sistema vuelve a mostrar el catálogo completo

Reglas de negocio asociadas

RN-37: Solo se muestran productos activos (ver HU-007).

Notas y dependencias

Depende de HU-012 (gestión de categorías) y HU-007 (listado de
productos).

HU-017 --- Filtrar por rango de precio

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-03 --- Búsqueda y navegación
  Prioridad         Media
  Estimación        2 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como visitante quiero filtrar los productos por un rango de precio para
ajustarme a mi presupuesto.

Criterios de aceptación

CA-1 --- Filtro aplicado correctamente

Dado que ingreso un precio mínimo y uno máximo

Cuando aplico el filtro

Entonces el sistema muestra solo los productos activos cuyo precio está
dentro de

ese rango

CA-2 --- Rango inválido

Dado que ingreso un precio mínimo mayor al precio máximo

Cuando intento aplicar el filtro

Entonces el sistema muestra un mensaje de error y no aplica el filtro

CA-3 --- Sin productos en el rango

Dado que ningún producto activo cae dentro del rango indicado

Cuando aplico el filtro

Entonces el sistema muestra "No hay productos en ese rango de precio"

Reglas de negocio asociadas

RN-37: Solo se muestran productos activos (ver HU-007).

Notas y dependencias

Depende de HU-007 (listado de productos).

Se puede combinar con HU-015 y HU-016.

HU-018 --- Ver los productos paginados

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-03 --- Búsqueda y navegación
  Prioridad         Media
  Estimación        2 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como visitante quiero ver el catálogo dividido en páginas para navegar
cómodamente sin cargar todos los productos a la vez.

Criterios de aceptación

CA-1 --- Catálogo con más productos que el límite de una página

Dado que hay más productos activos que el número que se muestra por
página

Cuando entro al catálogo

Entonces veo la primera página con el límite configurado y controles
para avanzar de

página

CA-2 --- Navegar a la siguiente página

Dado que estoy en la página 1 de resultados

Cuando presiono "Siguiente"

Entonces el sistema muestra el siguiente grupo de productos

CA-3 --- Última página

Dado que estoy en la última página de resultados

Cuando reviso los controles de paginación

Entonces el botón "Siguiente" aparece deshabilitado

CA-4 --- Paginación con filtros aplicados

Dado que apliqué un filtro de categoría o precio

Cuando navego entre páginas

Entonces la paginación respeta el filtro activo en todas las páginas

Reglas de negocio asociadas

RN-43: El número de productos por página es configurable, con un valor
por defecto de

12. 

Notas y dependencias

Depende de HU-007, HU-015, HU-016 y HU-017.

HU-019 --- Agregar producto al carrito

  Campo             Valor
  ----------------- ------------------------------
  Épica             EP-04 --- Carrito de compras
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como cliente de la tienda quiero agregar un producto a mi carrito
indicando la cantidad para reunir varios productos y comprarlos en un
solo pedido.

Criterios de aceptación

CA-1 --- Agregar un producto disponible

Dado que veo el detalle de un producto con stock disponible

Cuando indico una cantidad válida y presiono "Agregar al carrito"

Entonces el producto queda en mi carrito con esa cantidad, el contador
del carrito se actualiza y veo un mensaje de confirmación

CA-2 --- Producto ya presente en el carrito

Dado que el producto ya está en mi carrito con cantidad 2

Cuando agrego 3 unidades más

Entonces el carrito muestra una sola línea de ese producto con cantidad
5

CA-3 --- Cantidad mayor al stock

Dado que el producto tiene 4 unidades en stock

Cuando intento agregar 5 unidades

Entonces el sistema no agrega el producto y muestra "Solo hay 4 unidades
disponibles"

CA-4 --- Producto sin stock

Dado que el producto tiene stock 0

Cuando veo su detalle

Entonces el botón "Agregar al carrito" aparece deshabilitado con la
etiqueta "Agotado"

CA-5 --- Persistencia del carrito

Dado que tengo productos en el carrito y estoy autenticado

Cuando cierro sesión y vuelvo a entrar

Entonces el carrito conserva los productos que había agregado

Reglas de negocio asociadas

RN-10: No se puede agregar al carrito una cantidad mayor al stock
disponible.

RN-11: La cantidad mínima por ítem es 1 y debe ser un número entero.

RN-12: Agregar al carrito no reserva ni descuenta stock; el descuento
ocurre al confirmar el pedido (HU-038).

RN-13: El precio del ítem es el vigente al momento de confirmar el
pedido, no al agregarlo.

Notas y dependencias

Depende de HU-008 (detalle de producto).

Relacionada con HU-020, HU-021 y HU-022.

Definir en fase 2 el comportamiento del carrito para visitantes no
autenticados.

HU-020 --- Modificar la cantidad de un ítem del carrito

  Campo             Valor
  ----------------- ------------------------------
  Épica             EP-04 --- Carrito de compras
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como cliente quiero modificar la cantidad de un producto que ya está en
mi carrito para ajustar mi compra sin tener que eliminarlo y agregarlo
de nuevo.

Criterios de aceptación

CA-1 --- Aumentar cantidad dentro del stock disponible

Dado que tengo 2 unidades de un producto en el carrito y hay 6
disponibles

Cuando cambio la cantidad a 5

Entonces el carrito actualiza la línea a 5 unidades y recalcula el total

CA-2 --- Cantidad mayor al stock disponible

Dado que un producto tiene 4 unidades en stock

Cuando intento cambiar su cantidad en el carrito a 6

Entonces el sistema no permite el cambio y muestra "Solo hay 4 unidades
disponibles"

CA-3 --- Cantidad en cero

Dado que tengo un producto en el carrito

Cuando cambio su cantidad a 0

Entonces el sistema elimina el producto del carrito (mismo efecto que
HU-021)

Reglas de negocio asociadas

RN-10: No se puede superar el stock disponible (ver HU-019).

Notas y dependencias

Depende de HU-019 (agregar al carrito).

HU-021 --- Eliminar un ítem del carrito

  Campo             Valor
  ----------------- ------------------------------
  Épica             EP-04 --- Carrito de compras
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como cliente quiero eliminar un producto de mi carrito para quitar lo
que ya no quiero comprar.

Criterios de aceptación

CA-1 --- Eliminación exitosa

Dado que tengo un producto en el carrito

Cuando presiono "Eliminar" sobre esa línea

Entonces el sistema quita el producto del carrito y recalcula el total

CA-2 --- Carrito queda vacío

Dado que el producto eliminado era el único en mi carrito

Cuando lo elimino

Entonces el sistema muestra el carrito vacío con un mensaje invitando a
seguir

comprando

CA-3 --- Confirmación antes de eliminar

Dado que presiono "Eliminar" sobre un ítem

Cuando el sistema me pide confirmación

Entonces el producto solo se elimina si confirmo la acción

Reglas de negocio asociadas

Ninguna adicional a las de HU-019.

Notas y dependencias

Depende de HU-019 (agregar al carrito).

HU-022 --- Ver el total del carrito

  Campo             Valor
  ----------------- ------------------------------
  Épica             EP-04 --- Carrito de compras
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Ivan Andres Cortes Olaya
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como cliente quiero ver el total de mi carrito antes de confirmar el
pedido para saber cuánto voy a pagar.

Criterios de aceptación

CA-1 --- Cálculo correcto del total

Dado que tengo varios productos con distintas cantidades en el carrito

Cuando veo el resumen del carrito

Entonces el sistema muestra el subtotal por línea (precio × cantidad) y
el total

general, sumando todas las líneas

CA-2 --- Total actualizado al modificar el carrito

Dado que estoy viendo el total del carrito

Cuando modifico una cantidad (HU-020) o elimino un ítem (HU-021)

Entonces el total se recalcula automáticamente sin recargar la página

CA-3 --- Precio con promoción aplicada

Dado que un producto en el carrito tiene una promoción vigente (HU-014)

Cuando veo el total

Entonces el subtotal de esa línea refleja el precio con descuento

Reglas de negocio asociadas

RN-13: El precio del ítem es el vigente al momento de confirmar el
pedido, no al

agregarlo (ver HU-019).

Notas y dependencias

Depende de HU-019, HU-020 y HU-021.

Precede a HU-026 (confirmar pedido).

HU-023 --- Indicar datos del destinatario y dirección de entrega

  Campo             Valor
  ----------------- ----------------------------------------
  Épica             EP-05 --- Proceso de compra (checkout)
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como cliente quiero indicar el nombre, teléfono y dirección de la
persona que recibirá el pedido

para poder comprar flores como regalo para alguien más, sin que tengan
que ser mis propios datos.

Criterios de aceptación

CA-1 --- Destinatario distinto del comprador

Dado que estoy en el checkout con productos en el carrito

Cuando marco la opción "Es para otra persona" e ingreso nombre, teléfono
y dirección

del destinatario

Entonces el pedido guarda ambos juegos de datos: los del comprador (mi
cuenta) y los

del destinatario, y la entrega se dirige a la dirección indicada

CA-2 --- Destinatario es el mismo comprador

Dado que estoy en el checkout

Cuando dejo marcada la opción "Es para mí"

Entonces el sistema usa mis propios datos de perfil como datos de
entrega, sin

pedirlos de nuevo

CA-3 --- Dirección incompleta

Dado que elegí "Es para otra persona"

Cuando dejo la dirección o el teléfono del destinatario vacíos y avanzo

Entonces el sistema no permite continuar y señala los campos faltantes

CA-4 --- Dirección fuera de cobertura

Dado que ingresé una dirección de entrega

Cuando esa dirección está fuera de la zona de cobertura del negocio

Entonces el sistema me avisa que no hay cobertura para esa zona y no
permite

continuar con esa dirección

Reglas de negocio asociadas

RN-18: Todo pedido guarda de forma independiente los datos del comprador
y los del

destinatario (RN-G2 en 01-definicion-del-proyecto.md).

RN-19: La dirección de entrega debe pertenecer a la zona de cobertura
configurada por el

administrador.

Notas y dependencias

Precede a HU-024 (fecha y franja de entrega) y HU-025 (dedicatoria).

Definir en fase 2 cómo se configura la zona de cobertura (por barrio,
radio, ciudad).

HU-024 --- Elegir fecha y franja horaria de entrega

  Campo             Valor
  ----------------- ----------------------------------------
  Épica             EP-05 --- Proceso de compra (checkout)
  Prioridad         Alta (MVP)
  Estimación        5 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   10 horas

Historia

Como cliente quiero elegir la fecha y la franja horaria en la que debe
llegar mi pedido

para asegurarme de que las flores lleguen a tiempo para la ocasión
(cumpleaños, aniversario, etc.).

Criterios de aceptación

CA-1 --- Selección válida

Dado que estoy en el checkout

Cuando elijo una fecha futura dentro de los días de operación del
negocio y una

franja horaria disponible ese día

Entonces el sistema reserva esa franja para mi pedido y la muestra en el
resumen de

compra

CA-2 --- Fecha pasada o fuera de operación

Dado que estoy seleccionando la fecha de entrega

Cuando elijo una fecha anterior a hoy, o un día en que el negocio no
opera

Entonces el sistema no permite seleccionar esa fecha y muestra las
fechas

disponibles

CA-3 --- Franja llena (capacidad de entregas)

Dado que una franja horaria ya alcanzó el máximo de pedidos que el
negocio puede

entregar

Cuando intento seleccionar esa franja

Entonces el sistema la muestra deshabilitada como "Sin cupo" y me ofrece
otras

franjas disponibles ese mismo día

CA-4 --- Fecha de alta demanda

Dado que la fecha elegida corresponde a una fecha de alta demanda
configurada por el

administrador (por ejemplo, San Valentín)

Cuando consulto las franjas disponibles

Entonces el sistema muestra únicamente las franjas con cupo, respetando
el límite

configurado para esa fecha

Reglas de negocio asociadas

RN-G1: Un pedido siempre debe tener fecha y franja de entrega válidas

RN-20: Cada franja horaria tiene un cupo máximo de pedidos configurado
por el

administrador.

RN-21: El administrador puede definir fechas de alta demanda con cupos
distintos a los

normales.

Notas y dependencias

Depende de HU-023 (dirección de entrega ya definida, para validar
cobertura).

Relacionada con HU-032 (listado de pedidos del administrador) y HU-034
(asignación de

repartidor), que usan la fecha/franja para organizar la operación.

Definir en fase 2 la configuración de días/horarios de operación y de
fechas de alta

demanda.

HU-025 --- Escribir un mensaje de dedicatoria

  Campo             Valor
  ----------------- ----------------------------------------
  Épica             EP-05 --- Proceso de compra (checkout)
  Prioridad         Media
  Estimación        2 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como cliente quiero escribir un mensaje de dedicatoria para el
destinatario para acompañar el arreglo con un mensaje personal.

Criterios de aceptación

CA-1 --- Dedicatoria registrada

Dado que estoy en el checkout

Cuando escribo un mensaje de hasta el límite de caracteres permitido

Entonces el sistema lo guarda junto al pedido y lo muestra en el resumen
antes de

confirmar

CA-2 --- Mensaje que excede el límite

Dado que estoy escribiendo la dedicatoria

Cuando supero el número máximo de caracteres

Entonces el sistema no permite seguir escribiendo y muestra el contador
restante

CA-3 --- Dedicatoria opcional

Dado que estoy en el checkout

Cuando dejo el campo de dedicatoria vacío y confirmo el pedido

Entonces el sistema permite continuar sin dedicatoria

Reglas de negocio asociadas

RN-44: El mensaje de dedicatoria tiene un máximo de 200 caracteres.

Notas y dependencias

Depende de HU-023 (datos del destinatario).

Precede a HU-026 (confirmar pedido).

HU-026 --- Confirmar el pedido

  Campo             Valor
  ----------------- ----------------------------------------
  Épica             EP-05 --- Proceso de compra (checkout)
  Prioridad         Alta (MVP)
  Estimación        5 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   10 horas

Historia

Como cliente quiero confirmar mi pedido después de revisar el resumen
completo para formalizar la compra.

Criterios de aceptación

CA-1 --- Confirmación exitosa

Dado que completé destinatario, dirección, fecha/franja de entrega y
método de pago

Cuando reviso el resumen y presiono "Confirmar pedido"

Entonces el sistema crea el pedido en estado "Confirmado", descuenta el
stock

(HU-038) y me muestra un número de pedido

CA-2 --- Datos incompletos al confirmar

Dado que falta un dato obligatorio (destinatario, dirección o fecha de
entrega)

Cuando intento confirmar el pedido

Entonces el sistema no lo crea y me indica qué falta completar

CA-3 --- Stock insuficiente al confirmar

Dado que tengo 5 unidades de un producto en el carrito y solo quedan 3
disponibles

(porque otro cliente compró primero)

Cuando confirmo el pedido

Entonces el sistema no crea el pedido, me avisa la cantidad real
disponible y me deja

ajustar la cantidad antes de reintentar

CA-4 --- Carrito vacío

Dado que mi carrito no tiene productos

Cuando intento acceder al checkout

Entonces el sistema no me permite continuar y me redirige al catálogo

Reglas de negocio asociadas

RN-G1, RN-G2, RN-G4 (ver 01-definicion-del-proyecto.md).

Notas y dependencias

Depende de HU-022 (total del carrito), HU-023 (destinatario/entrega),
HU-024

(fecha/franja) y HU-027 (método de pago).

Precede a HU-038 (descuento de stock) y HU-029 (historial de pedidos).

HU-027 --- Elegir el método de pago

  Campo             Valor
  ----------------- ----------------------------------------
  Épica             EP-05 --- Proceso de compra (checkout)
  Prioridad         Media
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como cliente quiero elegir el método de pago (pago en línea simulado o
pago (contraentrega)

para pagar como me convenga.

Criterios de aceptación

CA-1 --- Selección de pago en línea (simulado)

Dado que estoy en el checkout

Cuando selecciono "Pago en línea" y el sistema simula el pago exitoso

Entonces el pedido queda marcado como pagado antes de confirmarse

CA-2 --- Selección de pago contraentrega

Dado que estoy en el checkout

Cuando selecciono "Pago contraentrega"

Entonces el pedido se confirma sin pago registrado, y queda marcado como
"Pago

pendiente" hasta la entrega

CA-3 --- Pago simulado rechazado

Dado que estoy en el checkout con pago en línea

Cuando el sistema simula un pago rechazado

Entonces el pedido no se confirma y se me permite reintentar o cambiar
de método

Reglas de negocio asociadas

RN-45: El pago en línea es simulado; no se integra una pasarela de pago
real (ver

alcance en 01-definicion-del-proyecto.md).

Notas y dependencias

Precede a HU-026 (confirmar pedido) y HU-028 (registro de la
transacción).

HU-028 --- Registrar la transacción de pago

  Campo             Valor
  ----------------- ----------------------------------------
  Épica             EP-05 --- Proceso de compra (checkout)
  Prioridad         Media
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como sistema quiero registrar cada transacción de pago asociada a un
pedido para dejar evidencia de cada cobro y que el administrador pueda
auditarlo.

Criterios de aceptación

CA-1 --- Registro de pago exitoso

Dado que un pedido se confirma con pago en línea simulado exitoso

Cuando se crea el pedido

Entonces el sistema registra una transacción con monto, método,
fecha/hora y estado

"Aprobada", asociada a ese pedido

CA-2 --- Registro de pago contraentrega

Dado que un pedido se confirma con pago contraentrega

Cuando se crea el pedido

Entonces el sistema registra una transacción en estado "Pendiente", que
el

administrador podrá marcar como "Cobrada" al momento de la entrega

CA-3 --- Consulta de transacciones

Dado que soy administrador

Cuando consulto el detalle de un pedido

Entonces veo la transacción asociada: monto, método, estado y fecha

Reglas de negocio asociadas

RN-46: Todo pedido tiene al menos una transacción de pago asociada.

Notas y dependencias

Depende de HU-026 (confirmar pedido) y HU-027 (método de pago).

HU-029 --- Ver historial de mis pedidos

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como cliente quiero ver el historial de mis pedidos para hacer
seguimiento a mis compras.

Criterios de aceptación

CA-1 --- Listado de pedidos propios

Dado que he confirmado uno o más pedidos

Cuando entro a "Mis pedidos"

Entonces veo cada pedido con su número, fecha, estado y total, ordenados
del más

reciente al más antiguo

CA-2 --- Sin pedidos

Dado que no he confirmado ningún pedido

Cuando entro a "Mis pedidos"

Entonces el sistema muestra "Aún no tienes pedidos"

CA-3 --- Solo veo mis propios pedidos

Dado que estoy autenticado como cliente

Cuando consulto mi historial

Entonces el sistema muestra únicamente pedidos hechos con mi cuenta,
nunca los de

otro cliente

Reglas de negocio asociadas

Ninguna adicional.

Notas y dependencias

Depende de HU-026 (confirmar pedido).

Precede a HU-030 (detalle de pedido).

HU-030 --- Ver detalle y estado de un pedido

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como cliente quiero ver el detalle y el estado de un pedido específico
para revisar qué compré, para quién y cuándo llega.

Criterios de aceptación

CA-1 --- Detalle completo

Dado que seleccionó uno de mis pedidos

Cuando entro a su detalle

Entonces veo los productos, el destinatario, la dirección, la
fecha/franja de

entrega, la dedicatoria, el total y el estado actual

CA-2 --- Progreso visible del estado

Dado que estoy viendo el detalle de un pedido

Cuando reviso su estado

Entonces el sistema muestra en qué punto del ciclo está (Confirmado, En

preparación, En camino, Entregado o Cancelado)

CA-3 --- Pedido de otro cliente

Dado que intento acceder a la URL del detalle de un pedido que no es mío

Cuando el sistema valida el acceso

Entonces no me permite verlo y muestra un error de acceso no autorizado

Reglas de negocio asociadas

RN-22: Ciclo de estados del pedido (ver HU-033).

Notas y dependencias

Depende de HU-029 (historial de pedidos) y HU-033 (estado del pedido).

HU-031 --- Cancelar un pedido no despachado

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Baja
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como cliente quiero cancelar un pedido que aún no ha sido despachado
para arrepentirme a tiempo si cambié de opinión.

Criterios de aceptación

CA-1 --- Cancelación exitosa

Dado que mi pedido está en estado "Confirmado"

Cuando presiono "Cancelar pedido" y confirmo la acción

Entonces el sistema cambia el estado a "Cancelado" y libera el stock
reservado

(ver RN-23 en HU-033)

CA-2 --- Pedido ya en preparación o despachado

Dado que mi pedido está en estado "En preparación", "En camino" o
"Entregado"

Cuando intento cancelarlo

Entonces el sistema no lo permite y muestra "Este pedido ya no se puede
cancelar;

contacta a la floristería"

CA-3 --- Confirmación antes de cancelar

Dado que presiono "Cancelar pedido"

Cuando el sistema me pide confirmación

Entonces el pedido solo se cancela si confirmo la acción

Reglas de negocio asociadas

RN-22, RN-23 (ver HU-033).

Notas y dependencias

Depende de HU-030 (detalle del pedido) y HU-033 (estados del pedido).

HU-032 --- Ver todos los pedidos (administrador)

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero ver todos los pedidos del negocio para
gestionar la operación del día a día.

Criterios de aceptación

CA-1 --- Listado completo

Dado que existen pedidos confirmados

Cuando entro al panel de pedidos

Entonces veo todos los pedidos con número, cliente, destinatario,
fecha/franja de

entrega, total y estado

CA-2 --- Filtrar por estado

Dado que estoy en el panel de pedidos

Cuando filtro por estado "En preparación"

Entonces el sistema muestra solo los pedidos en ese estado

CA-3 --- Filtrar por fecha de entrega

Dado que estoy en el panel de pedidos

Cuando filtro por una fecha de entrega específica

Entonces el sistema muestra únicamente los pedidos programados para esa
fecha,

útil para organizar el día de reparto

Reglas de negocio asociadas

Ninguna adicional.

Notas y dependencias

Depende de HU-026 (confirmar pedido).

Precede a HU-033 (cambiar estado) y HU-034 (asignar repartidor).

HU-033 --- Cambiar el estado de un pedido

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero cambiar el estado de un pedido (Confirmado, En
preparación, En camino, Entregado, Cancelado)

para informar al cliente el avance de su compra y organizar la operación
del negocio.

Criterios de aceptación

CA-1 --- Cambio de estado válido

Dado que un pedido está en estado "Confirmado"

Cuando el administrador lo marca como "En preparación"

Entonces el sistema actualiza el estado, registra la fecha/hora del
cambio y el

cliente puede verlo reflejado en el detalle de su pedido (HU-030)

CA-2 --- Transición no permitida

Dado que un pedido está en estado "Entregado"

Cuando el administrador intenta cambiarlo a "En preparación"

Entonces el sistema no permite ese cambio, porque no es una transición
válida hacia

atrás en el ciclo del pedido

CA-3 --- Cancelación desde el panel administrativo

Dado que un pedido está en estado "Confirmado" o "En preparación"

Cuando el administrador lo marca como "Cancelado" e ingresa un motivo

Entonces el sistema cambia el estado, libera el stock que había sido
descontado

(HU-038) y guarda el motivo de cancelación

CA-4 --- Pedido ya entregado

Dado que un pedido está en estado "Entregado"

Cuando el administrador intenta cancelarlo

Entonces el sistema no lo permite y muestra el mensaje "No se puede
cancelar un

pedido ya entregado"

Reglas de negocio asociadas

RN-22: Los estados de un pedido siguen un ciclo definido: Confirmado →
En preparación →

En camino → Entregado, con la posibilidad de pasar a Cancelado
únicamente desde Confirmado o En preparación.

RN-23: Cancelar un pedido libera el stock que se había descontado al
confirmarlo.

Notas y dependencias

Depende de HU-026 (confirmación del pedido) y HU-038 (descuento de
stock).

Relacionada con HU-030 (cliente ve el detalle/estado), HU-034
(asignación de repartidor)

y HU-036 (repartidor actualiza el estado de entrega).

Definir en fase 2 la lista final y nombres exactos de los estados
(pendiente de acordar

con el equipo, ver 04-asignacion-equipo.md).

HU-034 --- Asignar un repartidor a un pedido

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero asignar un repartidor disponible a un pedido
en preparación

para coordinar quién hace la entrega en la fecha y franja acordadas con
el cliente.

Criterios de aceptación

CA-1 --- Asignación exitosa

Dado que un pedido está en estado "En preparación" y sin repartidor
asignado

Cuando el administrador selecciona un repartidor de la lista y confirma

Entonces el pedido queda asociado a ese repartidor y aparece en la lista
de pedidos

asignados del repartidor (HU-035)

CA-2 --- Reasignación

Dado que un pedido ya tiene un repartidor asignado y aún no está "En
camino"

Cuando el administrador selecciona otro repartidor

Entonces el sistema reemplaza al repartidor asignado y notifica el
cambio

CA-3 --- Pedido sin preparar

Dado que un pedido está en estado "Confirmado" (aún no preparado)

Cuando el administrador intenta asignar un repartidor

Entonces el sistema no lo permite y muestra el mensaje "El pedido debe
estar en

preparación antes de asignar repartidor"

CA-4 --- Sin repartidores disponibles

Dado que no hay ningún usuario con rol "Repartidor" activo en el sistema

Cuando el administrador intenta asignar uno a un pedido

Entonces el sistema muestra el mensaje "No hay repartidores disponibles"
y no permite

continuar hasta que exista al menos uno (ver HU-006)

Reglas de negocio asociadas

RN-24: Un pedido solo puede asignarse a un repartidor cuando está en
estado

"En preparación" o posterior.

RN-25: Un pedido tiene, como máximo, un repartidor asignado a la vez.

Notas y dependencias

Depende de HU-006 (creación de cuentas de repartidor) y HU-033 (estado
del pedido).

Relacionada con HU-035 y HU-036 (vista y actualización del repartidor).

Definir en fase 2 si la asignación considera zona de cobertura o carga
de trabajo del

repartidor.

HU-035 --- Consultar los pedidos asignados (repartidor)

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como repartidor quiero consultar los pedidos que tengo asignados para
saber qué debo entregar, a quién y en qué dirección.

Criterios de aceptación

CA-1 --- Listado de pedidos asignados

Dado que tengo pedidos asignados para hoy

Cuando entro a mi panel de entregas

Entonces veo cada pedido con destinatario, dirección, franja horaria y
estado

CA-2 --- Sin pedidos asignados

Dado que no tengo pedidos asignados en este momento

Cuando entro a mi panel

Entonces el sistema muestra "No tienes entregas asignadas"

CA-3 --- Solo veo mis pedidos asignados

Dado que hay pedidos asignados a otros repartidores

Cuando consulto mi panel

Entonces el sistema no me muestra pedidos que no me fueron asignados a
mí

Reglas de negocio asociadas

RN-26: Un repartidor solo ve y actualiza los pedidos que tiene asignados
(ver HU-036).

Notas y dependencias

Depende de HU-034 (asignación de repartidor).

Precede a HU-036 (actualizar estado de entrega).

HU-036 --- Actualizar el estado de la entrega

  Campo             Valor
  ----------------- -----------------------------------------
  Épica             EP-06 --- Gestión de pedidos y entregas
  Prioridad         Alta (MVP)
  Estimación        2 puntos
  Responsable       Juan Felipe Cortes Quintero
  Estado            Terminada
  Tiempo estimado   4 horas

Historia

Como repartidor quiero marcar un pedido asignado como "En camino" o
"Entregado" para informar al cliente y al administrador el avance real
de la entrega.

Criterios de aceptación

CA-1 --- Marcar "En camino"

Dado que tengo un pedido asignado en estado "En preparación"

Cuando salgo a repartirlo y lo marco como "En camino"

Entonces el sistema actualiza el estado del pedido y el cliente puede
verlo en el

detalle de su pedido (HU-030)

CA-2 --- Marcar "Entregado"

Dado que tengo un pedido en estado "En camino"

Cuando confirmo la entrega y lo marco como "Entregado"

Entonces el sistema registra la fecha/hora real de entrega y el pedido
queda cerrado

CA-3 --- Intentar actualizar un pedido no asignado a mí

Dado que un pedido está asignado a otro repartidor

Cuando intento cambiar su estado

Entonces el sistema no me permite modificarlo, porque solo puedo
actualizar los

pedidos que tengo asignados

CA-4 --- Entrega fallida

Dado que tengo un pedido en estado "En camino"

Cuando no logro entregarlo (dirección errada, destinatario ausente) y lo
marco como

"No entregado"

Entonces el sistema registra el motivo y notifica al administrador para
que decida

reprogramar o cancelar

Reglas de negocio asociadas

RN-26: Un repartidor solo puede actualizar el estado de los pedidos que
tiene asignados.

RN-27: La fecha/hora real de entrega queda registrada al marcar un
pedido como

"Entregado", además de la fecha/franja que el cliente había solicitado
(HU-024).

Notas y dependencias

Depende de HU-034 (asignación de repartidor).

Relacionada con HU-030 (cliente ve el estado) y HU-033 (estados
administrados por el

administrador).

HU-037 --- Registrar el stock de un producto

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-07 --- Gestión de inventario
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Jorge Steven Gutierre Fierro
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero registrar entradas de stock de un producto
(por ejemplo, al recibir flores del proveedor)

para saber cuánto hay disponible para vender.

Criterios de aceptación

CA-1 --- Registro de entrada exitoso

Dado que un producto tiene 5 unidades en stock

Cuando registro una entrada de 20 unidades con su fecha de ingreso

Entonces el stock disponible queda en 25 y el movimiento queda
registrado con fecha,

cantidad y usuario que lo registró

CA-2 --- Cantidad inválida

Dado que estoy registrando una entrada de stock

Cuando ingreso una cantidad negativa o en cero

Entonces el sistema no permite guardar el movimiento

CA-3 --- Historial de movimientos

Dado que un producto tiene varios movimientos de entrada registrados

Cuándo consultar su historial de inventario

Entonces veo cada movimiento con fecha, cantidad y tipo (entrada, venta,
merma)

Reglas de negocio asociadas

RN-G3: El stock nunca puede quedar en un valor negativo (ver

01-definicion-del-proyecto.md).

Notas y dependencias

Depende de HU-009 (crear producto).

Relacionada con HU-038 (descuento por venta) y HU-040 (merma).

HU-038 --- Descontar stock al confirmar un pedido

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-07 --- Gestión de inventario
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Jorge Steven Gutierre Fierro
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como sistema quiero descontar automáticamente el stock de cada producto
al confirmarse un pedido

para mantener el inventario exacto y evitar vender lo que no hay.

Criterios de aceptación

CA-1 --- Descuento exitoso

Dado que un pedido se confirma con 3 unidades de un producto que tiene
10 en stock

Cuando el pedido pasa a estado "Confirmado"

Entonces el stock del producto queda en 7 y se registra el movimiento de
tipo

"Venta"

CA-2 --- Concurrencia: dos clientes confirman al mismo tiempo

Dado que un producto tiene 2 unidades en stock

Cuando dos clientes intentan confirmar al mismo tiempo un pedido con 2
unidades cada

uno

Entonces el sistema solo permite confirmar al primero que complete la
operación; al

segundo le informa que ya no hay stock suficiente (ver CA-3 de HU-026)

CA-3 --- Liberación de stock al cancelar

Dado que un pedido confirmado se cancela (HU-031 o HU-033)

Cuando el cambio de estado se procesa

Entonces el sistema devuelve al stock disponible las unidades que había
descontado

Reglas de negocio asociadas

RN-G3, RN-G4

RN-23: Cancelar un pedido libera el stock que se había descontado (ver
HU-033).

Notas y dependencias

Depende de HU-026 (confirmar pedido) y HU-037 (stock registrado).

HU-039 --- Ver alertas de stock bajo

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-07 --- Gestión de inventario
  Prioridad         Media
  Estimación        3 puntos
  Responsable       Jorge Steven Gutierre Fierro
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador quiero ver una alerta cuando el stock de un producto
esté por debajo de un umbral mínimo

para reabastecerlo a tiempo y no quedarme sin flores disponibles.

Criterios de aceptación

CA-1 --- Alerta visible

Dado que un producto tiene un stock mínimo configurado de 5 y su stock
actual baja a

3

Cuando el administrador entra al panel de inventario

Entonces ese producto aparece resaltado en una lista de "Stock bajo"

CA-2 --- Producto vuelve a estar por encima del mínimo

Dado que un producto en alerta de stock bajo recibe una entrada de
inventario

(HU-037)

Cuando su stock supera el mínimo configurado

Entonces deja de aparecer en la lista de alertas

CA-3 --- Sin umbral configurado

Dado que un producto no tiene stock mínimo configurado

Cuando su stock baja

Entonces el sistema no genera alerta para ese producto hasta que se
configure un

umbral

Reglas de negocio asociadas

RN-47: El stock mínimo para alertar es configurable por producto; si no
se configura, no

hay alerta.

Notas y dependencias

Depende de HU-037 (stock) y HU-038 (descuento por venta).

HU-040 --- Registrar merma de flores deterioradas o vencidas

  Campo             Valor
  ----------------- ---------------------------------
  Épica             EP-07 --- Gestión de inventario
  Prioridad         Alta (MVP)
  Estimación        3 puntos
  Responsable       Jorge Steven Gutierre Fierro
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como empleado quiero registrar como merma las flores que se deterioraron
o vencieron

para que el inventario refleje solo lo que realmente se puede vender.

Criterios de aceptación

CA-1 --- Registro de merma exitoso

Dado que un producto tiene 10 unidades en stock

Cuando registro 3 unidades como merma indicando el motivo (deterioro,
vencimiento,

daño en manipulación)

Entonces el stock disponible del producto queda en 7, y la merma queda
registrada

con fecha, cantidad, motivo y el empleado que la registró

CA-2 --- Cantidad mayor al stock disponible

Dado que un producto tiene 4 unidades en stock

Cuando intento registrar 5 unidades como merma

Entonces el sistema no permite el registro y muestra "Sólo hay 4
unidades

disponibles para dar de baja"

CA-3 --- Motivo obligatorio

Dado que estoy registrando una merma

Cuando no seleccionó un motivo

Entonces el sistema no permite guardar el registro

CA-4 --- Alerta por vida útil vencida

Dado que un producto superó su vida útil estimada (HU-009) sin haberse
vendido ni

registrado como merma

Cuando el empleado o el administrador consulta el inventario

Entonces el sistema resalta ese producto como "Vida útil vencida ---
revisar"

Reglas de negocio asociadas

RN-G5: Todo producto marcado como merma se descuenta del stock
disponible y queda

registrado con fecha y motivo (ver 01-definicion-del-proyecto.md).

RN-28: La cantidad registrada como merma no puede superar el stock
disponible del

product.

RN-29: La merma es un movimiento de inventario distinto a una venta; no
genera ingreso

ni se asocia a un pedido.

Notas y dependencias

Depende de HU-009 (vida útil del producto) y HU-037 (stock registrado).

Alimenta el reporte de inventario/merma que el administrador puede
revisar en la fase

de reportes (EP-08).

HU-041 --- Ver el reporte de ventas por período

  Campo             Valor
  ----------------- -----------------------------------
  Épica             EP-08 --- Reportes y estadísticas
  Prioridad         Media
  Estimación        5 puntos
  Responsable       Jorge Steven Gutierre Fierro
  Estado            Terminada
  Tiempo estimado   10 horas

Historia

Como administrador

quiero ver el total de ventas en un rango de fechas

para conocer el desempeño del negocio.

Criterios de aceptación

CA-1 --- Reporte con ventas en el rango

Dado que existen pedidos entregados en el rango de fechas seleccionado

Cuando genero el reporte

Entonces el sistema muestra el número de pedidos, el total vendido y el
total por

día dentro de ese rango

CA-2 --- Rango sin ventas

Dado que no hay pedidos entregados en el rango seleccionado

Cuando genero el reporte

Entonces el sistema muestra "No hay ventas registradas en este período"

CA-3 --- Rango de fechas inválido

Dado que selecciono una fecha inicial posterior a la fecha final

Cuando intento generar el reporte

Entonces el sistema muestra un error y no genera el reporte

CA-4 --- Solo se cuentan pedidos entregados

Dado que hay pedidos cancelados o aún no entregados dentro del rango

Cuando se genera el reporte

Entonces esos pedidos no se incluyen en el total de ventas

Reglas de negocio asociadas

RN-48: El reporte de ventas solo contabiliza pedidos en estado
"Entregado".

Notas y dependencias

Depende de HU-033 (estados del pedido).

HU-042 --- Ver los productos más vendidos

  Campo             Valor
  ----------------- -----------------------------------
  Épica             EP-08 --- Reportes y estadísticas
  Prioridad         Baja
  Estimación        3 puntos
  Responsable       Jorge Steven Gutierre Fierro
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador

quiero ver un ranking de los productos más vendidos en un período

para decidir qué reabastecer con prioridad.

Criterios de aceptación

CA-1 --- Ranking con ventas

Dado que existen pedidos entregados en el período seleccionado

Cuando genero el reporte

Entonces el sistema muestra los productos ordenados de mayor a menor
cantidad

vendida, con el total de unidades de cada uno

CA-2 --- Sin ventas en el período

Dado que no hay pedidos entregados en el período seleccionado

Cuando genero el reporte

Entonces el sistema muestra "No hay datos suficientes para este período"

CA-3 --- Empate entre productos

Dado que dos productos tienen la misma cantidad vendida

Cuando se genera el ranking

Entonces ambos aparecen en la misma posición, ordenados alfabéticamente
entre sí

Reglas de negocio asociadas

RN-48: Solo se contabilizan pedidos en estado "Entregado" (ver HU-041).

Notas y dependencias

Depende de HU-041 (reporte de ventas).

HU-043 --- Ver el reporte de pedidos por estado

  Campo             Valor
  ----------------- -----------------------------------
  Épica             EP-08 --- Reportes y estadísticas
  Prioridad         Baja
  Estimación        3 puntos
  Responsable       Jorge Steven Gutierre Fierro
  Estado            Terminada
  Tiempo estimado   6 horas

Historia

Como administrador

quiero ver cuántos pedidos hay en cada estado (Confirmado, En
preparación, En camino, Entregado, Cancelado)

para identificar cuellos de botella en la operación (por ejemplo,
pedidos acumulados sin preparar).

Criterios de aceptación

CA-1 --- Conteo por estado

Dado que existen pedidos en distintos estados

Cuando genero el reporte

Entonces el sistema muestra la cantidad de pedidos agrupados por cada
estado

CA-2 --- Filtrar por rango de fechas

Dado que estoy en el reporte de pedidos por estado

Cuando aplico un rango de fechas de entrega

Entonces el conteo se recalcula considerando solo los pedidos de ese
rango

CA-3 --- Sin pedidos

Dado que no hay pedidos registrados en el rango seleccionado

Cuando genero el reporte

Entonces el sistema muestra el conteo en cero para todos los estados

Reglas de negocio asociadas

RN-22: Ciclo de estados del pedido (ver HU-033).

Notas y dependencias

Depende de HU-033 (estados del pedido).

# 10. Cierre formal de la Fase 1

Con base en la revisión del backlog, las épicas y las 43 historias de
usuario, se establece el cierre documental de la Fase 1. Las historias
cuentan con formato Como... Quiero... Para..., criterios de aceptación
en Gherkin, reglas de negocio, prioridad, estimación en Story Points,
responsable y estado. El flujo de trabajo mediante ramas y Pull Requests
se mantiene como mecanismo de revisión.

Resultados del cierre

✓ 43 historias de usuario organizadas en 8 épicas.

✓ 27 historias priorizadas como Alta (MVP).

✓ 11 historias priorizadas como Media.

✓ 5 historias priorizadas como Baja.

✓ Responsable asignado a cada épica y a cada historia.

✓ Estado actualizado para reflejar el cierre documental de la Fase 1.

✓ Estimación temporal inicial incorporada a cada historia.

# 11. Velocity del equipo y planificación futura

Al encontrarse en la Fase 1, el equipo todavía no dispone de una
velocidad histórica de sprints documentada. La velocidad se registrará a
partir del primer sprint ejecutado y se calculará con los Story Points
de las historias realmente terminadas. Para futuras estimaciones se
utilizará el promedio de los sprints anteriores como referencia de
capacidad.

  Sprint     Puntos planificados   Puntos terminados   Velocity
  ---------- --------------------- ------------------- --------------
  Sprint 1   Por registrar         Por registrar       Por calcular
  Sprint 2   Por registrar         Por registrar       Por calcular
  Sprint 3   Por registrar         Por registrar       Por calcular

Registro recomendado: Velocity del sprint = Story Points terminados
durante el sprint. Después de varios sprints, la capacidad futura se
estimará tomando como referencia el promedio de las velocidades
obtenidas.
