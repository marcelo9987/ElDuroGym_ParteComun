

package aplicacion;

/**
 * Clase que representa un usuario del sistema
 */
public abstract class Usuario
{
    private final String idUsuario;
    private final String nombre;
    private final String dni;
    private final String email;
    private final String direccion;
    private final String nickname;
    private final String clave;
    

public Usuario(String idUsuario, String clave, String nombre, String direccion, String email, String dni, String nickname){
        this.idUsuario = idUsuario;
        this.clave = clave;
        this.nombre = nombre;
        this.direccion = direccion;
        this.email = email;
        this.dni = dni;
        this.nickname = nickname;
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

    public String dni() {
        return dni;
    }

    public String nickname() {
        return nickname;
    }
}
