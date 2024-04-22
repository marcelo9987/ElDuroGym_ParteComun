/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;


public class Grupo {
    private int id_grupo;
    private Actividad id_actividad;
    
   public Grupo(int id_grupo,Actividad id_actividad){
       this.id_grupo = id_grupo;
       this.id_actividad = id_actividad;
   }
   public int getId_Grupo(){
       return this.id_grupo;
   }
   public Actividad getId_Actividad(){
       return this.id_actividad;
   }
}
