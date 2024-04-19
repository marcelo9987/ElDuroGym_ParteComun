package misc;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;


public final class Criptografia
{
    private static final String ALGORITMO = "DES";
    private static final String CLAVE = "82514145";

    public static SecretKey obtenerClave(String clave)
    {
        SecretKey claveSecreta = new SecretKeySpec(clave.getBytes(),ALGORITMO);
        return claveSecreta;
    }

    public static String cifrar (String texto)
            throws Exception
    {

        byte [] mensajeEntrada =texto.getBytes();
        try
        {
            Cipher encifrador = Cipher.getInstance(ALGORITMO);
            SecretKey claveSecreta = obtenerClave(CLAVE);
            encifrador.init(Cipher.ENCRYPT_MODE, claveSecreta);
            byte[] claveCifrada = encifrador.doFinal(mensajeEntrada);
            return new String(Base64.getEncoder().encode(claveCifrada));
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    public static String descifrar (String textoCifrado)
            throws Exception
    {
        try
        {
            Cipher descifrador = Cipher.getInstance(ALGORITMO);
            SecretKey claveSecreta = obtenerClave(CLAVE);
            descifrador.init(Cipher.DECRYPT_MODE, claveSecreta);
            byte[] textoDescifrado = descifrador.doFinal(Base64.getDecoder().decode( textoCifrado.getBytes()));
            return new String(textoDescifrado);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

}
