package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MovieBeanDAO;

/**
 * Servlet implementation class DropMovie
 */
@WebServlet("/DropMovie")
public class DropMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DropMovie() { super(); }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		int res = MovieBeanDAO.dropMovie(id);
		
		RequestDispatcher view = request.getRequestDispatcher("/redirect.jsp?act=adm&res=" + res);
		view.forward(request, response);
		
	}

}
