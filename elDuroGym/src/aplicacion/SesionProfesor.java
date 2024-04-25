package aplicacion;
import java.time.*;
import java.util.*;

public class SesionProfesor {

    private String nombreActividad;
    private String nombreAula;
    private String  fecha;
    private String hora;

    public SesionProfesor(String nombreActividad, String nombreAula, String fecha, String hora) {
        this.nombreActividad = nombreActividad;
        this.nombreAula = nombreAula;
        this.fecha = fecha;
        this.hora = hora;
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



}