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
public class FacturaCompra {
    
    
    String numeroFactura;
    String codigoArticulo;
    String precioArticulo;
    String usuarioInserta;
    String proveedor;
    String fechaCompra;
    String unidadMedida;    
    String cantidad;
    String nombre;

    public FacturaCompra() {
    }

    public FacturaCompra(String numeroFactura, String codigoArticulo, String precioArticulo, String usuarioInserta, String proveedor, String fechaCompra, String unidadMedida, String cantidad,String nombre) {
        this.numeroFactura = numeroFactura;
        this.codigoArticulo = codigoArticulo;
        this.precioArticulo = precioArticulo;
        this.usuarioInserta = usuarioInserta;
        this.proveedor = proveedor;
        this.fechaCompra = fechaCompra;
        this.unidadMedida = unidadMedida;
        this.cantidad = cantidad;
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNumeroFactura() {
        return numeroFactura;
    }

    public void setNumeroFactura(String numeroFactura) {
        this.numeroFactura = numeroFactura;
    }

    public String getCodigoArticulo() {
        return codigoArticulo;
    }

    public void setCodigoArticulo(String codigoArticulo) {
        this.codigoArticulo = codigoArticulo;
    }

    public String getPrecioArticulo() {
        return precioArticulo;
    }

    public void setPrecioArticulo(String precioArticulo) {
        this.precioArticulo = precioArticulo;
    }

    public String getUsuarioInserta() {
        return usuarioInserta;
    }

    public void setUsuarioInserta(String usuarioInserta) {
        this.usuarioInserta = usuarioInserta;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getUnidadMedida() {
        return unidadMedida;
    }

    public void setUnidadMedida(String unidadMedida) {
        this.unidadMedida = unidadMedida;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    
   
}
