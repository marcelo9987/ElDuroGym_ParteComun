package gui;
import aplicacion.Cliente;
import javax.swing.table.*;

public class ModeloTablaCliente extends AbstractTableModel{
    private java.util.List<Cliente> clientes;

    public ModeloTablaCliente(){
        this.clientes=new java.util.ArrayList<>();
    }

    @Override
    public int getColumnCount (){
        return 6;
    }

    @Override
    public int getRowCount(){
        return clientes.size();
    }

    @Override
    public String getColumnName(int col){
        String nombre="";

        switch (col){
            case 0 -> nombre= "Id Usuario";
            case 1 -> nombre= "Nombre";
            case 2 -> nombre="Nickname";
            case 3 -> nombre="DNI";
            case 4 -> nombre="E-mail";
            case 5 -> nombre="Direccion";
        }
        return nombre;
    }

    @Override
    public Class getColumnClass(int col){
        Class clase=null;

        switch (col){
            case 0 -> clase= java.lang.Integer.class;
            case 1 -> clase= java.lang.String.class;
            case 2 -> clase=java.lang.String.class;
            case 3 -> clase=java.lang.String.class;
            case 4 -> clase=java.lang.String.class;
            case 5 -> clase=java.lang.String.class;
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
            case 0 -> resultado= clientes.get(row).getIdUsuario();
            case 1 -> resultado= clientes.get(row).getNombre();
            case 2 -> resultado=clientes.get(row).getNickname();
            case 3 -> resultado=clientes.get(row).getDni();
            case 4 -> resultado=clientes.get(row).getEmail();
            case 5 -> resultado=clientes.get(row).getDireccion();
            
        }
        return resultado;
    }

    public void setFilas(java.util.List<Cliente> clientes){
        this.clientes=clientes;
        fireTableDataChanged();
    }

    public Cliente obtenerCliente(int i){
        return this.clientes.get(i);
    }

}
