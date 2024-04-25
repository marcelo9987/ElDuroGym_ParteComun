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
        return 5; // Número de columnas
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
                nombre = "Descripción";
                break;
            case 2:
                nombre = "Fecha Próxima";
                break;
            case 3:
                nombre = "Hora";
                break;
        }
        return nombre;
    }

    @Override
    public Class getColumnClass(int col) {
        Class clase = null;

        switch (col) {
            case 0:
            case 1:
                clase = String.class;
                break;
            case 2:
                clase = LocalDate.class;
                break;
            case 3:
                clase = LocalTime.class;
                break;
        }
        return clase;
    }

    @Override
    public boolean isCellEditable(int row, int col) {
        return false;
    }
    //juan magan

    @Override
    public Object getValueAt(int row, int col) {
        Object resultado = null;
        SesionProfesor sesionProfesor = sesionesProfesor.get(row);


        switch (col) {
            case 0:
                resultado = sesionProfesor.getAula();
                break;
            case 1:
                resultado = sesionProfesor.getDescripcion();
                break;
            case 2:
                resultado = sesionProfesor.get();
                break;
            case 3:
                resultado = sesionProfesor.getHora();
                break;
        }
        return resultado;
    }

    public void setProfesores(List<SesionProfesor> profesores) {
        this.sesionesProfesor = profesores;
        fireTableDataChanged();
    }

    public Profesor obtenerSesionProfesor(int fila) {
        return sesionesProfesor.get(fila);
    }
}