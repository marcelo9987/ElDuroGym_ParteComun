package baseDatos;
import aplicacion.*;
import aplicacion.TipoUsuario;
import misc.Criptografia;

import java.sql.*;
import java.util.List;

/**
 *
 * @author basesdatos
 */
public class DAOProfesor extends AbstractDAOs {
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

    @Deprecated
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

    public List<SesionProfesor> obtenerSesionesProfesor(String nickname, String nombreActividad, String nombreAula, String fecha, String hora, String descripcion) {
        Connection con;
        PreparedStatement stmSesionesProfesor= null;
        ResultSet rsSesionesProfesor;

        List<SesionProfesor> resultado = new java.util.ArrayList<>();
        try {
            con = this.getConexion();
            int index = 1; // Índice inicial para los parámetros

            String consulta = "SELECT "
                    + "A.Nombre as nombre_aula, "
                    + "AC.Nombre as nombre_actividad, "
                    + "DATE(S.fecha_hora_inicio) as fecha, "
                    + "CONCAT(TO_CHAR(EXTRACT(HOUR FROM S.Fecha_hora_inicio), 'FM00'), ':', TO_CHAR(EXTRACT(MINUTE FROM S.fecha_hora_inicio), 'FM00')) as hora "
                    + "Sdescripcion as descripcion, "
                    + "FROM "
                    + "Sesion as S "
                    + "JOIN "
                    + "Grupo as G on S.id_grupo = G.id_grupo "
                    + "JOIN "
                    + "Grupo_tiene_profesor as GC on G.id_grupo = GC.id_grupo "
                    + "JOIN "
                    + "Profesor as C on GC.id_cliente = C.id_cliente "
                    + "JOIN "
                    + "Persona as U on C.id_profesor = U.id_persona "
                    + "JOIN "
                    + "Actividad as AC on G.id_actividad = AC.id_actividad "
                    + "JOIN "
                    + "Aula as A on S.id_aula = A.id_aula "
                    + "WHERE "
                    + "U.nickname = ? ";

            if (!nombreActividad.isBlank() || !nombreActividad.isEmpty()) {
                consulta += "AND AC.nombre = ? ";
            }
            if (!nombreAula.isBlank() || !nombreAula.isEmpty()) {
                consulta += "AND A.nombre = ? ";
            }
            if (!fecha.isBlank() || !fecha.isEmpty()) {
                consulta += "AND DATE(S.fecha_hora_inicio) = CAST(? AS DATE) ";
            }
            if (!hora.isBlank() || !hora.isEmpty()) {
                consulta += "AND TO_CHAR(EXTRACT(HOUR FROM S.Fecha_hora_inicio), 'FM00') || ':' || TO_CHAR(EXTRACT(MINUTE FROM S.Fecha_hora_inicio), 'FM00') = ? ";
            }
            if (!descripcion.isBlank() || !descripcion.isEmpty()){
                consulta += "AND Sdescripcion = ? ";
            }


            stmSesionesProfesor = con.prepareStatement(consulta);


            stmSesionesProfesor.setString(index++, nickname);


            if (!nombreActividad.isBlank() || !nombreActividad.isEmpty()) {
                stmSesionesProfesor.setString(index++, nombreActividad);
            }

            if (!nombreAula.isBlank() || !nombreAula.isEmpty()) {
                stmSesionesProfesor.setString(index++, nombreAula);
            }
            if (!fecha.isBlank() || !fecha.isEmpty()) {
                stmSesionesProfesor.setString(index++, fecha);
            }
            if (!hora.isBlank() || !hora.isEmpty()) {
                stmSesionesProfesor.setString(index++, hora);
            }
            if (!descripcion.isBlank() || !descripcion.isEmpty()){
                stmSesionesProfesor.setString(index++, descripcion);
            }


            rsSesionesProfesor = stmSesionesProfesor.executeQuery();

            while (rsSesionesProfesor.next()) {

                SesionProfesor sesion = new SesionProfesor(
                        rsSesionesProfesor.getString("nombre_actividad"),
                        rsSesionesProfesor.getString("nombre_aula"),
                        rsSesionesProfesor.getString("fecha"),
                        rsSesionesProfesor.getString("hora"),
                        rsSesionesProfesor.getString("descripcion")
                );

                resultado.add(sesion);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            try {
                stmSesionesProfesor.close();
            } catch (SQLException e) {
                System.out.println("Imposible cerrar cursores");
            }
        }

        return resultado;
    }

}
