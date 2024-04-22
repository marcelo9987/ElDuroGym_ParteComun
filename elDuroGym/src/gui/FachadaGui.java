/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package gui;

import aplicacion.TipoUsuario;

/**
 *
 * @author alumnogreibd
 */
public class FachadaGui {
    aplicacion.FachadaAplicacion fa;
    VUsuario vp;
    
   public FachadaGui(aplicacion.FachadaAplicacion fa){
     this.fa=fa;
     this.vp = new VUsuario(fa);
   } 
    
    
    
    public void iniciaVista(){
      VAutentificacion va;
    
      va = new VAutentificacion(vp, true, fa,this);
      vp.setVisible(true);
      va.setVisible(true);
    }
    
    public void muestraExcepcion(String txtExcepcion){
       VAviso va;
       
       va = new VAviso(vp, true, txtExcepcion);
       va.setVisible(true);
    }

    public void actualizarNivelAccesoMenuPrincipal(TipoUsuario nivelAcceso){
        vp.actualizarNivelAcceso(nivelAcceso);
    }

}
