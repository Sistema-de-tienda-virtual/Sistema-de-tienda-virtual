-- =============================================================================
-- Fase 4 — Modelo fisico / DDL
-- Proyecto : Sistema de tienda virtual para floristeria
-- Motor    : MySQL 8.0.16 o superior (se requiere soporte de CHECK constraints)
-- Autor    : Roman Alberto Bolanos Cerquera
-- Insumo   : modelos/modelo-integrado.md (aportes de Ivan, Juan, Steven y Roman),
--            requerimientos de la Fase 2 (RF/RN)
--
-- Solo crea la estructura: este script no inserta datos.
--
-- Convenciones
--   * Identificadores en minusculas, snake_case, singular y sin tildes ni enie
--     (CONTRIBUTING.md). Por eso RECUPERACION_CONTRASEÑA pasa a
--     recuperacion_contrasena.
--   * Las 20 tablas y sus atributos son los del modelo integrado. Lo que el
--     modelo fisico cambia o agrega esta en modelo-fisico.md, seccion 12.
--   * Toda tabla declara clave primaria; toda FK declara ON DELETE y ON UPDATE,
--     segun la seccion 9 del modelo integrado.
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
-- 1. USUARIOS Y SEGURIDAD  (aporte de Ivan)
-- =============================================================================

-- ROL — catalogo de funciones. RF-006, RN-G6.
CREATE TABLE rol (
  id_rol       TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre       VARCHAR(30)      NOT NULL,
  descripcion  VARCHAR(150)         NULL,
  CONSTRAINT pk_rol PRIMARY KEY (id_rol),
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
  contrasena_hash    VARCHAR(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  estado             ENUM('ACTIVO','DESACTIVADO','BLOQUEADO') NOT NULL DEFAULT 'ACTIVO',
  -- RN-31: a los 5 intentos fallidos consecutivos se bloquea temporalmente.
  -- No se acota a 5 con un CHECK: el umbral es logica de aplicacion y un tope
  -- haria fallar el UPDATE del intento que dispara el bloqueo.
  intentos_fallidos  TINYINT UNSIGNED NOT NULL DEFAULT 0,
  bloqueado_hasta    DATETIME             NULL,
  CONSTRAINT pk_usuario PRIMARY KEY (id_usuario),
  CONSTRAINT uq_usuario_correo UNIQUE (correo),
  CONSTRAINT ck_usuario_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),
  -- Sanidad minima del correo; la validacion completa es de la aplicacion.
  CONSTRAINT ck_usuario_correo_formato CHECK (correo LIKE '%_@_%._%'),
  -- bloqueado_hasta solo tiene sentido mientras la cuenta esta bloqueada.
  CONSTRAINT ck_usuario_bloqueo CHECK (bloqueado_hasta IS NULL OR estado = 'BLOQUEADO')
) ENGINE = InnoDB;

-- USUARIO_ROL — resuelve el N:M usuario-rol. RN-G6, RF-006.
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
  -- si alguien lee la tabla no puede reutilizar el enlace.
  token             CHAR(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  fecha_generacion  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_expiracion  DATETIME        NOT NULL,
  utilizado         BOOLEAN         NOT NULL DEFAULT FALSE,
  CONSTRAINT pk_recuperacion PRIMARY KEY (id_recuperacion),
  CONSTRAINT uq_recuperacion_token UNIQUE (token),
  CONSTRAINT fk_recuperacion_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT ck_recuperacion_vigencia CHECK (fecha_expiracion > fecha_generacion),
  -- RF-005: buscar la solicitud vigente de un usuario.
  INDEX ix_recuperacion_usuario_vigencia (id_usuario, fecha_expiracion)
) ENGINE = InnoDB;

-- =============================================================================
-- 2. CATALOGO  (aporte de Juan)
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

-- PRODUCTO — RF-007 a RF-011. Solo datos comerciales: el stock vive en
-- INVENTARIO (decision de integracion "Stock del producto").
CREATE TABLE producto (
  id_producto              BIGINT UNSIGNED   NOT NULL AUTO_INCREMENT,
  id_categoria             SMALLINT UNSIGNED NOT NULL,
  nombre                   VARCHAR(150)      NOT NULL,
  descripcion              VARCHAR(1000)     NOT NULL,
  -- DECIMAL y no FLOAT: el dinero no admite error de redondeo binario.
  precio                   DECIMAL(12,2)     NOT NULL,
  fecha_ingreso            DATE              NOT NULL,   -- RN-08
  vida_util_estimada_dias  SMALLINT UNSIGNED     NULL,   -- RN-14
  estado                   ENUM('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
  CONSTRAINT pk_producto PRIMARY KEY (id_producto),
  -- RN-16 / RN-39: las categorias se desactivan, no se borran.
  CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_producto_precio CHECK (precio > 0),                    -- RN-09
  CONSTRAINT ck_producto_vida_util CHECK (vida_util_estimada_dias IS NULL OR vida_util_estimada_dias > 0),
  CONSTRAINT ck_producto_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0),
  -- RF-016 / RN-07: el catalogo publico filtra por estado y categoria.
  INDEX ix_producto_estado_categoria (estado, id_categoria),
  -- RF-015: busqueda por nombre (la collation ai_ci ignora caja y tildes).
  INDEX ix_producto_nombre (nombre),
  -- RF-017: filtro por rango de precio sobre productos activos.
  INDEX ix_producto_estado_precio (estado, precio)
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

-- PROMOCION — RF-014.
CREATE TABLE promocion (
  id_promocion          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  descripcion           VARCHAR(255)    NOT NULL,
  porcentaje_descuento  DECIMAL(5,2)    NOT NULL,
  fecha_inicio          DATE            NOT NULL,
  fecha_fin             DATE            NOT NULL,
  estado                ENUM('ACTIVA','INACTIVA','FINALIZADA') NOT NULL DEFAULT 'ACTIVA',
  CONSTRAINT pk_promocion PRIMARY KEY (id_promocion),
  CONSTRAINT ck_promocion_porcentaje CHECK (porcentaje_descuento > 0 AND porcentaje_descuento <= 100),
  CONSTRAINT ck_promocion_vigencia CHECK (fecha_fin >= fecha_inicio),
  -- RF-014, RF-022: promociones vigentes al calcular el total.
  INDEX ix_promocion_vigencia (estado, fecha_inicio, fecha_fin)
) ENGINE = InnoDB;

-- PRODUCTO_OCASION — N:M producto-ocasion. RF-016.
CREATE TABLE producto_ocasion (
  id_producto  BIGINT UNSIGNED   NOT NULL,
  id_ocasion   SMALLINT UNSIGNED NOT NULL,
  CONSTRAINT pk_producto_ocasion PRIMARY KEY (id_producto, id_ocasion),
  -- Es una etiqueta, no historial.
  CONSTRAINT fk_producto_ocasion_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_producto_ocasion_ocasion FOREIGN KEY (id_ocasion)
    REFERENCES ocasion (id_ocasion) ON DELETE RESTRICT ON UPDATE CASCADE,
  INDEX ix_producto_ocasion_ocasion (id_ocasion)
) ENGINE = InnoDB;

-- PRODUCTO_PROMOCION — N:M producto-promocion. RF-014.
-- OJO: RN-19 / RN-42 ("un producto solo puede tener una promocion activa a la
-- vez") NO se puede expresar con un UNIQUE, porque depende del solapamiento de
-- rangos de fechas. Ver modelo-fisico.md, seccion 11.
CREATE TABLE producto_promocion (
  id_producto   BIGINT UNSIGNED NOT NULL,
  id_promocion  BIGINT UNSIGNED NOT NULL,
  CONSTRAINT pk_producto_promocion PRIMARY KEY (id_producto, id_promocion),
  CONSTRAINT fk_producto_promocion_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_producto_promocion_promocion FOREIGN KEY (id_promocion)
    REFERENCES promocion (id_promocion) ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX ix_producto_promocion_promocion (id_promocion)
) ENGINE = InnoDB;

-- =============================================================================
-- 3. ENTREGA  (aportes de Steven e Ivan)
-- =============================================================================

-- ZONA — zona con cobertura de entrega. RN-23, RF-023.
CREATE TABLE zona (
  id_zona  SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre   VARCHAR(80)       NOT NULL,
  estado   ENUM('ACTIVA','INACTIVA') NOT NULL DEFAULT 'ACTIVA',
  CONSTRAINT pk_zona PRIMARY KEY (id_zona),
  CONSTRAINT uq_zona_nombre UNIQUE (nombre),
  CONSTRAINT ck_zona_nombre_no_vacio CHECK (CHAR_LENGTH(TRIM(nombre)) > 0)
) ENGINE = InnoDB;

-- FRANJA_HORARIA — intervalo de entrega reutilizable con cupo. RF-024, RN-24.
-- No lleva fecha: la fecha concreta esta en pedido.fecha_entrega y el cupo se
-- cuenta por (franja, fecha). Ver modelo-fisico.md, seccion 11.
CREATE TABLE franja_horaria (
  id_franja_horaria  SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  hora_inicio        TIME              NOT NULL,
  hora_fin           TIME              NOT NULL,
  cupo_maximo        SMALLINT UNSIGNED NOT NULL,
  estado             ENUM('ACTIVA','INACTIVA') NOT NULL DEFAULT 'ACTIVA',
  CONSTRAINT pk_franja_horaria PRIMARY KEY (id_franja_horaria),
  -- No se puede configurar dos veces el mismo intervalo.
  CONSTRAINT uq_franja_horas UNIQUE (hora_inicio, hora_fin),
  CONSTRAINT ck_franja_horas CHECK (hora_fin > hora_inicio),
  CONSTRAINT ck_franja_cupo_maximo CHECK (cupo_maximo > 0)        -- RN-24
) ENGINE = InnoDB;

-- PEDIDO — RF-023 a RF-036. Estados segun RN-29.
CREATE TABLE pedido (
  id_pedido                BIGINT UNSIGNED   NOT NULL AUTO_INCREMENT,
  -- Comprador.
  id_usuario               BIGINT UNSIGNED   NOT NULL,
  -- RF-034: se asigna despues y puede quedar sin asignar.
  id_repartidor            BIGINT UNSIGNED       NULL,
  id_franja_horaria        SMALLINT UNSIGNED NOT NULL,
  -- RN-22 y RN-G2: comprador y destinatario se conservan por separado.
  nombre_comprador         VARCHAR(120)      NOT NULL,
  nombre_destinatario      VARCHAR(120)      NOT NULL,
  -- RF-024, RN-G1: fecha solicitada; la franja da el intervalo de horas.
  fecha_entrega            DATE              NOT NULL,
  -- RN-26 / RN-44: maximo 200 caracteres, garantizado por el tipo.
  dedicatoria              VARCHAR(200)          NULL,
  estado                   ENUM('CONFIRMADO','EN_PREPARACION','EN_CAMINO','ENTREGADO','CANCELADO')
                                             NOT NULL DEFAULT 'CONFIRMADO',
  -- Se persiste como valor historico al confirmar (modelo integrado, regla 26).
  total                    DECIMAL(12,2)     NOT NULL,
  -- RF-036: se registra al marcar ENTREGADO.
  fecha_hora_entrega_real  DATETIME              NULL,
  -- Agregado en el modelo fisico: RF-029, RF-032 y RF-043 ordenan y filtran
  -- pedidos por fecha de compra.
  fecha_creacion           DATETIME          NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_pedido PRIMARY KEY (id_pedido),
  -- Un pedido es historial de ventas: no se borra la cuenta que compro.
  CONSTRAINT fk_pedido_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
  -- Si se da de baja al repartidor, el pedido queda sin asignar, no se borra.
  CONSTRAINT fk_pedido_repartidor FOREIGN KEY (id_repartidor)
    REFERENCES usuario (id_usuario) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_pedido_franja FOREIGN KEY (id_franja_horaria)
    REFERENCES franja_horaria (id_franja_horaria) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_pedido_total CHECK (total >= 0),
  CONSTRAINT ck_pedido_comprador CHECK (CHAR_LENGTH(TRIM(nombre_comprador)) > 0),
  CONSTRAINT ck_pedido_destinatario CHECK (CHAR_LENGTH(TRIM(nombre_destinatario)) > 0),
  -- Regla 24 del modelo integrado: la fecha real existe si y solo si el pedido
  -- esta ENTREGADO.
  CONSTRAINT ck_pedido_entrega_real CHECK (
    (estado = 'ENTREGADO' AND fecha_hora_entrega_real IS NOT NULL) OR
    (estado <> 'ENTREGADO' AND fecha_hora_entrega_real IS NULL)
  ),
  -- RF-032, RF-043: gestion y reporte por estado y fecha.
  INDEX ix_pedido_estado_fecha (estado, fecha_creacion),
  -- RF-029: historial del cliente.
  INDEX ix_pedido_usuario (id_usuario, fecha_creacion),
  -- RF-035: el repartidor ve solo los suyos.
  INDEX ix_pedido_repartidor (id_repartidor, estado),
  -- RN-24: contar los pedidos de una franja en una fecha para validar el cupo.
  INDEX ix_pedido_franja_fecha (id_franja_horaria, fecha_entrega)
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
  -- El UNIQUE convierte el 1:N en el 1:1 con pedido.
  CONSTRAINT uq_direccion_pedido UNIQUE (id_pedido),
  -- La direccion es parte del historial de entrega.
  CONSTRAINT fk_direccion_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE RESTRICT ON UPDATE CASCADE,
  -- RN-23: no se borra una zona que respalda direcciones registradas.
  CONSTRAINT fk_direccion_zona FOREIGN KEY (id_zona)
    REFERENCES zona (id_zona) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_direccion_no_vacia CHECK (CHAR_LENGTH(TRIM(direccion)) > 0),
  INDEX ix_direccion_zona (id_zona)
) ENGINE = InnoDB;

-- ITEM_PEDIDO — RF-026, RN-13 (precio congelado al confirmar).
-- El subtotal es derivado (cantidad * precio_unitario) y no se almacena.
CREATE TABLE item_pedido (
  id_item_pedido   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_pedido        BIGINT UNSIGNED NOT NULL,
  id_producto      BIGINT UNSIGNED NOT NULL,
  cantidad         INT             NOT NULL,
  -- RN-13: copia del precio al confirmar. Si el producto cambia de precio
  -- manana, el pedido de hoy conserva el suyo.
  precio_unitario  DECIMAL(12,2)   NOT NULL,
  CONSTRAINT pk_item_pedido PRIMARY KEY (id_item_pedido),
  -- El mismo producto no aparece dos veces en un pedido.
  CONSTRAINT uq_item_pedido_producto UNIQUE (id_pedido, id_producto),
  CONSTRAINT fk_item_pedido_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE RESTRICT ON UPDATE CASCADE,
  -- RF-042 (ranking de mas vendidos) necesita que el producto siga existiendo.
  CONSTRAINT fk_item_pedido_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_item_pedido_cantidad CHECK (cantidad >= 1),
  CONSTRAINT ck_item_pedido_precio CHECK (precio_unitario > 0),
  INDEX ix_item_pedido_producto (id_producto)
) ENGINE = InnoDB;

-- PAGO — RF-027, RF-028. Pago simulado (RN-27 / RN-45).
CREATE TABLE pago (
  id_pago     BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_pedido   BIGINT UNSIGNED NOT NULL,
  monto       DECIMAL(12,2)   NOT NULL,
  metodo      ENUM('TARJETA','TRANSFERENCIA','CONTRAENTREGA') NOT NULL,
  fecha_hora  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado      ENUM('APROBADO','RECHAZADO') NOT NULL,
  CONSTRAINT pk_pago PRIMARY KEY (id_pago),
  -- Las transacciones se conservan como historial.
  CONSTRAINT fk_pago_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_pago_monto CHECK (monto > 0),
  INDEX ix_pago_pedido (id_pedido, fecha_hora)
) ENGINE = InnoDB;

-- =============================================================================
-- 4. INVENTARIO Y CARRITO  (aporte de Roman)
-- =============================================================================

-- INVENTARIO — una fila por producto (1:1). RN-G3, RN-47.
CREATE TABLE inventario (
  -- PK y FK a la vez: materializa el 1:1 con producto.
  id_producto          BIGINT UNSIGNED NOT NULL,
  -- RN-15 / RN-38: este valor solo debe moverse via movimiento_inventario.
  stock_actual         INT             NOT NULL DEFAULT 0,
  -- RN-47: configurable por producto; NULL significa "no alertar".
  umbral_stock_minimo  INT                 NULL,
  CONSTRAINT pk_inventario PRIMARY KEY (id_producto),
  -- El producto se desactiva; no se borra si tiene inventario.
  CONSTRAINT fk_inventario_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_inventario_stock CHECK (stock_actual >= 0),           -- RN-G3
  CONSTRAINT ck_inventario_umbral CHECK (umbral_stock_minimo IS NULL OR umbral_stock_minimo >= 0)
) ENGINE = InnoDB;

-- MOVIMIENTO_INVENTARIO — RF-037 a RF-040.
-- Es la unica via legitima para mover inventario.stock_actual (RN-15 / RN-38) y
-- el registro que sobrevive a la desactivacion del producto (RN-16 / RN-39).
CREATE TABLE movimiento_inventario (
  id_movimiento  BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_producto    BIGINT UNSIGNED NOT NULL,
  -- Quien registro el movimiento. RF-037, RF-040.
  id_usuario     BIGINT UNSIGNED NOT NULL,
  -- Solo VENTA nace de un pedido; NULL en ENTRADA y MERMA.
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
  -- ON UPDATE RESTRICT es obligatorio: MySQL 8 (error 3823) no permite usar en
  -- un CHECK una columna cuya FK tenga una accion que la modifique, e id_pedido
  -- participa en ck_movimiento_pedido_venta.
  CONSTRAINT fk_movimiento_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT ck_movimiento_cantidad CHECK (cantidad > 0),
  -- RN-G5: la merma queda registrada con motivo.
  CONSTRAINT ck_movimiento_motivo_merma CHECK (
    tipo <> 'MERMA' OR (motivo IS NOT NULL AND CHAR_LENGTH(TRIM(motivo)) > 0)
  ),
  -- Regla 12 del modelo integrado: VENTA exige pedido; ENTRADA y MERMA no lo tienen.
  CONSTRAINT ck_movimiento_pedido_venta CHECK (
    (tipo = 'VENTA' AND id_pedido IS NOT NULL) OR
    (tipo <> 'VENTA' AND id_pedido IS NULL)
  ),
  -- RF-037: movimientos de stock por producto.
  INDEX ix_movimiento_producto_fecha (id_producto, fecha),
  -- RF-040: consulta de mermas por periodo.
  INDEX ix_movimiento_tipo_fecha (tipo, fecha),
  INDEX ix_movimiento_usuario (id_usuario),
  INDEX ix_movimiento_pedido (id_pedido)
) ENGINE = InnoDB;

-- CARRITO — RF-019 a RF-022. USUARIO 0..1 CARRITO.
CREATE TABLE carrito (
  id_carrito      BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario      BIGINT UNSIGNED NOT NULL,
  fecha_creacion  DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_carrito PRIMARY KEY (id_carrito),
  -- El UNIQUE materializa el "como maximo un carrito por usuario".
  CONSTRAINT uq_carrito_usuario UNIQUE (id_usuario),
  -- El carrito es estado temporal, no historial.
  CONSTRAINT fk_carrito_usuario FOREIGN KEY (id_usuario)
    REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB;

-- ITEM_CARRITO — RF-019 a RF-021, RN-11.
-- No guarda precio: RN-12 y RN-13 mandan que el precio que cuenta es el
-- vigente al confirmar, y ese se congela en item_pedido.
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
  -- Los productos se desactivan, no se borran (RN-16).
  CONSTRAINT fk_item_carrito_producto FOREIGN KEY (id_producto)
    REFERENCES producto (id_producto) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT ck_item_carrito_cantidad CHECK (cantidad >= 1),           -- RN-11
  INDEX ix_item_carrito_producto (id_producto)
) ENGINE = InnoDB;

-- =============================================================================
-- Fin del DDL. 20 tablas, las mismas del modelo integrado.
-- Las reglas que no se pueden declarar aqui estan en modelos/modelo-fisico.md,
-- seccion 11, con la via de implementacion propuesta.
-- =============================================================================
