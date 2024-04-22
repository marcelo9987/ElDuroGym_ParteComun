/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package aplicacion;

import controladores.GestionUsuarios;

/**
 *
 * @author alumnogreibd
 */
public class FachadaAplicacion {

    gui.FachadaGui fgui;
    baseDatos.FachadaBaseDatos fbd;
    GestionUsuarios cu;
    TipoUsuario nivelAcceso;
    public FachadaAplicacion() {
        fgui = new gui.FachadaGui(this);
        fbd = new baseDatos.FachadaBaseDatos(this);
        cu = new GestionUsuarios(fgui,fbd);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        FachadaAplicacion fa;

        fa = new FachadaAplicacion();
        fa.iniciaInterfazUsuario();
    }

    public void iniciaInterfazUsuario() {
        fgui.iniciaVista();
    }

    public void muestraExcepcion(String e) {
        fgui.muestraExcepcion(e);
    }

    public TipoUsuario comprobarAutentificacion(String nickName, String clave) {
        return cu.comprobarAutentificacion(nickName, clave);
    }

    public TipoUsuario getNivelAcceso() {
        return nivelAcceso;
    }
    public void setNivelAcceso(TipoUsuario nivelAcceso) {
        this.nivelAcceso = nivelAcceso;
    }
}
