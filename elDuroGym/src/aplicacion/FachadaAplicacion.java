/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package aplicacion;

import controladores.GestionUsuarios;

import java.util.List;

/**
 *
 * @author alumnogreibd
 */
public class FachadaAplicacion {

    gui.FachadaGui fgui;
    baseDatos.FachadaBaseDatoss fbd;
    GestionUsuarios cu;
    TipoUsuario nivelAcceso;
    public FachadaAplicacion() {
        fgui = new gui.FachadaGui(this);
        fbd = new baseDatos.FachadaBaseDatoss(this);
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

    public List<Sesion> obtenerSesiones(Integer numero, String aula, String fecha, String grupo, String profesor)
    {
        return cu.obtenerSesiones(numero, aula, fecha, grupo, profesor);
    }
    
    public List<SesionCliente> obtenerSesionesCliente (String nickname, String nombreActividad, String nombreAula, String fecha, String hora){
        return cu.obtenerSesionesCliente(nickname, nombreActividad, nombreAula, fecha, hora);
    }

    public List<SesionProfesor> obtenerSesionesProfesor (String nickname, String nombreActividad, String nombreAula, String fecha, String hora, String descripcion){
        return cu.obtenerSesionesProfesor(nickname, nombreActividad, nombreAula, fecha, hora, descripcion);
    }
}
