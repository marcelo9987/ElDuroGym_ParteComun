/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;

public class Aula {
    private int idAula;
    private String nombre;
    private Integer aforo;
    
    public Aula(int idAula, String nombre, int aforo ){
        this.idAula = idAula;
        this.nombre = nombre;
        this.aforo = aforo;
    }

    public int getIdAula(){
        return this.idAula;
    }
    public String getNombre(){
        return this.nombre;
    }
    public int getAforo(){
        return this.aforo;
    }
}
