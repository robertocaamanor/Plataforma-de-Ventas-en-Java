/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;

import javax.swing.JOptionPane;
import javax.swing.JTable;

/**
 *
 * @author robertito
 */
public class modificaTablas {
    public void mostrar_celda_elegida(JTable tabla){
        int i=tabla.getSelectedRow();
        if(i==-1){
            JOptionPane.showMessageDialog(tabla, "Por favor elija una celda");
        }else{
            String celda1=(String)tabla.getValueAt(i, 0);
            System.out.println(""+celda1);
        }
    }
}
