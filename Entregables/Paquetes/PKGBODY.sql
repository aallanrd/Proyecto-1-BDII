
CREATE OR REPLACE PACKAGE BODY pkg_Proce AS 
--///////////////////////Gen Proyeccion Procedure////////////////////////////////////////////////    
PROCEDURE genProyeccion (nombre_lista VARCHAR2,cod_articulo VARCHAR2 ,
cant_load INTEGER) AS

           v_Calc NUMBER := 0;  v_Precio VARCHAR2(25) := '';  v_Familia VARCHAR2(25) := '';
           
    BEGIN
        SELECT familia INTO v_Familia  FROM Articulo WHERE codigoArticulo = cod_Articulo ; 
        SELECT precioDolar  INTO v_Precio FROM Articulo WHERE codigoArticulo = cod_Articulo ; 
        
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;            
                 insert into Proyecciones values (cod_articulo,v_Calc,1,v_Precio);
              
            END LOOP;
       END;
  --////////////////////////////////////////////////////////////////////
        PROCEDURE insertArticulo (codigoArt VARCHAR2,
                                            familia VARCHAR2,
                                            preciodolar VARCHAR2,
                                            usuarioInserta VARCHAR2,
                                            usuarioactualiza VARCHAR2,
                                            fechaultimoUpdate VARCHAR2,
                                            cantidad VARCHAR2,
                                            unidadMedida VARCHAR2)
AS

       BEGIN
             insert into Articulo values (codigoArt,familia,
                              preciodolar,
                              usuarioInserta,
                              usuarioActualiza,
                              fechaultimoUpdate,
                              cantidad,
                              unidadMedida);
       END;
 
 --////////////////////////////////////////////////////////////////////////
 PROCEDURE loadFamilia (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
              
              insert into familia values (dbms_random.string('B', 4),'001');
              
            END LOOP;
       END;
 --////////////////////////////////////////////////////////////////////////
 PROCEDURE loadUsuarios (cant_load INTEGER) AS

           v_Calc NUMBER := 0;
       BEGIN
            WHILE v_Calc <= cant_load LOOP
                 v_Calc := v_Calc + 1;
                 
              insert into usuarios values ( dbms_random.string('A', 8),
                                            dbms_random.string('B', 5),
                                            dbms_random.string('C', 8),
                                            dbms_random.string('D', 4),
                                            'Adm',
                                            NULL);
            END LOOP;
       END;
 
 --////////////////////////////////////////////////////////////////////////
END pkg_Proce;