package gui.auxiliares;

import java.awt.*;

public class posicionamientoVentanas
{
    // todo: posible refactor? Interfaz?
    public static void centrarVentana(Window ventana) {
        Dimension tamanhoPantalla = Toolkit.getDefaultToolkit().getScreenSize();
        Dimension tamanhoVentana = ventana.getPreferredSize();
        int x = (tamanhoPantalla.width - tamanhoVentana.width) / 2;
        int y = (tamanhoPantalla.height - tamanhoVentana.height) / 2;
        ventana.setLocation(x, y);
    }

}
