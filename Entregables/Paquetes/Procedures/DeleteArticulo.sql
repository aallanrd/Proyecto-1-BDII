
--•	la inserción, modificación, borrado de artículos y componentes,
create or replace PROCEDURE deleteArticulo (codigoArt VARCHAR2
                                            )
AS

       BEGIN
           delete from Articulo where codigoArticulo = codigoArt;
       END;
       
       
       
  --select * from Articulo;     
  --exec DELETEARTICULO ('YYNXIJPWXVXRGTLCMDAC');
       
   