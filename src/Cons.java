
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ECD-TYRONE
 */
public class Cons {
    
    public String database = "payroll";
    
    public PreparedStatement setQuery(String query){
        PreparedStatement ret=null;
        try {
            ret = DriverManager.getConnection("jdbc:mysql://localhost/"+database,"root","").prepareStatement(query);
        } catch (SQLException ex) {
            Logger.getLogger(Cons.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
    }
    
    
}
