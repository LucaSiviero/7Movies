/*
MovieBeanDAO
Classe usata per gestire l'i/o di elementi MovieBean nel/dal DB
*/

package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class MovieBeanDAO {
	//Ricerca per categoria, titolo, anno, regista
	//Inserimento nel db
	//Rimozione film
	public MovieBeanDAO () {}
	
	public static ArrayList<MovieBean> findMovieByTitle(String title) {
		Connection conn = null;
		Statement stmt = null;
		ArrayList <MovieBean> movies = new ArrayList <MovieBean> ();
		
		try {
			String query = "SELECT * FROM `movie` WHERE `title` LIKE \"%" + title + "%\" ORDER BY `title`;";
			MovieBean mb;
			conn = DriverManagerConnectionPool.getConnection();
			stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				mb = new MovieBean();
				mb.setId(rs.getInt("id"));
				mb.setTitle(rs.getString("title"));
				mb.setDirector(rs.getString("director"));
				mb.setYear(rs.getString("year"));
				mb.setLangs(rs.getString("langs"));
				mb.setPrice(rs.getFloat("price"));
				mb.setCategories(rs.getString("categories"));
				mb.setImgpath(rs.getString("imgpath"));
				mb.setFramepath(rs.getString("framepath"));
				mb.setDescription(rs.getString("descr"));
				movies.add(mb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	public static ArrayList<MovieBean> findMovieByCategory(String cat) {
		Connection conn = null;
		Statement stmt = null;
		ArrayList <MovieBean> movies = new ArrayList <MovieBean> ();
		
		try {
			String query = "SELECT * FROM `movie` WHERE `categories` LIKE \"%" + cat + "%\" ORDER BY `title`;";
			MovieBean mb;
			conn = DriverManagerConnectionPool.getConnection();
			stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				mb = new MovieBean();
				mb.setId(rs.getInt("id"));
				mb.setTitle(rs.getString("title"));
				mb.setDirector(rs.getString("director"));
				mb.setYear(rs.getString("year"));
				mb.setLangs(rs.getString("langs"));
				mb.setPrice(rs.getFloat("price"));
				mb.setCategories(rs.getString("categories"));
				mb.setImgpath(rs.getString("imgpath"));
				mb.setFramepath(rs.getString("framepath"));
				mb.setDescription(rs.getString("descr"));
				movies.add(mb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	public static ArrayList<MovieBean> findMovieByYear(String year) {
		Connection conn = null;
		Statement stmt = null;
		ArrayList <MovieBean> movies = new ArrayList <MovieBean> ();
		
		try {
			String query = "SELECT * FROM `movie` WHERE `year` LIKE \"%" + year + "%\" ORDER BY `title`;";
			MovieBean mb = new MovieBean();
			conn = DriverManagerConnectionPool.getConnection();
			stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				mb = new MovieBean();
				mb.setId(rs.getInt("id"));
				mb.setTitle(rs.getString("title"));
				mb.setDirector(rs.getString("director"));
				mb.setYear(rs.getString("year"));
				mb.setLangs(rs.getString("langs"));
				mb.setPrice(rs.getFloat("price"));
				mb.setCategories(rs.getString("categories"));
				mb.setImgpath(rs.getString("imgpath"));
				mb.setFramepath(rs.getString("framepath"));
				mb.setDescription(rs.getString("descr"));
				movies.add(mb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	public static ArrayList<MovieBean> findMovieByDirector(String dir) {
		Connection conn = null;
		Statement stmt = null;
		ArrayList <MovieBean> movies = new ArrayList <MovieBean> ();
		
		try {
			String query = "SELECT * FROM `movie` WHERE `director` LIKE \"%" + dir + "%\" ORDER BY `title`;";
			MovieBean mb = new MovieBean();
			conn = DriverManagerConnectionPool.getConnection();
			stmt= conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				mb = new MovieBean();
				mb.setId(rs.getInt("id"));
				mb.setTitle(rs.getString("title"));
				mb.setDirector(rs.getString("director"));
				mb.setYear(rs.getString("year"));
				mb.setLangs(rs.getString("langs"));
				mb.setPrice(rs.getFloat("price"));
				mb.setCategories(rs.getString("categories"));
				mb.setImgpath(rs.getString("imgpath"));
				mb.setFramepath(rs.getString("framepath"));
				mb.setDescription(rs.getString("descr"));
				movies.add(mb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	public static MovieBean getMovieById (String id) {
		Connection conn = null;
		Statement stmt = null;
		MovieBean mb = null;
		String query;
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			stmt= conn.createStatement();
				query = "SELECT * FROM `movie` WHERE id =" + id + ";";
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next()) {
					mb = new MovieBean();
					mb.setId(rs.getInt("id"));
					mb.setTitle(rs.getString("title"));
					mb.setDirector(rs.getString("director"));
					mb.setYear(rs.getString("year"));
					mb.setLangs(rs.getString("langs"));
					mb.setPrice(rs.getFloat("price"));
					mb.setCategories(rs.getString("categories"));
					mb.setImgpath(rs.getString("imgpath"));
					mb.setFramepath(rs.getString("framepath"));
					mb.setDescription(rs.getString("descr"));
				}
				
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return mb;
	}
	
	public static ArrayList<MovieBean> getMoviesById (String list) {
		
		Connection conn = null;
		Statement stmt = null;
		ArrayList <MovieBean> movies = new ArrayList <MovieBean> ();
		MovieBean mb;
		String query;
		List<String> result = Arrays.asList(list.split("\\s*,\\s*"));
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			stmt= conn.createStatement();
			for(String s: result) {
				query = "SELECT * FROM `movie` WHERE id ="+s+";";
				ResultSet rs = stmt.executeQuery(query);
				while(rs.next()) {
					mb = new MovieBean();
					mb.setId(rs.getInt("id"));
					mb.setTitle(rs.getString("title"));
					mb.setDirector(rs.getString("director"));
					mb.setYear(rs.getString("year"));
					mb.setLangs(rs.getString("langs"));
					mb.setPrice(rs.getFloat("price"));
					mb.setCategories(rs.getString("categories"));
					mb.setImgpath(rs.getString("imgpath"));
					mb.setFramepath(rs.getString("framepath"));
					mb.setDescription(rs.getString("descr"));
					movies.add(mb);
				}
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	public static synchronized int insertMovie(MovieBean movie) {
		Connection conn = null;
		PreparedStatement ps = null;
		String query = "INSERT INTO `movie` (title, director, year, langs, price, categories, imgpath, framepath, descr) VALUES (?,?,?,?,?,?,?,?,?);";
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie.getTitle());
			ps.setString(2, movie.getDirector());
			ps.setString(3, movie.getYear());
			ps.setString(4, movie.getLangs());
			ps.setFloat(5, movie.getPrice());
			ps.setString(6, movie.getCategories());
			ps.setString(7, movie.getImgpath());
			ps.setString(8, movie.getFramepath());
			ps.setString(9, movie.getDescription());

			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(movie.getTitle() + " has been added.");
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
	
	public static synchronized int updateMovie(MovieBean movie) {
		Connection conn = null;
		PreparedStatement ps = null;
		String query = "UPDATE `movie` SET title = ?, director = ?, year = ?, langs = ?, price = ?, categories = ?, imgpath = ?, framepath = ?, descr = ? WHERE id = ?;";
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, movie.getTitle());
			ps.setString(2, movie.getDirector());
			ps.setString(3, movie.getYear());
			ps.setString(4, movie.getLangs());
			ps.setFloat(5, movie.getPrice());
			ps.setString(6, movie.getCategories());
			ps.setString(7, movie.getImgpath());
			ps.setString(8, movie.getFramepath());
			ps.setString(9, movie.getDescription());
			ps.setString(10, Long.toString(movie.getId()));

			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(movie.getTitle() + " has been updated!");
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
	
	public static synchronized int dropMovie(String id){
		Connection conn = null;
		PreparedStatement ps = null;
		String query = "DELETE FROM `movie` WHERE id = ?;";
		
		try {
			conn = DriverManagerConnectionPool.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			
			int i = ps.executeUpdate();
			if(i > 0) {
				System.out.println(id + " has been deleted!");
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
	
	public static synchronized ArrayList<MovieBean> getRecents(){
		Connection conn = null;
		Statement stmt = null;
		ArrayList<MovieBean> movies = new ArrayList<MovieBean>();
		MovieBean mb;
		try {
			String query = "SELECT * FROM `movie` ORDER BY `date` DESC LIMIT 3;";
			conn = DriverManagerConnectionPool.getConnection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				mb = new MovieBean();
				mb.setId(rs.getInt("id"));
				mb.setTitle(rs.getString("title"));
				mb.setDirector(rs.getString("director"));
				mb.setYear(rs.getString("year"));
				mb.setLangs(rs.getString("langs"));
				mb.setPrice(rs.getFloat("price"));
				mb.setCategories(rs.getString("categories"));
				mb.setFramepath(rs.getString("framepath"));
				mb.setDescription(rs.getString("descr"));
				movies.add(mb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	public static synchronized ArrayList<MovieBean> getCatalog(){
		Connection conn = null;
		Statement stmt = null;
		ArrayList<MovieBean> movies = new ArrayList<MovieBean>();
		MovieBean mb;
		try {
			String query = "SELECT * FROM `movie` ORDER BY `title`;";
			conn = DriverManagerConnectionPool.getConnection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				mb = new MovieBean();
				mb.setId(rs.getInt("id"));
				mb.setTitle(rs.getString("title"));
				mb.setDirector(rs.getString("director"));
				mb.setYear(rs.getString("year"));
				mb.setLangs(rs.getString("langs"));
				mb.setPrice(rs.getFloat("price"));
				mb.setCategories(rs.getString("categories"));
				mb.setImgpath(rs.getString("imgpath"));
				mb.setFramepath(rs.getString("framepath"));
				mb.setDescription(rs.getString("descr"));
				movies.add(mb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
	
	public static synchronized ArrayList<MovieBean> getCatalogPreview(){
		Connection conn = null;
		Statement stmt = null;
		ArrayList<MovieBean> movies = new ArrayList<MovieBean>();
		MovieBean mb;
		try {
			String query = "SELECT * FROM `movie` ORDER BY `title` LIMIT 8;";
			conn = DriverManagerConnectionPool.getConnection();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				mb = new MovieBean();
				mb.setId(rs.getInt("id"));
				mb.setTitle(rs.getString("title"));
				mb.setDirector(rs.getString("director"));
				mb.setYear(rs.getString("year"));
				mb.setLangs(rs.getString("langs"));
				mb.setPrice(rs.getFloat("price"));
				mb.setCategories(rs.getString("categories"));
				mb.setImgpath(rs.getString("imgpath"));
				mb.setFramepath(rs.getString("framepath"));
				mb.setDescription(rs.getString("descr"));
				movies.add(mb);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return movies;
	}
}