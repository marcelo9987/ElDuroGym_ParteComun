

package aplicacion;

/**
 * Clase que representa un usuario del sistema
 */
public final class Usuario
{
    private final String idUsuario;
    private final String clave;
    private final String nombre;
    private final String direccion;
    private final String email;
    private final TipoUsuario tipo;

public Usuario(String idUsuario, String clave, String nombre, String direccion, String email, TipoUsuario tipo){
        this.idUsuario = idUsuario;
        this.clave = clave;
        this.nombre = nombre;
        this.direccion = direccion;
        this.email = email;
        this.tipo = tipo;
    }

    public String idUsuario() {
        return idUsuario;
    }

    public String clave() {
        return clave;
    }

    public String nombre() {
        return nombre;
    }

    public String direccion() {
        return direccion;
    }

    public String email() {
        return email;
    }

    public TipoUsuario tipo() {
        return tipo;
    }
}