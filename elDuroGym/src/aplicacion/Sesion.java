/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;
import java.time.*;

public class Sesion {
//    private Aula id_aula;
//    private Grupo id_grupo;
//    private int id_aula;
    private Aula aula;
//    private int id_grupo;
    private Grupo grupo;
    private int  id_reserva;
    LocalDateTime fecha_hora_inicio;
    LocalDateTime fecha_hora_fin;
    String descripcion;
    
    public Sesion(Aula aula, Grupo grupo, int id_reserva, LocalDateTime fecha_hora_inicio, LocalDateTime fecha_hora_fin, String descripcion){
        this.aula = aula;
        this.grupo = grupo;
        this.id_reserva = id_reserva;
        this.fecha_hora_inicio = fecha_hora_inicio;
        this.fecha_hora_fin = fecha_hora_fin;
        this.descripcion = descripcion;
        
    }
    public Aula getAula(){
        return this.aula;
    }
    public Grupo getGrupo(){
        return this.grupo;
    }
    public int getIdReserva(){
        return this.id_reserva;
    }
    public LocalDateTime getFechaHoraInicio(){
        return this.fecha_hora_inicio;
    }
    public LocalDateTime getFechaHoraFin(){
        return this.fecha_hora_fin;
    }
    public String getDescripcion(){
        return this.descripcion;
    }
}

