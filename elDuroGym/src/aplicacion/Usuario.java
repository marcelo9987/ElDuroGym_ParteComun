

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

    public String getIdUsuario() {
        return idUsuario;
    }

    public String getClave() {
        return clave;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getEmail() {
        return email;
    }

    public String getDni() {
        return dni;
    }

    public String getNickname() {
        return nickname;
    }

}
