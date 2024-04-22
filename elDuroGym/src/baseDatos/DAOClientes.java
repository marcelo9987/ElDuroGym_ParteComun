package baseDatos;

import java.sql.Connection;

public class DAOClientes extends AbstractDAO
{
    public DAOClientes(Connection conexion, aplicacion.FachadaAplicacion fa)
    {
        super.setConexion(conexion);
        super.setFachadaAplicacion(fa);
    }
}
