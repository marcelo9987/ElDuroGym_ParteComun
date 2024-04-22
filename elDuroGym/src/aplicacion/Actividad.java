/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;


public class Actividad {
    private int id_actividad;
    private String nombre;
    private String descripcion;
    private String tipo;
    
    public Actividad(int id_actividad,String nombre,String descripcion,String tipo){
        this.id_actividad = id_actividad;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.tipo = tipo;
    }
    public int getId_Actividad(){
        return this.id_actividad;
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
