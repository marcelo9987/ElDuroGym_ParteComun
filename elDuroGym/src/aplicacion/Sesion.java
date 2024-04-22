/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;
import java.time.*;

public class Sesion {
    private Aula id_aula;
    private Grupo id_grupo;
    private int  id_reserva;
    LocalDateTime fecha_hora_inicio;
    LocalDateTime fecha_hora_fin;
    String descripcion;
    
    public Sesion(Aula id_aula, Grupo id_grupo, int id_reserva, LocalDateTime fecha_hora_inicio, LocalDateTime fecha_hora_fin, String descripcion){
        this.id_aula = id_aula;
        this.id_grupo = id_grupo;
        this.id_reserva = id_reserva;
        this.fecha_hora_inicio = fecha_hora_inicio;
        this.fecha_hora_fin = fecha_hora_fin;
        this.descripcion = descripcion;
        
    }
    public Aula getId_Aula(){
        return this.id_aula;
    }
    public Grupo getId_Grupo(){
        return this.id_grupo;
    }
    public int getId_reserva(){
        return this.id_reserva;
    }
    public LocalDateTime getFecha_hora_inicio(){
        return this.fecha_hora_inicio;
    }
    public LocalDateTime getFecha_hora_fin(){
        return this.fecha_hora_fin;
    }
    public String getDescripcion(){
        return this.descripcion;
    }
}

