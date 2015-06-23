/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;

import static clases.conexionSql.ConnectDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author robertito
 */
public class cargarTipoProducto {
    Connection connection;
    public ResultSet cargaComboTipoProducto()throws Exception{
        connection = conexionSql.ConnectDb();
        String sql = "SELECT * FROM tipoproductos";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        return rs;
    }
}
