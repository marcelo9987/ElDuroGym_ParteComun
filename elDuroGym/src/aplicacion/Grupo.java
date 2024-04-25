/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package aplicacion;


public class Grupo {
    private int idGrupo;
    private Actividad idActividad;
    
   public Grupo(int idGrupo, Actividad idActividad){
       this.idGrupo = idGrupo;
       this.idActividad = idActividad;
   }
   public int getIdGrupo(){
       return this.idGrupo;
   }
   public Actividad getActividad(){
       return this.idActividad;
   }


}
