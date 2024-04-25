package baseDatos;

import aplicacion.SesionCliente;
import baseDatos.AbstractDAOs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class DAOClientes extends AbstractDAOs
{
    public DAOClientes(Connection conexion, aplicacion.FachadaAplicacion fa)
    {
        super.setConexion(conexion);
        super.setFachadaAplicacion(fa);
    }

    public List<SesionCliente> obtenerSesionesCliente(String nickname, String nombreActividad, String nombreAula, String fecha, String hora) {
        Connection con;
        PreparedStatement stmSesionesCliente = null;
        ResultSet rsSesionesCliente;

        List<SesionCliente> resultado = new java.util.ArrayList<>();
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


            stmSesionesCliente = con.prepareStatement(consulta);


            stmSesionesCliente.setString(index++, nickname);


            if (!nombreActividad.isBlank() || !nombreActividad.isEmpty()) {
                stmSesionesCliente.setString(index++, nombreActividad);
            }

            if (!nombreAula.isBlank() || !nombreAula.isEmpty()) {
                stmSesionesCliente.setString(index++, nombreAula);
            }
            if (!fecha.isBlank() || !fecha.isEmpty()) {
                stmSesionesCliente.setString(index++, fecha);
            }
            if (!hora.isBlank() || !hora.isEmpty()) {
                stmSesionesCliente.setString(index++, hora);
            }


            rsSesionesCliente = stmSesionesCliente.executeQuery();

            while (rsSesionesCliente.next()) {

                SesionCliente sesion = new SesionCliente(
                        rsSesionesCliente.getString("nombre_actividad"),
                        rsSesionesCliente.getString("nombre_aula"),
                        rsSesionesCliente.getString("fecha"),
                        rsSesionesCliente.getString("hora")
                );

                resultado.add(sesion);
            }
        } catch (SQLException e) {
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
