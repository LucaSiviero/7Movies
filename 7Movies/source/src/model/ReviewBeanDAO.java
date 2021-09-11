package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ReviewBeanDAO {
	public static ArrayList<ReviewBean> getRevs (long id){
		Connection conn = null;
		Statement stmt = null;
		
		ArrayList<ReviewBean> revs = new ArrayList<ReviewBean>();
		
		try {
			String query = "SELECT * FROM `review` WHERE `movid` = " + id + " ORDER BY `revdate`;";
			ReviewBean rb;
			conn = DriverManagerConnectionPool.getConnection();
			stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				rb = new ReviewBean();
				rb.setId(id);
				rb.setMail(rs.getString("usrmail"));
				rb.setName(rs.getString("usrname"));
				rb.setReview(rs.getString("rev"));
				rb.setTitle(rs.getString("title"));
				rb.setDate(rs.getDate("revdate"));
				revs.add(rb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return revs;
	}
	
	public static int addReview (ReviewBean rev) {
		Connection conn = null;
		PreparedStatement ps = null;
		String query = "INSERT INTO `review` (usrname, usrmail, movid, title, rev) VALUES (?,?,?,?,?);";
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, rev.getName());
			ps.setString(2, rev.getMail());
			ps.setLong(3, rev.getId());
			ps.setString(4, rev.getTitle());
			ps.setString(5, rev.getReview());

			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(rev.getTitle() + " has been added.");
				conn.commit();
				conn.close();
				return 1;
			}
			conn.commit();
			conn.close();
			return 0;
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
