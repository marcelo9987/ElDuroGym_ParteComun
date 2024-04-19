

package aplicacion;

/**
 * Clase que representa un usuario del sistema
 * @param idUsuario
 * @param clave
 * @param nombre
 * @param direccion
 * @param email
 * @param tipo
 *
 * @see <a href="https://www.baeldung.com/java-record-keyword">uso de records en java moderno</a>
 */
public record Usuario (String idUsuario,String clave, String nombre, String direccion, String email, TipoUsuario tipo){}