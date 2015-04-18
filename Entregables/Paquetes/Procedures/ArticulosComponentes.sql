
--•	la inserción, modificación, borrado de artículos y componentes,
create or replace PROCEDURE insertArticulo (codigoArt VARCHAR2,
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
       
       
       
       
   