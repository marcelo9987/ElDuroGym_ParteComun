package gui;

import aplicacion.Profesor;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.AbstractTableModel;

public class ModeloTablaProfesor extends AbstractTableModel {
    private List<Profesor> profesores;

    public ModeloTablaProfesor() {
        this.profesores = new ArrayList<>();
    }

    @Override
    public int getColumnCount() {
        return 5; // Número de columnas
    }

    @Override
    public int getRowCount() {
        return profesores.size();
    }

    @Override
    public String getColumnName(int col) {
        String nombre = "";

        switch (col) {
            case 0:
                nombre = "Nombre";
                break;
            case 1:
                nombre = "Aula";
                break;
            case 2:
                nombre = "Descripción";
                break;
            case 3:
                nombre = "Fecha Próxima";
                break;
            case 4:
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
            case 2:
                clase = String.class;
                break;
            case 3:
                clase = LocalDate.class;
                break;
            case 4:
                clase = LocalTime.class;
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
        Profesor profesor = profesores.get(row);

        switch (col) {
            case 0:
                resultado = profesor.getNombre();
                break;
            case 1:
                resultado = profesor.getAula();
                break;
            case 2:
                resultado = profesor.getDescripcion();
                break;
            case 3:
                resultado = profesor.getFechaProxima();
                break;
            case 4:
                resultado = profesor.getHora();
                break;
        }
        return resultado;
    }

    public void setProfesores(List<Profesor> profesores) {
        this.profesores = profesores;
        fireTableDataChanged();
    }

    public Profesor obtenerProfesor(int fila) {
        return profesores.get(fila);
    }
}