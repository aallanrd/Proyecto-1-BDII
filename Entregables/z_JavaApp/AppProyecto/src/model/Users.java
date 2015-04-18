package model;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Allan
 */
public class Users {
    
    
    private String nombre;
    private String cedula;
    private String pass;
    private String username;
    
    private String foto;
    private String fecha_inicio;
    private String pago_mensual;
    private String tipo;

    public Users() {
    }

    public Users(String nombre, String cedula, String pass, String username, String foto, String fecha_inicio, String pago_mensual,String tipo) {
        this.nombre = nombre;
        this.cedula = cedula;
        this.pass = pass;
        this.username = username;
        this.foto = foto;
        this.fecha_inicio = fecha_inicio;
        this.pago_mensual = pago_mensual;
        this.tipo = tipo;
    }
  ///////////////////////////////////////////////////////////////////////////////////////////////////

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getPago_mensual() {
        return pago_mensual;
    }

    public void setPago_mensual(String pago_mensual) {
        this.pago_mensual = pago_mensual;
    }
    
    
    
}
