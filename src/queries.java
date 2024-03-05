
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ECD-TYRONE
 */
public class queries {
    
    Cons sql = new Cons();
    
   public int login(String username, String password){
       int ret =0;
       try {
       String query = "select * from users where username  = ? and password = ? and role != 1";
       PreparedStatement ps = sql.setQuery(query);
       ps.setString(1, username);
       ps.setString(2, password);
       ResultSet rs = ps.executeQuery();
       if(rs.next()){
           ret = rs.getInt("user_id");
           
       }
       else{
           ret =0;
       }
        } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       
       return ret;
   }
   
   
   public String getFullname(int id){
       String ret = "";
        try {
                String query = "select * from users where user_id = ?";
                PreparedStatement ps = sql.setQuery(query);
                ps.setInt(1, id);
                 ResultSet rs = ps.executeQuery();
                 if(rs.next()){
                    ret = rs.getString("full_name");
           
                 }
                
        } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ret;
   }
   
   
   public void addTask(int user, String task,double hours, String date){
        try {
            String query = "insert into timesheet values(null,?,?,?,?, 0)";
            PreparedStatement ps = sql.setQuery(query);
            ps.setInt(1, user);
            ps.setString(2, task);
            ps.setDouble(3, hours);
            ps.setString(4, date);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
   
   public void addTaskToday(int user, String task,double hours){
        try {
            String query = "insert into timesheet values(null,?,?,?,now(), 0)";
            PreparedStatement ps = sql.setQuery(query);
            ps.setInt(1, user);
            ps.setString(2, task);
            ps.setDouble(3, hours);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
        
   }
   
   
   
   
   public String dateToday(){
       String ret = "";
       try{
           String query = "select DATE_FORMAT(now(),'%Y-%m-%d')";
                PreparedStatement ps = sql.setQuery(query);
                 ResultSet rs = ps.executeQuery();
                 if(rs.next()){
                    ret = rs.getString(1);
                 }
                 
                 ps.close();
                 rs.close();
       } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
       return ret;
   }
   
   
   public void showTodayTask(int id ,JTable table){
       try{
           String query = "select * from timesheet where task_date like ? and user_id = ?";
                PreparedStatement ps = sql.setQuery(query);
                ps.setString(1, dateToday());
                ps.setInt(2, id);
                 ResultSet rs = ps.executeQuery();
                 DefaultTableModel tab = (DefaultTableModel) table.getModel();
                 tab.setRowCount(0);
                 while(rs.next()){
                    tab.addRow(new Object[]{rs.getString(1), rs.getString(3),rs.getString(4), rs.getString(5)});
                 }
                 ps.close();
                 rs.close();
       } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
   
   public void showTask(int id ,JTable table){
       try{
           String query = "select * from timesheet where user_id = ?";
                PreparedStatement ps = sql.setQuery(query);
                ps.setInt(1, id);
                 ResultSet rs = ps.executeQuery();
                 DefaultTableModel tab = (DefaultTableModel) table.getModel();
                 tab.setRowCount(0);
                 while(rs.next()){
                    tab.addRow(new Object[]{rs.getString(1), rs.getString(3),rs.getString(4), rs.getString(5)});
                 }
                 ps.close();
                 rs.close();
       } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
   
   public void deleteTask(int id){
       try{
           String query = "delete from timesheet where t_id = ?";
                PreparedStatement ps = sql.setQuery(query);
                ps.setInt(1, id);
                ps.executeUpdate();
                ps.close();
       } catch (SQLException ex) {
            Logger.getLogger(queries.class.getName()).log(Level.SEVERE, null, ex);
        }
   }
    
}
