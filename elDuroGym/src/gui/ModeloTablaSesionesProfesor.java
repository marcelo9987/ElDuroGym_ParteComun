package gui;

import aplicacion.Profesor;
import aplicacion.Sesion;
import aplicacion.SesionProfesor;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.AbstractTableModel;

public class ModeloTablaSesionesProfesor extends AbstractTableModel {
    private List<SesionProfesor> sesionesProfesor;

    public ModeloTablaSesionesProfesor() {
        this.sesionesProfesor = new ArrayList<>();
    }

    @Override
    public int getColumnCount() {
        return 4; // Número de columnas
    }

    @Override
    public int getRowCount() {
        return sesionesProfesor.size();
    }

    @Override
    public String getColumnName(int col) {
        String nombre = "";

        switch (col) {
            case 0:
                nombre = "Aula";
                break;
            case 1:
                nombre = "Fecha Próxima";
                break;
            case 2:
                nombre = "Hora";
                break;
            case 3:
                nombre = "Descripcion";
                break;
        }
        return nombre;
    }

    @Override
    public Class getColumnClass(int col) {
        Class clase = null;

        switch (col) {
            case 0:
                clase = String.class;
            case 1:
                clase = LocalDate.class;
                break;
            case 2:
                clase = LocalTime.class;
                break;
            case 3:
                clase = String.class;
                break;
        }
        return clase;
    }

    @Override
    public boolean isCellEditable(int row, int col) {
        return false;
    }

    @Override
    public Object getValueAt(int row, int col) {
        Object resultado = null;
        SesionProfesor sesionProfesor = sesionesProfesor.get(row);


        switch (col) {
            case 0:
                resultado = sesionProfesor.getNombreAula();
                break;
            case 1:
                resultado = sesionProfesor.getFecha();
                break;
            case 2:
                resultado = sesionProfesor.getHora();
                break;
            case 3:
                resultado = sesionProfesor.getDescripcion();
                break;
        }
        return resultado;
    }

    public void setFilas(List<SesionProfesor> profesores) {
        this.sesionesProfesor = profesores;
        fireTableDataChanged();
    }

    public SesionProfesor obtenerSesionProfesor(int fila) {
        return sesionesProfesor.get(fila);
    }
}