package baseDatos;
import aplicacion.*;
import aplicacion.TipoUsuario;
import misc.Criptografia;

import java.sql.*;
/**
 *
 * @author basesdatos
 */
public class DAOProfesor extends AbstractDAO {
    public DAOProfesor (Connection conexion, aplicacion.FachadaAplicacion fa){
        super.setConexion(conexion);
        super.setFachadaAplicacion(fa);
    }

    public java.util.List<Integer> consultarGrupos(int idProfesor) {
        java.util.List<Integer> gruposResultado = new java.util.ArrayList<>();
        Connection con = null;
        PreparedStatement stmGrupos = null;
        ResultSet rsGrupos = null;

        try {
            con = this.getConexion();
            stmGrupos = con.prepareStatement("SELECT id_grupo FROM grupo_tiene_profesor WHERE id_profesor = ?");
            stmGrupos.setInt(1, idProfesor);
            rsGrupos = stmGrupos.executeQuery();

            while (rsGrupos.next()) {
                int idGrupo = rsGrupos.getInt("id_grupo");
                gruposResultado.add(idGrupo);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            try {
                if (rsGrupos != null) {
                    rsGrupos.close();
                }
                if (stmGrupos != null) {
                    stmGrupos.close();
                }
            } catch (SQLException e) {
                System.out.println("Imposible cerrar cursores");
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    System.out.println("Imposible cerrar conexión");
                }
            }
        }
        return gruposResultado;
    }

    public java.util.List<Sesion> consultarSesiones(Integer id_profesor){
        java.util.List<Sesion> resultado = new java.util.ArrayList<>();
        Connection con = null;
        PreparedStatement stmSesiones = null;
        ResultSet rsSesiones = null;

        java.util.List<Integer> id_grupos = new java.util.ArrayList<>();
        try {
            // Obtener los identificadores de los grupos asociados al profesor
            id_grupos = consultarGrupos(id_profesor);

            // Realizar consulta para obtener las sesiones asociadas a los grupos
            con = this.getConexion();
            for (Integer idGrupo : id_grupos) {
                stmSesiones = con.prepareStatement("SELECT s.id_reserva\n" +
                        "     , s.fecha_hora_inicio\n" +
                        "     , s.fecha_hora_fin\n" +
                        "     , s.descripcion as descripcion_sesion\n" +
                        "     , s.id_aula\n" +
                        "     , a.nombre as nombre_aula\n" +
                        "     , a.aforo as aforo_aula\n" +
                        "     , s.id_grupo\n" +
                        "     , g.id_actividad\n" +
                        "     , ac.nombre as nombre_actividad\n" +
                        "     , ac.descripcion as descripcion_actividad\n" +
                        "     , ac.tipo as tipo_actividad\n" +
                        "\n" +
                        "FROM sesion as s\n" +
                        "         left join aula a\n" +
                        "                   ON s.id_aula = a.id_aula\n" +
                        "         left join grupo g\n" +
                        "                   ON s.id_grupo = g.id_grupo\n" +
                        "         left join actividad ac\n" +
                        "                   on g.id_actividad = ac.id_actividad\n" +
                        "\n" +
                        "WHERE s.id_grupo = ?");
                stmSesiones.setInt(1, idGrupo);
                rsSesiones = stmSesiones.executeQuery();

                while (rsSesiones.next()) {
                    //Creo el objeto aula que se añadirá a al sesión
                    Aula aula = new Aula(
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
                    Grupo grupo = new Grupo(
                            rsSesiones.getInt("id_grupo")
                            , actividad
                    );


                    // Crear objeto Sesion y añadirlo a la lista resultado
                    Sesion sesionActual = new Sesion(
//                            rsSesiones.getInt("id_aula")
//                            , rsSesiones.getInt("id_grupo")
//                            , rsSesiones.getInt("id_reserva")
                            aula
                            ,grupo
                            , rsSesiones.getInt("id_reserva")
                            , rsSesiones.getTimestamp("fecha_hora_inicio").toLocalDateTime()
                            , rsSesiones.getTimestamp("fecha_hora_fin").toLocalDateTime()
                            , rsSesiones.getString("descripcion")
                    );
                    resultado.add(sesionActual);
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (rsSesiones != null) {
                    rsSesiones.close();
                }
                if (stmSesiones != null) {
                    stmSesiones.close();
                }
            } catch (SQLException e) {
                System.out.println("Imposible cerrar cursores");
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    System.out.println("Imposible cerrar conexión");
                }
            }
        }
        return resultado;
    }

}
