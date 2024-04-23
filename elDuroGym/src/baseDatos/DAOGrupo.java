package baseDatos;
import aplicacion.*;
import aplicacion.TipoUsuario;
import misc.Criptografia;

import java.sql.*;
/**
 *
 * @author basesdatos
 */
public class DAOGrupo extends AbstractDAO {
    public DAOGrupo(Connection conexion, aplicacion.FachadaAplicacion fa) {
        super.setConexion(conexion);
        super.setFachadaAplicacion(fa);
    }

    public void insertarGrupo(Grupo g) {
        Connection con = null;
        PreparedStatement stmInsertar = null;

        try {
            con = this.getConexion();
            stmInsertar = con.prepareStatement("INSERT INTO Grupo (id_grupo, id_actividad) VALUES (?, ?)");
            stmInsertar.setInt(1, g.getId_Grupo());
            stmInsertar.setInt(2, g.getActividad().getId_Actividad());
            stmInsertar.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (stmInsertar != null) {
                    stmInsertar.close();
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
    }
}