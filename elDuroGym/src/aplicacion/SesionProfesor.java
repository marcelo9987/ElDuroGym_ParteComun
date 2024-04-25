package aplicacion;
import java.time.*;
import java.util.*;

public class SesionProfesor {

    private String nombreActividad;
    private String nombreAula;
    private String  fecha;
    private String hora;
    private String descripcion;

    public SesionProfesor(String nombreActividad, String nombreAula, String fecha, String hora, String descripcion) {
        this.nombreActividad = nombreActividad;
        this.nombreAula = nombreAula;
        this.fecha = fecha;
        this.hora = hora;
        this.descripcion = descripcion;
    }

    public String getNombreActividad() {
        return nombreActividad;
    }

    public void setNombreActividad(String nombreActividad) {
        this.nombreActividad = nombreActividad;
    }

    public String getNombreAula() {
        return nombreAula;
    }

    public void setNombreAula(String nombreAula) {
        this.nombreAula = nombreAula;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }



}