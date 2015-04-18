
CREATE TABLESPACE ProyectoADB
   DATAFILE 'E:\APP\ALLAN\ORADATA\ORCL\ProyectoADB.DBF' SIZE 100M;

SELECT TABLESPACE_NAME, FILE_NAME, BYTES
   FROM DBA_DATA_FILES;


CREATE TABLE USUARIOS 
(
  CEDULA VARCHAR2(25 BYTE) NOT NULL 
, NOMBRE VARCHAR2(25 BYTE) NOT NULL 
, NOMBRE_USUARIO VARCHAR2(15 BYTE) NOT NULL 
, CONTRASEÑA VARCHAR2(15 BYTE) 
, TIPO VARCHAR2(10 BYTE) 
, IMAGEN BLOB 
, CONSTRAINT SYS_C0010270 PRIMARY KEY 
  (
    CEDULA 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "PROYECTOADB" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 57344 
  NEXT 106496 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
) 
LOB (IMAGEN) STORE AS SYS_LOB0000092778C00006$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  NOCACHE 
  LOGGING 
  TABLESPACE "PROYECTO" 
  STORAGE 
  ( 
    INITIAL 106496 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS 2147483645 
    BUFFER_POOL DEFAULT 
  )  
);
--/////////////////////////////////////////////////////////
CREATE TABLE Telefonos (
         cedula      VARCHAR2(25) NOT NULL CONSTRAINT tel_usuario_fk REFERENCES Usuarios
                     (cedula) ON delete Cascade,
         telefono      VARCHAR2(25) NOT NULL)
         
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);


--////////////////////////////////////////////////////////
CREATE TABLE Direcciones (
         cedula      VARCHAR2(25) NOT NULL CONSTRAINT dir_usuario_fk REFERENCES Usuarios
                     (cedula) ON delete Cascade,
         direccion      VARCHAR2(25) NOT NULL)
         
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
--////////////////////////////////////////////////////////


--/////////////////////////////////////////////////////////
CREATE TABLE Contactos (
         cedula      VARCHAR2(25) NOT NULL CONSTRAINT con_usuario_fk REFERENCES Usuarios
                     (cedula) ON delete Cascade,
         contacto      VARCHAR2(25) NOT NULL)
         
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
--////////////////////////////////////////////////////////

--/////////////////////////////////////////////////////////
CREATE TABLE Apartados (
         cedula      VARCHAR2(25) NOT NULL CONSTRAINT ap_usuario_fk REFERENCES Usuarios
                     (cedula) ON delete Cascade,
         apartado      VARCHAR2(25) NOT NULL)
         
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
--////////////////////////////////////////////////////////


CREATE TABLE PROVEEDORES 
(
  CEDULA VARCHAR2(25 BYTE) NOT NULL 
, NOMBRE VARCHAR2(25 BYTE) NOT NULL 
, TIPO VARCHAR2(10 BYTE) 
, IMAGEN BLOB 
, CONSTRAINT SYS_C0010279 PRIMARY KEY 
  (
    CEDULA 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "PROYECTOADB" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 57344 
  NEXT 106496 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
) 
LOB (IMAGEN) STORE AS SYS_LOB0000092786C00004$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  NOCACHE 
  LOGGING 
  TABLESPACE "PROYECTO" 
  STORAGE 
  ( 
    INITIAL 106496 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS 2147483645 
    BUFFER_POOL DEFAULT 
  )  
);
--///////////////////////////////////////////////////////
CREATE TABLE UNIDADMEDIDA 
(
  CODIGO VARCHAR2(15 BYTE) NOT NULL 
, DESCRIPCION VARCHAR2(15 BYTE) 
, CONSTRAINT SYS_C0010272 PRIMARY KEY 
  (
    CODIGO 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "PROYECTOADB" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 57344 
  NEXT 106496 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

--///////////////////////////////////////////////////////
CREATE TABLE FACTURACOMPRA 
(
  NUMEROFACTURA VARCHAR2(25 BYTE) NOT NULL 
, CODIGOARTICULO VARCHAR2(25 BYTE) NOT NULL 
, PRECIOARTICULO VARCHAR2(25 BYTE) NOT NULL 
, USUARIOINSERTA VARCHAR2(25 BYTE) 
, PROVEEDOR VARCHAR2(25 BYTE) 
, FECHACOMPRA VARCHAR2(50 BYTE) 
, CANTIDAD VARCHAR2(20 BYTE) 
, UNIDADMEDIDA VARCHAR2(10 BYTE) 
, CONSTRAINT SYS_C0010376 PRIMARY KEY 
  (
    NUMEROFACTURA 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "PROYECTOADB" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 57344 
  NEXT 106496 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

ALTER TABLE FACTURACOMPRA
ADD CONSTRAINT FACT_PROVEE_FK FOREIGN KEY
(
  PROVEEDOR 
)
REFERENCES PROVEEDORES
(
  CEDULA 
)
ENABLE;

ALTER TABLE FACTURACOMPRA
ADD CONSTRAINT FACT_UNIDAD_FK FOREIGN KEY
(
  UNIDADMEDIDA 
)
REFERENCES UNIDADMEDIDA
(
  CODIGO 
)
ENABLE;

ALTER TABLE FACTURACOMPRA
ADD CONSTRAINT FACT_USER_FK FOREIGN KEY
(
  USUARIOINSERTA 
)
REFERENCES USUARIOS
(
  CEDULA 
)
ENABLE;
--//////////////////////////////////////////////////
--Para cada familia se requiere registrar el código, descripción, porcentaje de impuesto aplicable a la compra del artículo, si aplica el impuesto ventas,  código del índice económico asociado.
--drop table Familia;
CREATE TABLE Valores (
         valores      VARCHAR2(25) NOT NULL,
         precioDolar      VARCHAR2(25) NOT NULL,
         fecha      VARCHAR2(25) NOT NULL,
         mes    VARCHAR2(15) NOT NULL)
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
 
CREATE TABLE IndiceEconomico (
         codigoIndice      VARCHAR2(25) NOT NULL primary key,
         descripcion      VARCHAR2(25) NOT NULL,
         numeroMeses      VARCHAR2(25) NOT NULL,
         valores    VARCHAR2(15) NOT NULL
                     CONSTRAINT indice_valores_fk REFERENCES Valores
                     (valores) ON delete Cascade)
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
 
CREATE TABLE Familia (
         codigo      VARCHAR2(25) NOT NULL Primary Key,
         codigoIndice    VARCHAR2(15) NOT NULL
                     CONSTRAINT fam_indice_fk REFERENCES IndiceEconomico
                     (codigoIndice) ON delete Cascade)
         
         
   TABLESPACE proyecto
   STORAGE ( INITIAL 50K);
   
--
CREATE TABLE ARTICULO 
(
  CODIGOARTICULO VARCHAR2(20 BYTE) NOT NULL 
, FAMILIA VARCHAR2(10 BYTE) NOT NULL 
, PRECIODOLAR VARCHAR2(10 BYTE) NOT NULL 
, USUARIOINSERTA VARCHAR2(25 BYTE) 
, USUARIOACTUALIZA VARCHAR2(25 BYTE) 
, FECHAULTIMOUPDATE VARCHAR2(20 BYTE) 
, CANTIDAD VARCHAR2(20 BYTE) 
, UNIDADMEDIDA VARCHAR2(10 BYTE) 
, CONSTRAINT SYS_C0010370 PRIMARY KEY 
  (
    CODIGOARTICULO 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE "PROYECTOADB" 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 57344 
  NEXT 106496 
  MINEXTENTS 1 
  MAXEXTENTS 2147483645 
  BUFFER_POOL DEFAULT 
);

ALTER TABLE ARTICULO
ADD CONSTRAINT ART_UNIDAD_FK FOREIGN KEY
(
  UNIDADMEDIDA 
)
REFERENCES UNIDADMEDIDA
(
  CODIGO 
)
ENABLE;

ALTER TABLE ARTICULO
ADD CONSTRAINT ART_USERA_FK FOREIGN KEY
(
  USUARIOACTUALIZA 
)
REFERENCES USUARIOS
(
  CEDULA 
)
ENABLE;

ALTER TABLE ARTICULO
ADD CONSTRAINT ART_FAMILIA_FK FOREIGN KEY
(
  FAMILIA 
)
REFERENCES FAMILIA
(
  CODIGO 
)
ENABLE;

ALTER TABLE ARTICULO
ADD CONSTRAINT ART_USERI_FK FOREIGN KEY
(
  USUARIOINSERTA 
)
REFERENCES USUARIOS
(
  CEDULA 
)
ENABLE;

--////////////////////////////////////////////////////////////
CREATE TABLE Ensamblado (
         codigoArticulo      VARCHAR2(25) NOT NULL primary key,
         nombre       VARCHAR2(25) NOT NULL CONSTRAINT ensamblado_articulo_fk REFERENCES Articulo
         (codigoArticulo) ON delete Cascade,
         descripcion      VARCHAR2(25) NOT NULL
         )
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
--/////////////////////////////////////////////////////////////////////////////////////////
--drop table listaPrecios
CREATE TABLE listaPrecios (
         codigo      VARCHAR2(25) NOT NULL primary key,
         descripcion      VARCHAR2(25) NOT NULL
         )
         
         
   TABLESPACE ProyectoADB
   STORAGE ( INITIAL 50K);
   --///////////////////////////////////////////////////////////////////
   CREATE TABLE Proyecciones (

         codigoArticulo      VARCHAR2(25) NOT NULL ,
         mes      VARCHAR2(25) NOT NULL ,
         cantidad INTEGER ,
         precioColones      VARCHAR2(25) NOT NULL 
         )
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);


   --drop table PreciosPrueba
   --//////////////////////////////////////////////////////////////////////////////////////
CREATE TABLE PreciosPrueba (
         codigo      VARCHAR2(25) NOT NULL primary key,
         listaPrecio      VARCHAR2(25) NOT NULL CONSTRAINT precio_lista_fk REFERENCES listaPrecios
         (codigo) ON delete Cascade,
         precio VARCHAR2(25) NOT NULL,
         codigoArticulo VARCHAR2(25) NOT NULL CONSTRAINT precio_articulo_fk REFERENCES Articulo
         (codigoArticulo) ON delete Cascade )
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
  --drop table clientes 
CREATE TABLE Clientes (
         cedula      VARCHAR2(25) NOT NULL primary key,
         nombre      VARCHAR2(25) NOT NULL,
         ultimaCompra      VARCHAR2(25) NOT NULL,
         listaPrecios      VARCHAR2(25) NOT NULL,
         totalCompras    VARCHAR2(15) NOT NULL)
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
 --////////////////////////////////////////////////////////////////////////////////
 --  drop table cotizacion
CREATE TABLE Cotizacion (
         codigo      VARCHAR2(25) NOT NULL Primary Key,
         fecha      VARCHAR2(25) NOT NULL ,
         codigoCliente      VARCHAR2(25) NOT NULL CONSTRAINT cotizaciom_cliente_fk REFERENCES Clientes
                     (cedula) ON delete Cascade,
         codigoVendedor      VARCHAR2(25) NOT NULL CONSTRAINT cotizacion_usuario_fk REFERENCES Usuarios
                     (cedula) ON delete Cascade ,
         condicionesPago      VARCHAR2(55) NOT NULL ,
         condicionesEntrega      VARCHAR2(55) NOT NULL ,
         vigencia      VARCHAR2(25) NOT NULL ,
         observaciones      VARCHAR2(55) NOT NULL ,
         listaPrecios      VARCHAR2(25) NOT NULL CONSTRAINT cotizacion_lista_fk REFERENCES ListaPrecios
         (codigo) ON delete Cascade ,
         moneda      VARCHAR2(25) NOT NULL ,
         estado      VARCHAR2(25) NOT NULL ,
         totalCotizacion      VARCHAR2(25) NOT NULL 
         
        )
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
--////////////////////////////////////////////////////////////////////////   
   --drop table ArticulosCotizados
CREATE TABLE ArticulosCotizados (
         numeroCotizacion      VARCHAR2(25) NOT NULL primary key,
         descripcion      VARCHAR2(25) NOT NULL,
         numeroMeses      VARCHAR2(25) NOT NULL,
         cotizacion    VARCHAR2(15) NOT NULL
                     CONSTRAINT articulo_cotizacion_fk REFERENCES Cotizacion
                     (codigo) ON delete Cascade)
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);
 --////////////////////////////////////////////////////////////////////////////  
CREATE TABLE Bitacora (

         codigo      VARCHAR2(25) NOT NULL Primary Key,
         fecha      VARCHAR2(25) NOT NULL ,
         codigoCliente      VARCHAR2(25) NOT NULL ,
         codigoVendedor      VARCHAR2(25) NOT NULL  ,
         condicionesPago      VARCHAR2(55) NOT NULL ,
         condicionesEntrega      VARCHAR2(55) NOT NULL ,
         vigencia      VARCHAR2(25) NOT NULL ,
         observaciones      VARCHAR2(55) NOT NULL ,
         listaPrecios      VARCHAR2(25) NOT NULL ,
         moneda      VARCHAR2(25) NOT NULL ,
         estado      VARCHAR2(25) NOT NULL ,
         totalCotizacion      VARCHAR2(25) NOT NULL )
         
         
   TABLESPACE proyectoADB
   STORAGE ( INITIAL 50K);

