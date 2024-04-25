package baseDatos;
import aplicacion.*;
import aplicacion.TipoUsuario;
import misc.Criptografia;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        Connection con = null;
        PreparedStatement stmSesionesProfesor = null;
        ResultSet rsSesionesProfesor = null;

        List<SesionProfesor> resultado = new ArrayList<>();
        try {
            con = this.getConexion();

            // Preparar la consulta SQL
            StringBuilder consulta = new StringBuilder();
            consulta.append("SELECT A.Nombre as nombre_aula, ")
                    .append("AC.Nombre as nombre_actividad, ")
                    .append("DATE(S.fecha_hora_inicio) as fecha, ")
                    .append("CONCAT(TO_CHAR(EXTRACT(HOUR FROM S.Fecha_hora_inicio), 'FM00'), ':', TO_CHAR(EXTRACT(MINUTE FROM S.fecha_hora_inicio), 'FM00')) as hora, ")
                    .append("AC.descripcion ")
                    .append("FROM Sesion as S ")
                    .append("JOIN Grupo as G on S.id_grupo = G.id_grupo ")
                    .append("JOIN Grupo_tiene_profesor as GP on G.id_grupo = GP.id_grupo ")
                    .append("JOIN Profesor as PR on GP.id_profesor = PR.id_profesor ")
                    .append("JOIN Persona as P on PR.id_profesor = P.id_persona ")
                    .append("JOIN Actividad as AC on G.id_actividad = AC.id_actividad ")
                    .append("JOIN Aula as A on S.id_aula = A.id_aula  ")
                    .append("WHERE P.nickname = ? ");

            if (!nombreActividad.isBlank()) {
                consulta.append("AND AC.nombre = ? ");
            }
            if (!nombreAula.isBlank()) {
                consulta.append("AND A.nombre = ? ");
            }
            if (!fecha.isBlank()) {
                consulta.append("AND DATE(S.fecha_hora_inicio) = ? ");
            }
            if (!hora.isBlank()) {
                consulta.append("AND TO_CHAR(EXTRACT(HOUR FROM S.Fecha_hora_inicio), 'FM00') || ':' || TO_CHAR(EXTRACT(MINUTE FROM S.Fecha_hora_inicio), 'FM00') = ? ");
            }
            if (!descripcion.isBlank()) {
                consulta.append("AND AC.descripcion = ? ");
            }

            stmSesionesProfesor = con.prepareStatement(consulta.toString());

            // Asignar parámetros
            int index = 1;
            stmSesionesProfesor.setString(index++, nickname);
            if (!nombreActividad.isBlank()) {
                stmSesionesProfesor.setString(index++, nombreActividad);
            }
            if (!nombreAula.isBlank()) {
                stmSesionesProfesor.setString(index++, nombreAula);
            }
            if (!fecha.isBlank()) {
                // Suponiendo que 'fecha' está en formato "yyyy-MM-dd"
                Date fechaDate = Date.valueOf(fecha);
                stmSesionesProfesor.setDate(index++, fechaDate);
            }
            if (!hora.isBlank()) {
                stmSesionesProfesor.setString(index++, hora);
            }
            if (!descripcion.isBlank()) {
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
                // Cerrar recursos
                if (rsSesionesProfesor != null) {
                    rsSesionesProfesor.close();
                }
                if (stmSesionesProfesor != null) {
                    stmSesionesProfesor.close();
                }
            } catch (SQLException e) {
                System.out.println("Imposible cerrar cursores");
            }
        }
        return resultado;
    }

}
