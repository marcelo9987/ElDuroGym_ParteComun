/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;

public class Aula {
    private int id_aula;
    private String nombre;
    private Integer aforo;
    
    public Aula(int id_aula,String nombre,int aforo ){
        this.id_aula = id_aula;
        this.nombre = nombre;
        this.aforo = aforo;
    }

    public int getId_Aula(){
        return this.id_aula;
    }
    public String getNombre(){
        return this.nombre;
    }
    public int getAforo(){
        return this.aforo;
    }
}
