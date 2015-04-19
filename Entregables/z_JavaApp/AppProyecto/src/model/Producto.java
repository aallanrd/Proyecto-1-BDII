/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Allan
 */
public class Producto {
    
    String codigoArticulo;
    String familia;
    String precioDolar;
    String usuarioInserta;
    String usuarioActualiza;
    String fechaUltimoUpdate;
    String cantidad;
    String unidadMedida;
    String nombre;

    public Producto() {
    }

    public Producto(String codigoArticulo, String familia, String precioDolar, String usuarioInserta, String usuarioActualiza, String fechaUltimoUpdate, String cantidad, String unidadMedida, String nombre) {
        this.codigoArticulo = codigoArticulo;
        this.familia = familia;
        this.precioDolar = precioDolar;
        this.usuarioInserta = usuarioInserta;
        this.usuarioActualiza = usuarioActualiza;
        this.fechaUltimoUpdate = fechaUltimoUpdate;
        this.cantidad = cantidad;
        this.unidadMedida = unidadMedida;
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    public String getCodigoArticulo() {
        return codigoArticulo;
    }

    public void setCodigoArticulo(String codigoArticulo) {
        this.codigoArticulo = codigoArticulo;
    }

    public String getFamilia() {
        return familia;
    }

    public void setFamilia(String familia) {
        this.familia = familia;
    }

    public String getPrecioDolar() {
        return precioDolar;
    }

    public void setPrecioDolar(String precioDolar) {
        this.precioDolar = precioDolar;
    }

    public String getUsuarioInserta() {
        return usuarioInserta;
    }

    public void setUsuarioInserta(String usuarioInserta) {
        this.usuarioInserta = usuarioInserta;
    }

    public String getUsuarioActualiza() {
        return usuarioActualiza;
    }

    public void setUsuarioActualiza(String usuarioActualiza) {
        this.usuarioActualiza = usuarioActualiza;
    }

    public String getFechaUltimoUpdate() {
        return fechaUltimoUpdate;
    }

    public void setFechaUltimoUpdate(String fechaUltimoUpdate) {
        this.fechaUltimoUpdate = fechaUltimoUpdate;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getUnidadMedida() {
        return unidadMedida;
    }

    public void setUnidadMedida(String unidadMedida) {
        this.unidadMedida = unidadMedida;
    }
    
    
    
}
