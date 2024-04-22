/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;
import java.time.*;

public class Equipamiento {
    private Aula id_aula;
    private int id_equipamiento;
    private String nombre;
    private LocalDate fecha_mantenimiento;
    private String descripcion;
    public Equipamiento(Aula id_aula,int id_equipamiento,String nombre,LocalDate fecha_mantenimiento ,String descripcion ){
        this.id_equipamiento = id_equipamiento; 
        this.id_aula = id_aula;
        this.nombre = nombre;
        this.fecha_mantenimiento = fecha_mantenimiento;
        this.descripcion = descripcion;
    }
    public Aula id_aula(){
        return this.id_aula;
    }
    public int getId_Equipamiento(){
        return this.id_equipamiento;
    }
    public String getNombre(){
        return this.nombre;
    }
    public LocalDate getFecha_Mantenimiento(){
        return this.fecha_mantenimiento;
    }
    public String getDescripcion(){
        return this.descripcion;
    }
}
