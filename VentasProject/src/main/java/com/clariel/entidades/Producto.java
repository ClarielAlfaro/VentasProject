package com.clariel.entidades;

public class Producto {
	
	protected int idProducto;
	protected int id_categoria;
	protected int id_proveedor;
	protected String nombre_producto;
	protected int cantidad;
	protected double costo;
	protected double precio;
	
	public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }
    
    public int getIdCategoria() {
        return id_categoria;
    }

    public void setIdCategoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }
    
    public int getIdProveedor() {
        return id_proveedor;
    }

    public void setIdProveedor(int id_proveedor) {
        this.id_proveedor = id_proveedor;
    }
    
    public String getNombre_Producto() {
        return nombre_producto;
    }

    public void setNombre_Producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }
    
    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

}
