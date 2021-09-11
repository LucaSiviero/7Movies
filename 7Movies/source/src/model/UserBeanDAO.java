/*
UserBeanDAO
Classe usata per gestire l'i/o di elementi UserBean nel/dal DB
*/

package model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserBeanDAO {
	
 public static synchronized UserBean doRetrieveByKey (String mail, String password) {
	 
	 Connection conn = null;
	 PreparedStatement ps = null;
	 try {
		UserBean ub = new UserBean(); 
		ub.setMail(mail);
		
		conn = DriverManagerConnectionPool.getConnection();
		ps = conn.prepareStatement("SELECT * FROM user WHERE mail = ? AND password = ?");
		ps.setString(1, mail);
		ps.setString(2, password);
				
		ResultSet res = ps.executeQuery();

		
		if(res.next())
		{
			ub.setName(res.getString("name"));
			ub.setSurname(res.getString("surname"));
			ub.setMail(res.getString("mail"));
			ub.setCart(res.getString("cart"));
			ub.setAdmin(res.getBoolean("Admin"));
			ps.close();
			DriverManagerConnectionPool.releaseConnection(conn);
			return ub;
		}
		else {
			ub = null;
			System.out.println("User not found");
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		try {
			ps.close();
			DriverManagerConnectionPool.releaseConnection(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return null;
 }
 
 public static synchronized int insertUser (UserBean ub, String psw) {
	 
	 Connection conn = null;
     String driver = "com.mysql.jdbc.Driver";
	 
	 try {
         Class.forName(driver).newInstance();

 		conn = (Connection) DriverManagerConnectionPool.getConnection();
         System.out.println("Connected!");
         
         String query = "INSERT INTO `user` (`name`, `surname`, `mail`, `password`, `cart`) VALUES (?,?,?,?,?);";
         
         
         PreparedStatement ps =conn.prepareStatement(query);
         ps.setString(1, ub.getName());
         ps.setString(2, ub.getSurname());
         ps.setString(3, ub.getMail());
         ps.setString(4, psw);
         ps.setString(5, ub.getCart());
         
         System.out.println(ps);
         int i= ps.executeUpdate();
         if(i >0){
         	System.out.println("PreparedStatement executed!");
         }
         conn.commit();
         conn.close();
         System.out.println("Disconnected!");
         return i;
     } catch (Exception e) {
         e.printStackTrace();
     }
	 
	 return 0;
 }

	public static void updateCart(UserBean user) {
		Connection conn = null;
		PreparedStatement ps = null;
		String query = "UPDATE `user` SET cart = ? WHERE mail = ?;";
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getCart());
			ps.setString(2, user.getMail());
		
			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(user.getName() + "'cart has been updated!");
				conn.commit();
				conn.close();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
 
}
