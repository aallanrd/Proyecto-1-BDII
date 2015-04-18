create or replace PROCEDURE editArticulo (codigoArtUp VARCHAR2,
                                            familiaUp VARCHAR2,
                                            preciodolarUp VARCHAR2,
                                            usuarioactualizaUp VARCHAR2,
                                            fechaultimoUpdateUp VARCHAR2,
                                            cantidadUp VARCHAR2,
                                            unidadMedidaUp VARCHAR2)
AS

       BEGIN
             UPDATE Articulo SET PrecioDolar = precioDolarUp,
             usuarioActualiza = usuarioactualizaUp 
             WHERE codigoArticulo = codigoArtUp;
       END;