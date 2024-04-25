/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;


public class Actividad {
    private final int idActividad;
    private final String nombre;
    private final String descripcion;
    private final String tipo;
    
    public Actividad(int idActividad,String nombre,String descripcion,String tipo){
        this.idActividad = idActividad;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.tipo = tipo;
    }
    public int getIdActividad(){
        return this.idActividad;
    }
    public String getNombre(){
         return this.nombre;
    }
    public String getDescripcion(){
        return this.descripcion;
    }
    public String getTipo(){
        return this.tipo;
    }
}
