-- =============================================================================
-- Fase 4 — Modelo fisico / DDL
-- Proyecto : Sistema de tienda virtual para floristeria
-- Motor    : MySQL 8.0.16 o superior (se requiere soporte de CHECK constraints)
-- Autor    : Roman Alberto Bolanos Cerquera
-- Insumos  : modelo conceptual (Ivan) y modelo logico normalizado (Juan),
--            requerimientos de la Fase 2 (RF/RN) y diagrama de clases de la Fase 3
--
-- Convenciones
--   * Identificadores en minusculas, snake_case, singular y sin tildes ni enie
--     (CONTRIBUTING.md). Por eso RECUPERACION_CONTRASENA pierde la enie logica.
--   * Toda tabla declara clave primaria; toda FK declara ON DELETE y ON UPDATE.
--   * Cada restriccion referencia el RF o RN que la origina.
--   * Collation por defecto utf8mb4_0900_ai_ci: comparaciones que ignoran
--     mayusculas y tildes. Sostiene RF-015 (buscar sin distinguir mayusculas ni
--     tildes) y RN-01/RN-33 (correo unico aunque cambie de caja).
--   * Tokens y hashes usan ascii_bin: ahi la comparacion SI debe ser exacta.
-- =============================================================================

-- Para reejecutar desde cero, descomentar la linea siguiente. BORRA TODO.
-- DROP DATABASE IF EXISTS floristeria_db;

CREATE DATABASE IF NOT EXISTS floristeria_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE floristeria_db;

-- =============================================================================
-- 1. USUARIOS Y AUTENTICACION  (componente de Ivan y Juan)
-- =============================================================================

-- ROL — catalogo de funciones. RF-006, RN-G6.
CREATE TABLE rol (
  id_rol       TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre       VARCHAR(30)      NOT NULL,
  descripcion  VARCHAR(150)         NULL,
  CONSTRAINT pk_rol PRIMARY KEY (id_rol),
  -- Clave candidata: impide duplicar el mismo rol en el catalogo.
  CONSTRAINT uq_rol_nombre UNIQUE (nombre),
  CONSTRAINT ck_rol_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0)
) ENGINE = InnoDB;

-- USUARIO — una fila por cuenta registrada. RF-001 a RF-006.
CREATE TABLE usuario (
  id_usuario         BIGINT UNSIGNED  NOT NULL AUTO_INCREMENT,
  nombre             VARCHAR(120)     NOT NULL,
  -- RN-01 y RN-33: correo unico, tambien al editar el perfil. La collation
  -- ai_ci hace que el UNIQUE atrape 'Ana@x.com' y 'ana@x.com' como el mismo.
  correo             VARCHAR(180)     NOT NULL,
  -- RN-04: solo el hash adaptativo con sal. 255 admite bcrypt (60) y argon2id.
  -- ascii_bin porque el hash debe compararse byte a byte.
  contrasena_hash    VARCHAR(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  estado             ENUM('ACTIVO','DESACTIVADO','BLOQUEADO') NOT NULL DEFAULT 'ACTIVO',
  -- RN-31: a los 5 intentos fallidos consecutivos se bloquea temporalmente.
  intentos_fallidos  TINYINT UNSIGNED NOT NULL DEFAULT 0,
  bloqueado_hasta    DATETIME             NULL,
  fecha_registro     DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
  CONSTRAINT uq_usuario_correo UNIQUE (correo),
  CONSTRAINT ck_usuario_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),
  -- Sanidad minima del correo; la validacion completa es de la aplicacion.
  CONSTRAINT ck_usuario_correo_formato CHECK (correo LIKE '%_@_%._%'),
  -- No se acota por arriba a 5 a proposito: el umbral de RN-31 es logica de
  -- aplicacion, y un CHECK en 5 haria fallar el UPDATE si el intento que
  -- dispara el bloqueo se registra antes de evaluar el umbral. El tipo
  -- UNSIGNED ya impide valores negativos.
  -- bloqueado_hasta solo tiene sentido mientras la cuenta esta bloqueada.
  CONSTRAINT ck_usuario_bloqueo CHECK (
    bloqueado_hasta IS NULL OR estado = 'BLOQUEADO'
  )
) ENGINE = InnoDB;

-- USUARIO_ROL — resuelve el N:M. RN-G6, RF-006.
CREATE TABLE usuario_rol (
  id_usuario  BIGINT UNSIGNED  NOT NULL,
  id_rol      TINYINT UNSIGNED NOT NULL,
  -- La PK compuesta impide asignar dos veces el mismo rol a una cuenta.
  CONSTRAINT pk_usuario_rol PRIMARY KEY (id_usuario, id_rol),
  -- Si se borra la cuenta, sus asignaciones no tienen razon de existir.
  CONSTRAINT fk_usuario_rol_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
  -- Un rol en uso no se puede borrar: primero hay que reasignar las cuentas.
  CONSTRAINT fk_usuario_rol_rol FOREIGN KEY (id_rol)
    REFERENCES rol (id_rol) ON DELETE RESTRICT ON UPDATE CASCADE,
  INDEX ix_usuario_rol_rol (id_rol)
) ENGINE = InnoDB;

-- RECUPERACION_CONTRASENA — RF-005, RN-34 (30 min), RN-35 (un solo uso).
CREATE TABLE recuperacion_contrasena (
  id_recuperacion   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario        BIGINT UNSIGNED NOT NULL,
  -- Se guarda el hash del token (64 hex de SHA-256), no el token en claro:
  -- si alguien lee la tabla no puede reutilizar el enlace. ascii_bin para
  -- que la comparacion sea exacta.
  token             CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  fecha_generacion  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_expiracion  DATETIME        NOT NULL,
  utilizado         BOOLEAN         NOT NULL DEFAULT FALSE,
  CONSTRAINT pk_recuperacion PRIMARY KEY (id_recuperacion),
  CONSTRAINT uq_recuperacion_token UNIQUE (token),
  CONSTRAINT fk_recuperacion_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ck_recuperacion_vigencia CHECK (fecha_expiracion > fecha_generacion),
  -- Busqueda de la solicitud vigente de un usuario.
  INDEX ix_recuperacion_usuario_vigencia (id_usuario, fecha_expiracion)
) ENGINE = InnoDB;

-- =============================================================================
-- 2. CATALOGO  (grupo de analisis de Juan)
-- =============================================================================

-- CATEGORIA — RF-012, RN-17 / RN-40 (nombre unico).
CREATE TABLE categoria (
  id_categoria  SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre        VARCHAR(60)       NOT NULL,
  estado        ENUM('ACTIVA','INACTIVA') NOT NULL DEFAULT 'ACTIVA',
  CONSTRAINT pk_categoria PRIMARY KEY (id_categoria),
  CONSTRAINT uq_categoria_nombre UNIQUE (nombre),
  CONSTRAINT ck_categoria_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0)
) ENGINE = InnoDB;

-- OCASION — RF-012, RF-016.
CREATE TABLE ocasion (
  id_ocasion  SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre      VARCHAR(60)       NOT NULL,
  estado      ENUM('ACTIVA','INACTIVA') NOT NULL DEFAULT 'ACTIVA',
  CONSTRAINT pk_ocasion PRIMARY KEY (id_ocasion),
  CONSTRAINT uq_ocasion_nombre UNIQUE (nombre),
  CONSTRAINT ck_ocasion_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0)
) ENGINE = InnoDB;

-- PRODUCTO — RF-007 a RF-011. Reglas de precio y stock: RN-09, RN-G3, RN-10.
CREATE TABLE producto (
  id_producto              BIGINT UNSIGNED   NOT NULL AUTO_INCREMENT,
  id_categoria             SMALLINT UNSIGNED NOT NULL,
  nombre                   VARCHAR(150)      NOT NULL,
  descripcion              VARCHAR(1000)     NOT NULL,
  -- DECIMAL y no FLOAT: el dinero no admite error de redondeo binario.
  precio                   DECIMAL(12,2)     NOT NULL,
  -- RN-15 / RN-38: este valor solo debe moverse via movimiento_inventario.
  stock_actual             INT               NOT NULL DEFAULT 0,
  -- RN-47: configurable por producto; NULL significa "no alertar".
  umbral_stock_minimo      INT                   NULL,
  fecha_ingreso            DATE              NOT NULL,   -- RN-08
  vida_util_estimada_dias  SMALLINT UNSIGNED     NULL,   -- RN-14
  estado                   ENUM('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  CONSTRAINT pk_producto PRIMARY KEY (id_producto),
  -- RN-16 / RN-39: desactivar no borra. Por eso RESTRICT y no CASCADE.
  CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_producto_precio CHECK (precio > 0),                    -- RN-09
  CONSTRAINT ck_producto_stock CHECK (stock_actual >= 0),              -- RN-G3
  CONSTRAINT ck_producto_umbral CHECK (umbral_stock_minimo IS NULL OR umbral_stock_minimo >= 0),
  CONSTRAINT ck_producto_vida_util CHECK (vida_util_estimada_dias IS NULL OR vida_util_estimada_dias > 0),
  CONSTRAINT ck_producto_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),
  -- RF-007 / RN-07 / RN-20: el catalogo publico filtra por estado y categoria.
  INDEX ix_producto_estado_categoria (estado, id_categoria),
  -- RF-015: busqueda por nombre (la collation ai_ci ignora caja y tildes).
  INDEX ix_producto_nombre (nombre),
  -- RF-017: filtro por rango de precio sobre productos activos.
  INDEX ix_producto_estado_precio (estado, precio)
) ENGINE = InnoDB;

-- PRODUCTO_OCASION — N:M "aplica a". RF-016.
CREATE TABLE producto_ocasion (
  id_producto  BIGINT UNSIGNED   NOT NULL,
  id_ocasion   SMALLINT UNSIGNED NOT NULL,
  CONSTRAINT pk_producto_ocasion PRIMARY KEY (id_producto, id_ocasion),
  CONSTRAINT fk_producto_ocasion_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_producto_ocasion_ocasion FOREIGN KEY (id_ocasion)
    REFERENCES ocasion (id_ocasion) ON DELETE RESTRICT ON UPDATE CASCADE,
  INDEX ix_producto_ocasion_ocasion (id_ocasion)
) ENGINE = InnoDB;

-- PROMOCION — RF-014.
CREATE TABLE promocion (
  id_promocion          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  descripcion           VARCHAR(255)    NOT NULL,
  porcentaje_descuento  DECIMAL(5,2)    NOT NULL,
  fecha_inicio          DATE            NOT NULL,
  fecha_fin             DATE            NOT NULL,
  estado                ENUM('ACTIVA','FINALIZADA') NOT NULL DEFAULT 'ACTIVA',
  CONSTRAINT pk_promocion PRIMARY KEY (id_promocion),
  CONSTRAINT ck_promocion_porcentaje CHECK (porcentaje_descuento > 0 AND porcentaje_descuento <= 100),
  CONSTRAINT ck_promocion_vigencia CHECK (fecha_fin >= fecha_inicio),
  INDEX ix_promocion_vigencia (estado, fecha_inicio, fecha_fin)
) ENGINE = InnoDB;

-- PROMOCION_PRODUCTO — N:M "promociona". RF-014.
-- OJO: RN-19 / RN-42 ("un producto solo puede tener una promocion activa a la
-- vez") NO se puede expresar con un UNIQUE, porque depende del solapamiento de
-- rangos de fechas. Queda como validacion de aplicacion o trigger; ver
-- modelo-fisico.md, seccion "Reglas que no son declarativas".
CREATE TABLE promocion_producto (
  id_promocion  BIGINT UNSIGNED NOT NULL,
  id_producto   BIGINT UNSIGNED NOT NULL,
  CONSTRAINT pk_promocion_producto PRIMARY KEY (id_promocion, id_producto),
  CONSTRAINT fk_promocion_producto_promocion FOREIGN KEY (id_promocion)
    REFERENCES promocion (id_promocion) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_promocion_producto_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX ix_promocion_producto_producto (id_producto)
) ENGINE = InnoDB;

-- SOLICITUD_ARREGLO_PERSONALIZADO — RF-013, RN-18 / RN-41.
CREATE TABLE solicitud_arreglo_personalizado (
  id_solicitud     BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario       BIGINT UNSIGNED NOT NULL,
  descripcion      VARCHAR(1000)   NOT NULL,
  fecha_solicitud  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  precio_cotizado  DECIMAL(12,2)       NULL,
  estado           ENUM('PENDIENTE','COTIZADA','RECHAZADA') NOT NULL DEFAULT 'PENDIENTE',
  CONSTRAINT pk_solicitud_arreglo PRIMARY KEY (id_solicitud),
  -- Se conserva el historial de solicitudes: no se borra en cascada.
  CONSTRAINT fk_solicitud_arreglo_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_solicitud_descripcion CHECK (CHAR_LENGTH(TRIM(descripcion)) > 0),
  CONSTRAINT ck_solicitud_precio CHECK (precio_cotizado IS NULL OR precio_cotizado > 0),
  -- RN-18: mientras esta PENDIENTE no puede tener precio, y si esta COTIZADA
  -- el precio es obligatorio. RECHAZADA queda libre: si se rechaza una
  -- solicitud ya cotizada, se conserva el precio que se alcanzo a ofrecer.
  CONSTRAINT ck_solicitud_cotizacion CHECK (
    (estado = 'PENDIENTE' AND precio_cotizado IS NULL) OR
    (estado = 'COTIZADA' AND precio_cotizado IS NOT NULL) OR
    (estado = 'RECHAZADA')
  ),
  INDEX ix_solicitud_arreglo_usuario (id_usuario, fecha_solicitud)
) ENGINE = InnoDB;

-- =============================================================================
-- 3. CARRITO  (grupo de analisis de Roman)
-- =============================================================================

-- CARRITO — RF-019 a RF-022. Relacion "posee 0..1" con usuario.
CREATE TABLE carrito (
  id_carrito      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario      BIGINT UNSIGNED NOT NULL,
  fecha_creacion  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_carrito PRIMARY KEY (id_carrito),
  -- El UNIQUE materializa el 0..1 del diagrama de clases: un carrito por cuenta.
  CONSTRAINT uq_carrito_usuario UNIQUE (id_usuario),
  CONSTRAINT fk_carrito_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- ITEM_CARRITO — RF-019 a RF-021, RN-11.
-- No guarda precio: RN-12 y RN-13 mandan que el precio que cuenta es el
-- vigente al confirmar el pedido, y ese se congela en item_pedido.
CREATE TABLE item_carrito (
  id_item_carrito  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_carrito       BIGINT UNSIGNED NOT NULL,
  id_producto      BIGINT UNSIGNED NOT NULL,
  cantidad         INT             NOT NULL,
  CONSTRAINT pk_item_carrito PRIMARY KEY (id_item_carrito),
  -- Un producto aparece una sola vez por carrito; repetirlo es sumar cantidad.
  CONSTRAINT uq_item_carrito_producto UNIQUE (id_carrito, id_producto),
  CONSTRAINT fk_item_carrito_carrito FOREIGN KEY (id_carrito)
    REFERENCES carrito (id_carrito) ON DELETE CASCADE ON UPDATE CASCADE,
  -- Los productos se desactivan, no se borran (RN-16): RESTRICT.
  CONSTRAINT fk_item_carrito_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_item_carrito_cantidad CHECK (cantidad >= 1),           -- RN-11
  INDEX ix_item_carrito_producto (id_producto)
) ENGINE = InnoDB;

-- =============================================================================
-- 4. ENTREGA  (grupo de analisis de Stiven)
-- =============================================================================

-- ZONA_COBERTURA — RN-23, RF-023.
CREATE TABLE zona_cobertura (
  id_zona            SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre             VARCHAR(80)       NOT NULL,
  detalle_cobertura  VARCHAR(500)          NULL,
  estado             ENUM('ACTIVA','INACTIVA') NOT NULL DEFAULT 'ACTIVA',
  CONSTRAINT pk_zona_cobertura PRIMARY KEY (id_zona),
  CONSTRAINT uq_zona_nombre UNIQUE (nombre),
  CONSTRAINT ck_zona_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0)
) ENGINE = InnoDB;

-- FRANJA_HORARIA — RF-024, RN-24 (cupo maximo), RN-25 (alta demanda).
CREATE TABLE franja_horaria (
  id_franja         BIGINT UNSIGNED   NOT NULL AUTO_INCREMENT,
  fecha             DATE              NOT NULL,
  hora_inicio       TIME              NOT NULL,
  hora_fin          TIME              NOT NULL,
  cupo_maximo       SMALLINT UNSIGNED NOT NULL,
  cupo_utilizado    SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  es_alta_demanda   BOOLEAN           NOT NULL DEFAULT FALSE,  -- RN-25
  CONSTRAINT pk_franja_horaria PRIMARY KEY (id_franja),
  -- No se puede configurar dos veces la misma franja del mismo dia.
  CONSTRAINT uq_franja_fecha_horas UNIQUE (fecha, hora_inicio, hora_fin),
  CONSTRAINT ck_franja_horas CHECK (hora_fin > hora_inicio),
  CONSTRAINT ck_franja_cupo_maximo CHECK (cupo_maximo > 0),
  -- RN-24: el cupo utilizado no puede pasarse del maximo configurado.
  CONSTRAINT ck_franja_cupo_utilizado CHECK (cupo_utilizado <= cupo_maximo),
  INDEX ix_franja_fecha (fecha)
) ENGINE = InnoDB;

-- PEDIDO — RF-023 a RF-036. Estados segun RN-29.
-- La direccion de entrega vive en su propia tabla (modelo logico de Ivan y
-- Juan), no como texto plano dentro del pedido.
CREATE TABLE pedido (
  id_pedido              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_comprador           BIGINT UNSIGNED NOT NULL,
  -- RF-034: se asigna despues, y puede quedar sin asignar.
  id_repartidor          BIGINT UNSIGNED     NULL,
  -- RN-G1: fecha y franja validas. La fecha vive en franja_horaria; no se
  -- repite aqui para no introducir una dependencia transitiva (3FN).
  id_franja              BIGINT UNSIGNED NOT NULL,
  -- RN-22 y RN-G2: el pedido conserva los datos del destinatario aunque sea
  -- una persona distinta del comprador.
  destinatario_nombre    VARCHAR(120)    NOT NULL,
  destinatario_telefono  VARCHAR(20)     NOT NULL,
  -- RN-26 / RN-44: maximo 200 caracteres, garantizado por el tipo.
  mensaje_dedicatoria    VARCHAR(200)        NULL,
  estado                 ENUM('CONFIRMADO','EN_PREPARACION','EN_CAMINO','ENTREGADO','CANCELADO')
                                         NOT NULL DEFAULT 'CONFIRMADO',
  total                  DECIMAL(12,2)   NOT NULL,
  fecha_creacion         DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
  -- Nunca se borra un pedido por borrar una cuenta: es historia de ventas.
  CONSTRAINT fk_pedido_comprador FOREIGN KEY (id_comprador)
    REFERENCES usuario (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
  -- Si se da de baja al repartidor, el pedido queda sin asignar, no se borra.
  CONSTRAINT fk_pedido_repartidor FOREIGN KEY (id_repartidor)
    REFERENCES usuario (id_usuario) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_pedido_franja FOREIGN KEY (id_franja)
    REFERENCES franja_horaria (id_franja) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_pedido_total CHECK (total >= 0),
  CONSTRAINT ck_pedido_destinatario CHECK (CHAR_LENGTH(TRIM(destinatario_nombre)) > 0),
  -- RF-032: el administrador filtra por estado y fecha.
  INDEX ix_pedido_estado_fecha (estado, fecha_creacion),
  -- RF-029: historial del cliente.
  INDEX ix_pedido_comprador (id_comprador, fecha_creacion),
  -- RF-035: el repartidor ve solo los suyos.
  INDEX ix_pedido_repartidor (id_repartidor, estado),
  INDEX ix_pedido_franja (id_franja)
) ENGINE = InnoDB;

-- DIRECCION_ENTREGA — RF-023, RN-23. Relacion 1:1 con pedido.
CREATE TABLE direccion_entrega (
  id_direccion_entrega  BIGINT UNSIGNED   NOT NULL AUTO_INCREMENT,
  id_pedido             BIGINT UNSIGNED   NOT NULL,
  id_zona               SMALLINT UNSIGNED NOT NULL,
  direccion             VARCHAR(200)      NOT NULL,
  barrio                VARCHAR(100)      NOT NULL,
  ciudad                VARCHAR(100)      NOT NULL,
  referencia            VARCHAR(255)          NULL,
  CONSTRAINT pk_direccion_entrega PRIMARY KEY (id_direccion_entrega),
  -- El UNIQUE es lo que convierte el 1:N en el 1:1 del modelo logico.
  CONSTRAINT uq_direccion_pedido UNIQUE (id_pedido),
  -- La direccion es parte de la foto del pedido: si el pedido se va, se va con el.
  CONSTRAINT fk_direccion_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
  -- RN-23: no se borra una zona que respalda direcciones ya entregadas.
  CONSTRAINT fk_direccion_zona FOREIGN KEY (id_zona)
    REFERENCES zona_cobertura (id_zona) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_direccion_no_vacia CHECK (CHAR_LENGTH(TRIM(direccion)) > 0),
  INDEX ix_direccion_zona (id_zona)
) ENGINE = InnoDB;

-- ITEM_PEDIDO — RF-026, RN-13 (precio congelado al confirmar).
CREATE TABLE item_pedido (
  id_item_pedido            BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_pedido                 BIGINT UNSIGNED NOT NULL,
  id_producto               BIGINT UNSIGNED NOT NULL,
  cantidad                  INT             NOT NULL,
  -- RN-13: copia del precio al confirmar. Si el producto cambia de precio
  -- manana, el pedido de hoy conserva el suyo.
  precio_unitario_vigente   DECIMAL(12,2)   NOT NULL,
  CONSTRAINT pk_item_pedido PRIMARY KEY (id_item_pedido),
  CONSTRAINT uq_item_pedido_producto UNIQUE (id_pedido, id_producto),
  CONSTRAINT fk_item_pedido_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
  -- RF-042 (ranking de mas vendidos) necesita que el producto siga existiendo.
  CONSTRAINT fk_item_pedido_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_item_pedido_cantidad CHECK (cantidad >= 1),
  CONSTRAINT ck_item_pedido_precio CHECK (precio_unitario_vigente > 0),
  INDEX ix_item_pedido_producto (id_producto)
) ENGINE = InnoDB;

-- TRANSACCION — RF-027, RF-028. Pago simulado (RN-27 / RN-45).
CREATE TABLE transaccion (
  id_transaccion  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_pedido       BIGINT UNSIGNED NOT NULL,
  monto           DECIMAL(12,2)   NOT NULL,
  metodo_pago     ENUM('TARJETA','TRANSFERENCIA','CONTRAENTREGA') NOT NULL,
  fecha_hora      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado          ENUM('APROBADA','RECHAZADA') NOT NULL,
  CONSTRAINT pk_transaccion PRIMARY KEY (id_transaccion),
  CONSTRAINT fk_transaccion_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ck_transaccion_monto CHECK (monto > 0),
  INDEX ix_transaccion_pedido (id_pedido, fecha_hora)
) ENGINE = InnoDB;

-- =============================================================================
-- 5. INVENTARIO  (grupo de analisis de Roman)
-- =============================================================================

-- MOVIMIENTO_INVENTARIO — RF-037 a RF-040.
-- Es la unica via legitima para mover producto.stock_actual (RN-15 / RN-38) y
-- el registro que sobrevive a la desactivacion del producto (RN-16 / RN-39).
CREATE TABLE movimiento_inventario (
  id_movimiento  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_producto    BIGINT UNSIGNED NOT NULL,
  -- Quien registro el movimiento (empleado o administrador). RF-037, RF-040.
  id_usuario     BIGINT UNSIGNED NOT NULL,
  -- Trazabilidad de la salida por venta: RF-038 descuenta al confirmar.
  -- NULL en entradas y mermas, que no nacen de un pedido.
  id_pedido      BIGINT UNSIGNED     NULL,
  tipo           ENUM('ENTRADA','VENTA','MERMA') NOT NULL,
  -- Siempre positiva: el signo lo da el tipo, no el numero.
  cantidad       INT             NOT NULL,
  fecha          DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  motivo         VARCHAR(255)        NULL,
  CONSTRAINT pk_movimiento PRIMARY KEY (id_movimiento),
  -- RN-16 / RN-39: el historial de inventario no se borra nunca en cascada.
  CONSTRAINT fk_movimiento_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_movimiento_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
  -- Unica FK con ON UPDATE RESTRICT en lugar de CASCADE, y es obligatorio:
  -- MySQL 8 (error 3823) prohibe usar una columna en un CHECK si tiene una
  -- accion referencial que la modifica. Como id_pedido participa en
  -- ck_movimiento_pedido_solo_venta, su FK no puede declarar CASCADE.
  -- No se pierde nada: id_pedido es una clave artificial que nunca cambia.
  CONSTRAINT fk_movimiento_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT ck_movimiento_cantidad CHECK (cantidad > 0),
  -- RN-G5: la merma queda registrada con fecha y motivo.
  CONSTRAINT ck_movimiento_motivo_merma CHECK (
    tipo <> 'MERMA' OR (motivo IS NOT NULL AND CHAR_LENGTH(TRIM(motivo)) > 0)
  ),
  -- Solo la salida por VENTA se origina en un pedido.
  CONSTRAINT ck_movimiento_pedido_solo_venta CHECK (
    (tipo = 'VENTA') OR (id_pedido IS NULL)
  ),
  -- RF-037: consultar los movimientos de stock por producto.
  INDEX ix_movimiento_producto_fecha (id_producto, fecha),
  INDEX ix_movimiento_tipo_fecha (tipo, fecha),
  INDEX ix_movimiento_usuario (id_usuario),
  INDEX ix_movimiento_pedido (id_pedido)
) ENGINE = InnoDB;

-- =============================================================================
-- Fin del DDL. 20 tablas.
-- Las reglas que no se pueden declarar aqui (RN-19/RN-42 promocion activa
-- unica, RN-28/RN-46 todo pedido con al menos una transaccion, RN-29 ciclo de
-- estados, RN-G4/RN-38 descuento de stock al confirmar) estan listadas en
-- modelos/modelo-fisico.md con la via de implementacion propuesta.
-- =============================================================================
