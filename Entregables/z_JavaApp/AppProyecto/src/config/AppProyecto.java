/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author Allan
 */
public class AppProyecto {

    public static Connection connection = null;
    public static Statement statement = null;
    
   
   // String connect = "jdbc:oracle:thin:@localhost:1521:XE"; // String de conexcion JDBC (Base de Datos Almacenamiento)
    public static final String DBURL = "jdbc:oracle:thin:@//172.19.127.101:1521/proyectopdb";
    public static final String DBUSER = "jonaranjo";
    public static final String DBPASS = "jonaranjo";
    
    //String x = "jdbc:oracle:thin:@//localhost:1521/pdborcl";
    /**
     * Crea una nueva instancia ProductosController
     * @throws java.lang.ClassNotFoundException
     */
}
