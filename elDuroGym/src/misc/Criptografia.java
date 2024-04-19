package misc;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;


public final class Criptografia
{
    private static final String ALGORITMO = "DES";
    private static final String CLAVE = "82514145";

    public static SecretKey obtenerClave(String clave)
    {
        SecretKey claveSecreta = new SecretKeySpec(clave.getBytes(),ALGORITMO);
        return claveSecreta;
    }

    public static byte[] cifrar (String texto)
            throws Exception
    {

        byte [] mensajeEntrada = texto.getBytes();
        try
        {
            Cipher encifrador = Cipher.getInstance(ALGORITMO);
            SecretKey claveSecreta = obtenerClave(CLAVE);
            encifrador.init(Cipher.ENCRYPT_MODE, claveSecreta);
            return encifrador.doFinal(mensajeEntrada);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    public static String descifrar (byte[] textoCifrado)
            throws Exception
    {
        try
        {
            Cipher descifrador = Cipher.getInstance(ALGORITMO);
            SecretKey claveSecreta = obtenerClave(CLAVE);
            descifrador.init(Cipher.DECRYPT_MODE, claveSecreta);
            byte[] textoDescifrado = descifrador.doFinal(textoCifrado);
            return new String(textoDescifrado);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }

}
