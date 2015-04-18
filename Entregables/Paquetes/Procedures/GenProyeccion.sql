select * from listaprecios;
--que reciba como parámetros,
--el código de una lista de precios y el número de meses a proyectar.
--El procedimiento debe generar una tabla  de proyecciones con el código del producto,
--el mes, y la proyección del precio en colones. 
--select * from Articulo;

exec genProyeccion ('Cliente Frecuente', 'HFLMSOLXIWJCFQPTCOLO', 2);

select * from proyecciones
--ALter TABLE Proyecciones Drop CONSTRAINT SYS_C0011640;


create or replace PROCEDURE genProyeccion (nombre_lista VARCHAR2,cod_articulo VARCHAR2 ,
cant_load INTEGER) AS

           v_Calc NUMBER := 0;
           v_Precio VARCHAR2(25) := '';
           v_Familia VARCHAR2(25) := '';
           
           
       BEGIN
       
        SELECT familia INTO v_Familia 
        FROM Articulo
        WHERE codigoArticulo = cod_Articulo ;
        
         
        SELECT precioDolar 
        INTO v_Precio
        FROM Articulo
        WHERE codigoArticulo = cod_Articulo ; 
        
        --Falta Precio Segun Indice ( Familia)
        
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;            
                 insert into Proyecciones values (cod_articulo,v_Calc,1,v_Precio);
              
            END LOOP;
       END;

