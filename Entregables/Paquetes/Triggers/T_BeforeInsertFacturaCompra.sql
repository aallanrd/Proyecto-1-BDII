 create or replace TRIGGER fact_bir 
BEFORE INSERT ON FacturaCompra 
FOR EACH ROW

DECLARE art_id VARCHAR(25):='Nada';

BEGIN


  --Busco si existe el articulo y asigno en variable
  SELECT codigoArticulo
  INTO art_id
  FROM Articulo
  WHERE codigoArticulo = :new.codigoArticulo ;

 
 IF art_id IS NOT NULL THEN
    
    UPDATE Articulo SET PrecioDolar = :new.PrecioArticulo,
    usuarioActualiza = :new.UsuarioInserta
    WHERE codigoArticulo = :new.codigoArticulo;
    
 END IF;
 
 Exception when no_data_found then

 --Auto Incremente con Sequence
  SELECT fact_seq.NEXTVAL
  INTO   :new.numeroFactura
  FROM   dual;
  
  --Asigno fecha actual para la compraFactura
  SELECT TO_CHAR (SYSDATE, 'MM-DD-YYYY HH24:MI:SS') "NOW" 
  INTO   :new.fechaCompra
  FROM   dual;
  --Asigno codigo random
  SELECT dbms_random.string('U', 20) str  INTO   :new.codigoArticulo FROM   dual;
  
 
  -- inserto nuevo Articulo
   insert into Articulo values (:new.codigoArticulo,'Default',
                              :new.precioArticulo,
                              :new.usuarioInserta,
                              :new.usuarioInserta,
                              :new.fechaCompra,
                              :new.cantidad,
                              :new.unidadMedida);
  
END;   