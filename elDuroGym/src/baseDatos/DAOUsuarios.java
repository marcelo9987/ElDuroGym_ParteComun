/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package baseDatos;
import aplicacion.*;
import aplicacion.TipoUsuario;
import misc.Criptografia;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

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


        clave = Criptografia.cifrar(clave);

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
            System.out.println("DEBUG: "+"QUERY: " + rsUsuario.getString("id_persona") + " " + rsUsuario.getString("contrasenha") + " " + rsUsuario.getString("nombre") + " " + rsUsuario.getString("domicilio") + " " + rsUsuario.getString("correo") + " " + rsUsuario.getString("dni") + " " + rsUsuario.getString("nickname") + " " + tipoUsuario);

            if(tipoUsuario == TipoUsuario.NO_DEFINIDO){
                System.err.println("WARNING! [ desde DAOUsuarios --> validarUsuario ] Tipo de usuario no definido. No se puede crear el usuario.");
                return null;
            }

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
        java.util.List<Usuario> resultado = new java.util.ArrayList<>();
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

                String claveDescifrada = Criptografia.descifrar(rsUsuarios.getString("contrasenha"));

                switch(tipoUsuario){
                    case Administrador:
                        usuarioActual = new Administrador(rsUsuarios.getString("id_persona"), claveDescifrada,
                                rsUsuarios.getString("nombre"), rsUsuarios.getString("domicilio"),
                                rsUsuarios.getString("correo"),rsUsuarios.getString("dni"), rsUsuarios.getString("nickname"));
                        break;
                    case Cliente:
                        usuarioActual = new aplicacion.Cliente(rsUsuarios.getString("id_persona"), claveDescifrada,
                                rsUsuarios.getString("nombre"), rsUsuarios.getString("domicilio"),
                                rsUsuarios.getString("correo"),rsUsuarios.getString("dni"), rsUsuarios.getString("nickname"));
                        break;
                    case Profesor:
                        usuarioActual = new Profesor(rsUsuarios.getString("id_persona"), claveDescifrada,
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


    public List<Sesion> obtenerSesiones(Integer numero, String aula, String fecha, String grupo, String profesor)
    {
        Connection con;
        PreparedStatement stmSesiones = null;
        ResultSet rsSesiones;

        List <Sesion> resultado = new java.util.ArrayList<>();
        try {
            con = this.getConexion();

            boolean yaHeEmpezadoAprocesar = false;

            String consulta = "select " +
                    "s.id_reserva"+
                    ", s.fecha_hora_inicio"+
                    ", s.fecha_hora_fin"+
                    ", s.descripcion as descripcion_sesion"+
                    ", s.id_aula"+
                    ", a.nombre as nombre_aula"+
                    ", a.aforo as aforo_aula"+
                    ", s.id_grupo"+
                    ", g.id_actividad"+
                    ", ac.nombre as nombre_actividad"+
                    ", ac.descripcion as descripcion_actividad"+
                    ", ac.tipo as tipo_actividad "+

                    "from sesion as s " +
                    "left join aula as a" +
                    "   on s.id_aula = a.id_aula " +
                    "left join grupo as g " +
                    "   on s.id_grupo = g.id_grupo " +
                    "left join actividad as ac " +
                    "   on g.id_actividad = ac.id_actividad ";

            consulta += "where ";
            if (numero!=null) {
                consulta += "s.id_reserva = ?";
                yaHeEmpezadoAprocesar = true;
            }
            if (!aula.isEmpty()) {
                if (yaHeEmpezadoAprocesar) {
                    consulta += "and ";
                }
                consulta += "a.nombre like ? ";
                yaHeEmpezadoAprocesar = true;
            }
            if (!fecha.isEmpty()) {
                if (yaHeEmpezadoAprocesar) {
                    consulta += "and ";
                }
                consulta += "s.fecha_hora_inicio like ? ";
                yaHeEmpezadoAprocesar = true;
            }
            if (!grupo.isEmpty()) {
                if (yaHeEmpezadoAprocesar) {
                    consulta += "and ";
                }
                consulta += "g.nombre like ? ";
                yaHeEmpezadoAprocesar = true;
            }

            if (!profesor.isEmpty()) {
                if (yaHeEmpezadoAprocesar) {
                    consulta += "and ";
                }
                consulta += "p.nombre like ? ";
            }

            stmSesiones = con.prepareStatement(consulta);
            

            int posArgumento = 1;
            if (numero!=null) {
                stmSesiones.setInt(1,  numero );
                posArgumento++;
            }
            if (!aula.isEmpty()) {
                stmSesiones.setString(posArgumento, aula);
                posArgumento++;
            }
            if (!fecha.isEmpty()) {
                stmSesiones.setString(posArgumento, "%" + fecha + "%");
                posArgumento++;
            }
            if (!grupo.isEmpty()) {
                stmSesiones.setString(posArgumento, "%" + grupo + "%");
                posArgumento++;
            }
            if (!profesor.isEmpty()) {
                stmSesiones.setString(posArgumento, "%" + profesor + "%");
            }

            rsSesiones = stmSesiones.executeQuery();


            while (rsSesiones.next())
            {
                //Creo el objeto aula que se añadirá a al sesión
                Aula aulaActual = new Aula(
                        rsSesiones.getInt("id_aula")
                        , rsSesiones.getString("nombre_aula")
                        , rsSesiones.getInt("aforo_aula")
                );

                // Crear objeto Actividad que añadiré al aún no creado grupo
                Actividad actividad = new Actividad(
                        rsSesiones.getInt("id_actividad")
                        , rsSesiones.getString("nombre_actividad")
                        , rsSesiones.getString("descripcion_actividad")
                        , rsSesiones.getString("tipo_actividad")
                );

                // Crear objeto Grupo y añadirle la actividad
                Grupo grupoActual = new Grupo(
                        rsSesiones.getInt("id_grupo")
                        , actividad
                );

                //Sesion
                Sesion sesionActual = new Sesion(
                        aulaActual
                        , grupoActual
                        , rsSesiones.getInt("id_reserva")
                        , rsSesiones.getTimestamp("fecha_hora_inicio").toLocalDateTime()
                        , rsSesiones.getTimestamp("fecha_hora_fin").toLocalDateTime()
                        , rsSesiones.getString("descripcion_sesion")
                );


                resultado.add(sesionActual);


            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            try {
                stmSesiones.close();
            } catch (SQLException e) {
                System.out.println("Imposible cerrar cursores");
            }
        }
        
        return resultado;
    }
    
    public List<SesionCliente> obtenerSesionesCliente (String nickname, String nombreActividad, String nombreAula, String fecha, String hora){
        Connection con;
        PreparedStatement stmSesionesCliente = null;
        ResultSet rsSesionesCliente;

        List <SesionCliente> resultado = new java.util.ArrayList<>();
        try {
            con = this.getConexion();
            int index = 1; // Índice inicial para los parámetros

            String consulta = "SELECT "
                    + "A.Nombre as nombre_aula, "
                    + "AC.Nombre as nombre_actividad, "
                    + "DATE(S.fecha_hora_inicio) as fecha, "
                    + "CONCAT(TO_CHAR(EXTRACT(HOUR FROM S.Fecha_hora_inicio), 'FM00'), ':', TO_CHAR(EXTRACT(MINUTE FROM S.fecha_hora_inicio), 'FM00')) as hora "
                    + "FROM "
                    + "Sesion as S "
                    + "JOIN "
                    + "Grupo as G on S.id_grupo = G.id_grupo "
                    + "JOIN "
                    + "Grupo_tiene_cliente as GC on G.id_grupo = GC.id_grupo "
                    + "JOIN "
                    + "Cliente as C on GC.id_cliente = C.id_cliente "
                    + "JOIN "
                    + "Persona as U on C.id_cliente = U.id_persona "
                    + "JOIN "
                    + "Actividad as AC on G.id_actividad = AC.id_actividad "
                    + "JOIN "
                    + "Aula as A on S.id_aula = A.id_aula "
                    + "WHERE "
                    + "U.nickname = ? ";
            
            if (!nombreActividad.isBlank() || !nombreActividad.isEmpty()){
                consulta += "AND AC.nombre = ? ";
            }
            if (!nombreAula.isBlank() || !nombreAula.isEmpty()){
                consulta += "AND A.nombre = ? ";
            }
            if (!fecha.isBlank() || !fecha.isEmpty()){
                consulta += "AND DATE(S.fecha_hora_inicio) = CAST(? AS DATE) ";
            }
            if (!hora.isBlank() || !hora.isEmpty()){
                consulta += "AND TO_CHAR(EXTRACT(HOUR FROM S.Fecha_hora_inicio), 'FM00') || ':' || TO_CHAR(EXTRACT(MINUTE FROM S.Fecha_hora_inicio), 'FM00') = ? ";
            }
                        
            
            stmSesionesCliente = con.prepareStatement(consulta);

 
                stmSesionesCliente.setString(index++, nickname);

            
            if (!nombreActividad.isBlank() || !nombreActividad.isEmpty()){
                stmSesionesCliente.setString(index++, nombreActividad);
            }

            if (!nombreAula.isBlank() || !nombreAula.isEmpty()){
                stmSesionesCliente.setString(index++, nombreAula);
            }
            if (!fecha.isBlank() || !fecha.isEmpty()){
                stmSesionesCliente.setString(index++, fecha);
            }
            if (!hora.isBlank() || !hora.isEmpty()){
                stmSesionesCliente.setString(index++, hora);
            }

            
            rsSesionesCliente = stmSesionesCliente.executeQuery();
            
            while (rsSesionesCliente.next()){
               
                SesionCliente sesion = new SesionCliente (
                        rsSesionesCliente.getString("nombre_actividad"),
                        rsSesionesCliente.getString("nombre_aula"),
                        rsSesionesCliente.getString("fecha"),
                        rsSesionesCliente.getString("hora")
                );
                
                resultado.add (sesion);
            }
    }catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            try {
                stmSesionesCliente.close();
            } catch (SQLException e) {
                System.out.println("Imposible cerrar cursores");
            }
        }

        return resultado;
    }
}
