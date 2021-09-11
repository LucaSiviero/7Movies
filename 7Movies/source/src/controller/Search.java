package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DriverManagerConnectionPool;
import model.MovieBean;
import model.MovieBeanDAO;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Search() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
        String driver = "com.mysql.jdbc.Driver";
        ArrayList <MovieBean> movies;
        HttpSession session = request.getSession();
        
        try {
            Class.forName(driver).newInstance();
            conn = DriverManagerConnectionPool.getConnection();
            System.out.println("Connected!");
            
            String word = request.getParameter("word");
            
            movies = MovieBeanDAO.findMovieByTitle(word);
            if(movies.size() > 0) {
            	System.out.println("Film Trovato:" + movies.get(0).getTitle());
            	session.setAttribute("titleMovie", movies);
            }else { 
            	session.setAttribute("titleMovie", null);
            	System.out.println("Nessun Film Trovato per titolo");
            	}
            
            movies = MovieBeanDAO.findMovieByDirector(word);
            if(movies.size() > 0) {
            	System.out.println("Film Trovato:" + movies.get(0).getTitle());
            	session.setAttribute("dirMovie", movies);
            }else { 
            	session.setAttribute("dirMovie", null);
            	System.out.println("Nessun Film Trovato per Regista");
            	}
            
            
            movies = MovieBeanDAO.findMovieByCategory(word);
            if(movies.size() > 0) {
            	System.out.println("Film Trovato:" + movies.get(0).getTitle());
            	session.setAttribute("catMovie", movies);
            }else { 
            	session.setAttribute("catMovie", null);
            	System.out.println("Nessun Film Trovato per categoria");
            	}
            
            
            movies = MovieBeanDAO.findMovieByYear(word);
            if(movies.size() > 0) {
            	System.out.println("Film Trovato:" + movies.get(0).getTitle());
            	session.setAttribute("yearMovie", movies);
            }else { 
            	session.setAttribute("yearMovie", null);
            	System.out.println("Nessun Film Trovato per anno");
            	}
            
            session.setAttribute("word", word);
            response.sendRedirect("search.jsp");
    		
            conn.close();
        } 
        catch(Exception e) {
        	e.printStackTrace();
        }
	}
}
