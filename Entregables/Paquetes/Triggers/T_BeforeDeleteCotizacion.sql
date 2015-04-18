
-- Antes de eliminar una Cotizacion 
-- Activo Trigger Por Evento
-- Guarda Datos en Tabla Bitacora ( Registro Cambios)
--Si EL estado es 'EMITIDA'

Create or Replace  TRIGGER cot_del 
BEFORE DELETE ON Cotizacion
FOR EACH ROW
DECLARE x INT;
  
BEGIN
  
  IF :old.Estado = 'EMITIDA' THEN
  
  insert into Bitacora values (:old.codigo,
                              :old.fecha,
                              :old.codigoCliente,
                              :old.codigoVendedor,
                              :old.condicionesPago,
                              :old.condicionesEntrega,
                              :old.vigencia,
                              :old.observaciones,
                              :old.listaPrecios,
                              :old.moneda ,
                              :old.estado,
                               :old.totalCotizacion
                              );
 
    END IF;
END;




insert into clientes values ('111', 'MiCLiente1','Juan','26/02/1991','18');
insert into clientes values ('222', 'MiCLiente2','Pedro','26/02/1991','18');
insert into clientes values ('333', 'MiCLiente3','Jesus','26/02/1991','18');
insert into clientes values ('444', 'MiCLiente4','Jacob','26/02/1991','18');

insert into cotizacion VALUES ('001','26/02/2015','111','222','Algunas condiciones de Pago',
                                'Algunas condiciones de Entrega',
                                'Vigencia 30 Dias',
                                'Default',
                                'Cliente Frecuente',
                                'Colones',
                                'Emitida',
                                '12.600');


insert into cotizacion VALUES ('001','26/02/2015','111','222','Algunas condiciones de Pago',
                                'Algunas condiciones de Entrega',
                                'Vigencia 30 Dias',
                                'Default',
                                'Cliente Frecuente',
                                'Colones',
                                'Emitida',
                                '12.600');


insert into LISTAPRECIOS VALUES ( 'Cliente Frecuente','Clientes del Sistema');
insert into LISTAPRECIOS VALUES ( 'Cliente Nuevo','Clientes Nuevos');
insert into LISTAPRECIOS VALUES ( 'Cliente Sin Tarjeta','Clientes Sin Tarjeta');


  