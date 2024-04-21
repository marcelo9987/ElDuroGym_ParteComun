package aplicacion;

public class Cliente extends Usuario
{
    public Cliente(String idUsuario, String clave, String nombre, String direccion, String email, String dni, String nickname) {
        super(idUsuario, clave, nombre, direccion, email, dni, nickname);
    }
}
