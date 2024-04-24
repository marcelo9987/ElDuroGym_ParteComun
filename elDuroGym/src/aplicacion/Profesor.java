package aplicacion;

public final class Profesor extends Usuario {
    public Profesor(String idUsuario, String clave, String nombre, String direccion, String email, String dni, String nickname) {
        super(idUsuario, clave, nombre, direccion, email, dni, nickname);
    }

    // Métodos Get
    public String getIdUsuario() {
        return super.getIdUsuario();
    }

    public String getClave() {
        return super.getClave();
    }

    public String getNombre() {
        return super.getNombre();
    }

    public String getDireccion() {
        return super.getDireccion();
    }

    public String getEmail() {
        return super.getEmail();
    }

    public String getDni() {
        return super.getDni();
    }

    public String getNickname() {
        return super.getNickname();
    }

    // No hay métodos Set al ser los campos de Usuario finales

}