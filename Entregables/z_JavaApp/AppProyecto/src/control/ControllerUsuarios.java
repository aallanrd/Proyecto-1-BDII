/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import config.AppProyecto;
import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import model.FacturaCompra;
import model.Producto;
import model.Proveedores;
import model.Users;
import model.unidadMedida;

/**
 *
 * @author Allan
 */
public class ControllerUsuarios {
    
     AppProyecto miApp = new AppProyecto();
    
    public ControllerUsuarios() throws ClassNotFoundException, SQLException  {

       
         // Load Oracle JDBC Driver
        DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

        try {
            Connection con = DriverManager.getConnection(AppProyecto.DBURL, AppProyecto.DBUSER, AppProyecto.DBPASS);
            AppProyecto.statement = con.createStatement();
            AppProyecto.statement.setQueryTimeout(30);
         
        } catch (SQLException ex) {
          //  JOptionPane.showMessageDialog(null, "No conecto :(");
        }
    }
    public    ArrayList<Users> getAllUsers(List list) {
        list.removeAll();
        ArrayList<Users> miArray = new ArrayList<>();
        try {
            ResultSet rs = miApp.statement.executeQuery("select * from usuarios");
            
            while (rs.next()) {

                
                Users user = new Users();
                // read the result set
                try {
                    list.add(rs.getString("nombre"));
                    user.setNombre(rs.getString("nombre"));
                    user.setCedula(rs.getString("cedula"));
                    user.setUsername(rs.getString("nombre_usuario"));
                    user.setPass(rs.getString("contraseña"));
                    user.setTipo(rs.getString("tipo"));

                } catch (Exception e) {

                }

                miArray.add(user);

            }
        } catch (Exception e) {

        }
        return miArray;
    }
    
    public void insertFacturaCompra(String precio, Users myUserActual, String cantidad, String unidad, String provee) {

        try {
          
            System.out.println(provee);

            String q1 = "insert into FacturaCompra values ("
                    + "'',"
                    + "'',"
                    + "'" + precio + "',"
                    + "'" + myUserActual.getCedula() + "',"
                    + "'" + provee + "',"
                    + "'',"
                    + "'" + cantidad + "',"
                    + "'" + unidad + "')";

            // String query = "insert into FacturaCompra values ('','','"+precio+"','"+myUserActual.getCedula()+"','"+myUserActual.getCedula()+"','','"+cantidad+"','"+unidad+"');";
            ResultSet executeQuery = AppProyecto.statement.executeQuery(q1);
            System.out.println(executeQuery);
        } catch (SQLException ex) {
            Logger.getLogger(ControllerUsuarios.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<unidadMedida> loadUnidades(JComboBox c1) {
        
        
        ArrayList<unidadMedida> miArray = new ArrayList<>();
        try {
            ResultSet rs = AppProyecto.statement.executeQuery("select * from unidadmedida");
            
            while (rs.next()) {

                
                unidadMedida unidad = new unidadMedida();
                // read the result set
                try {
                    c1.addItem(rs.getString("codigo"));
                    unidad.setCodigo(rs.getString("codigo"));
                    unidad.setDescripcion(rs.getString("descripcion"));

                } catch (Exception e) {

                }

                miArray.add(unidad);

            }
        } catch (Exception e) {

        }
        return miArray;
        
        }

    
    public ArrayList<FacturaCompra> loadFacturaCompra(JTable t1) {
        
        
        ArrayList<FacturaCompra> miArray = new ArrayList<>();
        try {
            ResultSet rs = AppProyecto.statement.executeQuery("select * from FacturaCompra order by numeroFactura");
            int c = 0;
             FacturaCompra fact = null;
            while (rs.next()) {

                try{
                   fact = new FacturaCompra();
                // read the result set
            
                    t1.setValueAt(rs.getString("numeroFactura"),c,0);
                    fact.setNumeroFactura(rs.getString("numeroFactura"));
                    //=========================================

                    fact.setCodigoArticulo(rs.getString("codigoArticulo"));
                    t1.setValueAt(rs.getString("codigoArticulo"),c,1);
                    
                    fact.setPrecioArticulo(rs.getString("precioArticulo"));
                    t1.setValueAt(rs.getString("precioArticulo"),c,2);
                    
                    fact.setUsuarioInserta(rs.getString("usuarioInserta"));
                    t1.setValueAt(rs.getString("usuarioInserta"),c,3);
                    
                    fact.setFechaCompra(rs.getString("fechaCompra"));
                    t1.setValueAt(rs.getString("fechaCompra"),c,4);
                    
                    fact.setUnidadMedida(rs.getString("unidadMedida"));
                    t1.setValueAt(rs.getString("unidadMedida"),c,5);
                    
                    fact.setProveedor(rs.getString("proveedor"));
                    t1.setValueAt(rs.getString("proveedor"),c,6);
                    
                    fact.setCantidad(rs.getString("cantidad"));
                    t1.setValueAt(rs.getString("cantidad"),c,7);
                    
                     fact.setNombre(rs.getString("cantidad"));
                  //  t1.setValueAt(rs.getString("cantidad"),c,7);
                    
                    
                }
                catch(Exception e){
                    System.out.println("Error aqui: " + fact.getCantidad());
                     miArray.add(fact);
                }
                    
               
                c = c+1;
               

            }
        } catch (Exception e) {

        }
        return miArray;
        
        }

    public    ArrayList<Proveedores> getAllProveedores(JComboBox c1) {
        c1.removeAll();
        ArrayList<Proveedores> miArray = new ArrayList<>();
        try {
            ResultSet rs = AppProyecto.statement.executeQuery("select * from proveedores");
            
            while (rs.next()) {

                
                Proveedores user = new Proveedores();
                // read the result set
                try {
                    c1.addItem(rs.getString("nombre"));
                    user.setNombre(rs.getString("nombre"));
                    user.setCedula(rs.getString("cedula"));
                    user.setTipo(rs.getString("tipo"));

                } catch (Exception e) {

                }

                miArray.add(user);

            }
        } catch (Exception e) {

        }
        return miArray;
    }
public    ArrayList<Producto> getAllProducts(JComboBox c1) {
   
    ArrayList<Producto> miArray = null ;
    c1.removeAll();
    miArray = new ArrayList<>();
    try {
        ResultSet rs = AppProyecto.statement.executeQuery("select * from Articulo");
        
        while (rs.next()) {
            
            
            Producto product = new Producto();
            // read the result set
            try {
                c1.addItem(rs.getString("nombre"));
                product.setCodigoArticulo("codigoArticulo");
                product.setFamilia("familia");
                product.setPrecioDolar("precioDolar");
                product.setUsuarioInserta("usuarioInserta");
                product.setUsuarioActualiza("usuarioActualiza");
                product.setFechaUltimoUpdate("fechaUltimoUpdate");
                product.setCantidad("cantidad");
                product.setUnidadMedida("unidadMedida");
                product.setNombre("nombre");
                
            } catch (Exception e) {
                c1.addItem(rs.getString("what"));
            }
            
            miArray.add(product);
            
        }
    } catch (Exception e) {
        c1.addItem("Check This Error");
    }
    return miArray;
    }
    

}
