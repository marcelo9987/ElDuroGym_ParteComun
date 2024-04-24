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

    //Inserta un grupo en la base de datos
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

    //Elimina un grupo según su identificador
    public void eliminarGrupo(int idGrupo) {
        Connection con = null;
        PreparedStatement stmEliminar = null;

        try {
            con = this.getConexion();
            stmEliminar = con.prepareStatement("DELETE FROM Grupo WHERE id_grupo = ?");
            stmEliminar.setInt(1, idGrupo);
            stmEliminar.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (stmEliminar != null) {
                    stmEliminar.close();
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

    //Modifica la actividad a realizar de un determinado grupo
    public void modificarGrupo(Grupo grupo) {
        Connection con = null;
        PreparedStatement stmModificar = null;

        try {
            con = this.getConexion();
            stmModificar = con.prepareStatement("UPDATE Grupo SET id_actividad = ? WHERE id_grupo = ?");
            stmModificar.setInt(1, grupo.getActividad().getId_Actividad());
            stmModificar.setInt(2, grupo.getId_Grupo());
            stmModificar.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            this.getFachadaAplicacion().muestraExcepcion(e.getMessage());
        } finally {
            // Cerrar recursos
            try {
                if (stmModificar != null) {
                    stmModificar.close();
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