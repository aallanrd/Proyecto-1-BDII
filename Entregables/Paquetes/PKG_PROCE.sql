create or replace PACKAGE pkg_Proce AS 
   
   PROCEDURE GenProyeccion(nombre_lista VARCHAR2,cod_articulo VARCHAR2 ,cant_load INTEGER); 
   PROCEDURE insertarticulo(codigoArt VARCHAR2,
                                            familia VARCHAR2,
                                            preciodolar VARCHAR2,
                                            usuarioInserta VARCHAR2,
                                            usuarioactualiza VARCHAR2,
                                            fechaultimoUpdate VARCHAR2,
                                            cantidad VARCHAR2,
                                            unidadMedida VARCHAR2); 
                                            
   PROCEDURE loadFamilia (cant_load INTEGER); 
   PROCEDURE loadUsuarios (cant_load INTEGER);
  
END pkg_Proce; 

