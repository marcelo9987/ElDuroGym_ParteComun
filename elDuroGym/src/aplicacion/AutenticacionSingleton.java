
package aplicacion;


public class AutenticacionSingleton {
    private static AutenticacionSingleton instancia;
    private String nickname;
    private String clave;

    private AutenticacionSingleton() {
        // Constructor privado para evitar instanciación externa
    }

    public static AutenticacionSingleton getInstance() {
        if (instancia == null) {
            instancia = new AutenticacionSingleton();
        }
        return instancia;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNickname() {
        return nickname;
    }

    public String getClave() {
        return clave;
    }
}

