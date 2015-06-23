/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author robertito
 */
public class cargarIDCliente {
    Connection connection;
    public ResultSet cargaIdCliente()throws Exception{
        connection = conexionSql.ConnectDb();
        String sql = "SELECT * FROM clientes";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        return rs;
    }
}
