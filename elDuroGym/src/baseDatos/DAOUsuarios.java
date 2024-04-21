/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package baseDatos;
import aplicacion.*;
import aplicacion.TipoUsuario;
import java.sql.*;
/**
 *
 * @author basesdatos
 */
public class DAOUsuarios extends AbstractDAO {

   public DAOUsuarios (Connection conexion, aplicacion.FachadaAplicacion fa){
        super.setConexion(conexion);
        super.setFachadaAplicacion(fa);
    }

   //Miramos si está en persona
    public Usuario validarUsuario(String nickname, String clave){
        Usuario resultado=null;
        Connection con;
        PreparedStatement stmUsuario=null;
        ResultSet rsUsuario;

        con=this.getConexion();

        try {
        stmUsuario=con.prepareStatement(
                "SELECT p.id_persona"+
                        ", CASE WHEN a.id_administrador IS NOT NULL THEN true ELSE false END AS \"esAdministrador\" " +
                        ", CASE WHEN c.id_cliente IS NOT NULL THEN true ELSE false END AS \"esCliente\" "+
                        ", CASE WHEN pr.id_profesor IS NOT NULL THEN true ELSE false END AS \"esProfesor\" "+
                        ", p.contrasenha "+
                        ", p.nombre "+
                        ", p.domicilio "+
                        ", p.correo "+
                        " , p.dni "+
                        ", p.nickname "+
                " FROM persona as p "+
                    "left join administrador as a "+
                            "ON p.id_persona = a.id_administrador "+
                    "left join cliente as c "+
                            "ON p.id_persona = c.id_cliente "+
                    "left join profesor as pr "+
                            "ON p.id_persona = pr.id_profesor "
                + "WHERE p.nickname LIKE ? AND p.contrasenha LIKE ?"
        );
        stmUsuario.setString(1, nickname);
        stmUsuario.setString(2, clave);
        rsUsuario=stmUsuario.executeQuery();
        if (rsUsuario.next())
        {
            //todo: Esto es un code smell como una casa, pero no tengo tiempo para refactorizarlo. Lo suyo sería que saliera de una forma más limpia
            TipoUsuario tipoUsuario = rsUsuario.getBoolean("esAdministrador") ? TipoUsuario.Administrador :
                                      rsUsuario.getBoolean("esCliente") ? TipoUsuario.Cliente :
                                      rsUsuario.getBoolean("esProfesor") ? TipoUsuario.Profesor : TipoUsuario.NO_DEFINIDO;
            System.out.println("QUERY: " + rsUsuario.getString("id_persona") + " " + rsUsuario.getString("contrasenha") + " " + rsUsuario.getString("nombre") + " " + rsUsuario.getString("domicilio") + " " + rsUsuario.getString("correo") + " " + rsUsuario.getString("dni") + " " + rsUsuario.getString("nickname") + " " + tipoUsuario);
            switch(tipoUsuario){
                case Administrador:
                    resultado = new Administrador(rsUsuario.getString("id_persona"), rsUsuario.getString("contrasenha"),
                                      rsUsuario.getString("nombre"), rsUsuario.getString("domicilio"),
                                      rsUsuario.getString("correo"),rsUsuario.getString("dni"), rsUsuario.getString("nickname"));
                    break;
                case Cliente:
                    resultado = new aplicacion.Cliente(rsUsuario.getString("id_persona"), rsUsuario.getString("contrasenha"),
                            rsUsuario.getString("nombre"), rsUsuario.getString("domicilio"),
                            rsUsuario.getString("correo"),rsUsuario.getString("dni"), rsUsuario.getString("nickname"));
                    break;
                case Profesor:
                    resultado = new Profesor(rsUsuario.getString("id_persona"), rsUsuario.getString("contrasenha"),
                            rsUsuario.getString("nombre"), rsUsuario.getString("domicilio"),
                            rsUsuario.getString("correo"),rsUsuario.getString("dni"), rsUsuario.getString("nickname"));
                    break;
                default:
                    System.err.println("WARNING! [ desde DAOUsuarios --> validarUsuario ] Tipo de usuario no definido");
                    return null;
            }
//            resultado = new Usuario(rsUsuario.getString("id_persona"), rsUsuario.getString("contrasenha"),
//                                      rsUsuario.getString("nombre"), rsUsuario.getString("domicilio"),
//                                      rsUsuario.getString("correo"),rsUsuario.getString("dni"), rsUsuario.getString("nickname"));

        }
        } catch (SQLException e){
          System.out.println(e.getMessage());
          this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        }finally{
          try {stmUsuario.close();} catch (SQLException e){System.out.println("Imposible cerrar cursores");}
        }
        return resultado;
    }
    

    public java.util.List<Usuario> consultarUsuarios(String id, String nombre){
        java.util.List<Usuario> resultado = new java.util.ArrayList<Usuario>();
        Usuario usuarioActual;
        Connection con;
        PreparedStatement stmUsuarios = null;
        ResultSet rsUsuarios;
        
        con = this.getConexion();
        
        String consulta = "select id_persona, nombre, dni, correo, domicilio, nickname, contrasenha "+
                                "from personna as u " +
                                "where id_persona like ? " +
                                " and nombre like ?";

        try{
            stmUsuarios = con.prepareStatement(consulta);
            stmUsuarios.setString(1, "%"+id+"%");
            stmUsuarios.setString(2, "%"+nombre+"%");
            rsUsuarios = stmUsuarios.executeQuery();
            
            while (rsUsuarios.next()){
                TipoUsuario tipoUsuario = rsUsuarios.getBoolean("esAdministrador") ? TipoUsuario.Administrador :
                        rsUsuarios.getBoolean("esCliente") ? TipoUsuario.Cliente :
                                rsUsuarios.getBoolean("esProfesor") ? TipoUsuario.Profesor : TipoUsuario.NO_DEFINIDO;

                switch(tipoUsuario){
                    case Administrador:
                        usuarioActual = new Administrador(rsUsuarios.getString("id_persona"), rsUsuarios.getString("contrasenha"),
                                rsUsuarios.getString("nombre"), rsUsuarios.getString("domicilio"),
                                rsUsuarios.getString("correo"),rsUsuarios.getString("dni"), rsUsuarios.getString("nickname"));
                        break;
                    case Cliente:
                        usuarioActual = new aplicacion.Cliente(rsUsuarios.getString("id_persona"), rsUsuarios.getString("contrasenha"),
                                rsUsuarios.getString("nombre"), rsUsuarios.getString("domicilio"),
                                rsUsuarios.getString("correo"),rsUsuarios.getString("dni"), rsUsuarios.getString("nickname"));
                        break;
                    case Profesor:
                        usuarioActual = new Profesor(rsUsuarios.getString("id_persona"), rsUsuarios.getString("contrasenha"),
                                rsUsuarios.getString("nombre"), rsUsuarios.getString("domicilio"),
                                rsUsuarios.getString("correo"),rsUsuarios.getString("dni"), rsUsuarios.getString("nickname"));
                        break;
                    default:
                        System.err.println("WARNING! [ desde DAOUsuarios --> consultarUsuarios ] Tipo de usuario no definido. Sigo iterando.");
                        continue;
                }

                resultado.add(usuarioActual);
            }
        }
        catch (SQLException e){
          System.out.println(e.getMessage());
          this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        }finally{
          try {stmUsuarios.close();} catch (SQLException e){System.out.println("Imposible cerrar cursores");}
        }
        return resultado;
    }

  

   
}
