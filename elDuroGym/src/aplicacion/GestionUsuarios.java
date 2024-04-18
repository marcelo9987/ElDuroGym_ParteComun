/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;

import baseDatos.FachadaBaseDatos;
import gui.FachadaGui;

/**
 *
 * @author alumnogreibd
 */
public class GestionUsuarios {
     FachadaGui fgui;
    FachadaBaseDatos fbd;
    
   
    public GestionUsuarios(FachadaGui fgui, FachadaBaseDatos fbd){
     this.fgui=fgui;
     this.fbd=fbd;
    }  
    
    
  public Boolean comprobarAutentificacion(String idUsuario, String clave){
      Usuario u;

      u=fbd.validarUsuario(idUsuario, clave);
      if (u!=null){
          return u.getTipoUsuario()==TipoUsuario.Administrador;
      } else return false;
  }
  
  public void nuevoUsuario(Usuario u){
        this.fbd.insertarUsuario(u);
    }
    
  public boolean borrarUsuario(String idUsuario){
        return this.fbd.borrarUsuario(idUsuario);
    }    
    
    public Usuario consultarUsuario(String id){
        return fbd.consultarUsuario(id);
    }
    
     
    public void editarUsuario(String id,Usuario u){
        this.fbd.editarUsuario(id,u);
    }
    
    public java.util.List<Usuario> obtenerUsuarios(String id, String nombre){
        return fbd.consultarUsuarios(id,nombre);
    }
}
