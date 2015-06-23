/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
/**
 *
 * @author robertito
 */
public class conexionSql {
    Connection conn = null;
    ResultSet rsDatosResultado;
    Statement stSQL;
    public static Connection ConnectDb(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/negociomama","root","");
            return conn;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
            return null;
        }
    }
    
    public ResultSet SeleccionarTodosUsuarios(){
        Connection cn = ConnectDb();
        Statement st;
        ResultSet rs = null;
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM clientes");
        } catch (SQLException ex) {
            Logger.getLogger(conexionSql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public ResultSet SeleccionarTodosDeudas(){
        Connection cn = ConnectDb();
        Statement st;
        ResultSet rs = null;
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM deuda");
        } catch (SQLException ex) {
            Logger.getLogger(conexionSql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public ResultSet SeleccionarTodosVentas(){
        Connection cn = ConnectDb();
        Statement st;
        ResultSet rs = null;
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM ventas");
        } catch (SQLException ex) {
            Logger.getLogger(conexionSql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public ResultSet SeleccionarProductosStock(){
        Connection cn = ConnectDb();
        Statement st;
        ResultSet rs = null;
        try {
            st = cn.createStatement();
            rs = st.executeQuery("SELECT * FROM productos");
        } catch (SQLException ex) {
            Logger.getLogger(conexionSql.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rs;
    }
    
    public static int actualizarRegistroClientes(String[] datos){
        int rsu = 0;
        Connection cn = ConnectDb();
        Statement st;
        ResultSet rs = null;
        String sql = "UPDATE clientes SET "
                + "nombre = '"+datos[0]+"' ,"
                + "apellido = '"+datos[1]+"' ,"
                + "block = '"+datos[2]+"' ,"
                + "departamento = "+datos[3]+""
                + " WHERE id = "+datos[4]+"";
        try {
            st = cn.createStatement();
            rsu = st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return rsu;
    }
    
    public static int actualizarRegistroProductos(String[] datos){
        int rsu = 0;
        Connection cn = ConnectDb();
        Statement st;
        ResultSet rs = null;
        String sql = "UPDATE productos SET "
                + "nombre_producto = '"+datos[0]+"' ,"
                + "tipo_producto = '"+datos[1]+"' ,"
                + "precio_producto = "+datos[2]+" ,"
                + "stock_producto = "+datos[3]+""
                + " WHERE id_producto = "+datos[4]+"";
        try {
            st = cn.createStatement();
            rsu = st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return rsu;
    }
    
    public static int actualizarRegistroDebitos(String[] datos){
        int rsu = 0;
        Connection cn = ConnectDb();
        Statement st;
        ResultSet rs = null;
        String sql = "UPDATE deuda SET "
                + "nombre = '"+datos[0]+"',"
                + " monto_deuda = "+datos[1]+","
                + " estado_deuda = '"+datos[2]+"'"
                + " WHERE id_cliente = "+datos[3]+"";
        try {
            st = cn.createStatement();
            rsu = st.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sql);
        return rsu;
    }
    
    public ResultSet consulta(String sql) throws SQLException{
        try {
            rsDatosResultado = stSQL.executeQuery(sql);
        } catch (Exception e) {
            throw e;
        }
        return rsDatosResultado;
    }
    
    public DefaultTableModel retornarDatos (String sentenciaSQL){
        DefaultTableModel retornarModelo = new DefaultTableModel();
        try {
            ResultSet rsDatos = consulta(sentenciaSQL);
            ResultSetMetaData metadatos = rsDatos.getMetaData();
            int numeroColumnas=metadatos.getColumnCount();
            Object[] etiquetas = new Object[numeroColumnas];
            for (int i = 0; i < numeroColumnas; i++){
                etiquetas[i] = metadatos.getColumnLabel(i+1);
                
            }
            retornarModelo.setColumnIdentifiers(etiquetas);
            while(rsDatos.next()){
                Object[] datosFila = new Object[retornarModelo.getColumnCount()];
                for(int i = 0; i < retornarModelo.getColumnCount(); i++){
                datosFila[i] = rsDatos.getObject(i+1);
            }
            retornarModelo.addRow(datosFila);
            }
        } catch (Exception e) {
        }
        return retornarModelo;
    }


}
