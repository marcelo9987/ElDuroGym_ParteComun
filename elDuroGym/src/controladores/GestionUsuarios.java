/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controladores;

import aplicacion.Sesion;
import aplicacion.SesionCliente;
import aplicacion.SesionProfesor;
import aplicacion.TipoUsuario;
import aplicacion.Usuario;
import baseDatos.FachadaBaseDatoss;
import gui.FachadaGui;

import java.util.List;

/**
 *
 * @author alumnogreibd
 */
public class GestionUsuarios {
     FachadaGui fgui;
    FachadaBaseDatoss fbd;
    
   
    public GestionUsuarios(FachadaGui fgui, FachadaBaseDatoss fbd){
     this.fgui=fgui;
     this.fbd=fbd;
    }  
    
    
  public TipoUsuario comprobarAutentificacion(String nickname, String clave){
      Usuario u;

      u=fbd.validarUsuario(nickname, clave);
      if(u==null) {
          return TipoUsuario.NO_DEFINIDO;
      }
      return switch (u.getClass().getSimpleName()) {
          case "Administrador" -> TipoUsuario.Administrador;
          case "Cliente" -> TipoUsuario.Cliente;
          case "Profesor" -> TipoUsuario.Profesor;
          default -> TipoUsuario.NO_DEFINIDO;
      };
  }

    
    public java.util.List<Usuario> obtenerUsuarios(String id, String nombre){
        return fbd.consultarUsuarios(id,nombre);
    }

    public List<Sesion> obtenerSesiones(Integer numero, String aula, String fecha, String grupo, String profesor) {
        return fbd.obtenerSesiones(numero, aula, fecha, grupo, profesor);
    }
    
    public List<SesionCliente> obtenerSesionesCliente (String nickname, String nombreActividad, String nombreAula, String fecha, String hora){
        return fbd.obtenerSesionesCliente(nickname, nombreActividad, nombreAula, fecha, hora);
    }

    public List<SesionProfesor> obtenerSesionesProfesor (String nickname, String nombreActividad, String nombreAula, String fecha, String hora, String descripcion){
        return fbd.obtenerSesionesProfesor(nickname, nombreActividad, nombreAula, fecha, hora,descripcion);
    }

}
