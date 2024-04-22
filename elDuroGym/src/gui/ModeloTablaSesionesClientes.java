package gui;
import aplicacion.Sesion;
import javax.swing.table.*;

public class ModeloTablaSesionesClientes extends AbstractTableModel{
    private java.util.List<Sesion> sesiones;

    public ModeloTablaSesionesClientes(){
        this.sesiones=new java.util.ArrayList<>();
    }

    @Override
    public int getColumnCount (){
        return 4;
    }

    @Override
    public int getRowCount(){
        return sesiones.size();
    }

    @Override
    public String getColumnName(int col){
        String nombre="";

        switch (col){
            case 0: nombre= "Profesor"; break;
            case 1: nombre= "Aula"; break;
            case 2: nombre="Fecha"; break;
            case 3: nombre="Hora"; break;
        }
        return nombre;
    }

    @Override
    public Class getColumnClass(int col){
        Class clase=null;

        switch (col){
            case 0: clase= java.lang.String.class; break;
            case 1: clase= java.lang.String.class; break;
            case 2: clase=java.time.LocalDate.class; break;
            case 3: clase=java.time.LocalTime.class; break;
        }
        return clase;
    }

    @Override
    public boolean isCellEditable(int row, int col){
        return false;
    }

    @Override
    public Object getValueAt(int row, int col){
        Object resultado=null;

        switch (col){
            case 0: resultado= sesiones.get(row).getId_Grupo().getId_Actividad().getNombre(); break;
            case 1: resultado= sesiones.get(row).getId_Aula().getNombre(); break;
            case 2: resultado=sesiones.get(row).getFecha_hora_inicio().toLocalDate();break;
            case 3: resultado=sesiones.get(row).getFecha_hora_inicio().toLocalTime(); break;
        }
        return resultado;
    }

    public void setFilas(java.util.List<Sesion> sesiones){
        this.sesiones=sesiones;
        fireTableDataChanged();
    }

    public Sesion obtenerSesion(int i){
        return this.sesiones.get(i);
    }

}
