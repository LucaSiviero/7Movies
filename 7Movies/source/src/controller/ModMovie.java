package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MovieBean;
import model.MovieBeanDAO;

/**
 * Servlet implementation class ModMovie
 */
@WebServlet("/ModMovie")
public class ModMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String director = request.getParameter("director");
		String year = request.getParameter("year");
		String langs = request.getParameter("langs");
		float price = Float.parseFloat(request.getParameter("price").toString());
		String categories = request.getParameter("categories");
		String imgPath = request.getParameter("img");
		String framePath = request.getParameter("frame");;
		String description = request.getParameter("descr");;
		String id = request.getParameter("id");
			
		MovieBean mb = new MovieBean();
		
		mb.setId(Long.parseLong(id));
		mb.setTitle(title);
		mb.setDirector(director);
		mb.setYear(year);
		mb.setLangs(langs);
		mb.setPrice(price);
		mb.setCategories(categories);
		mb.setImgpath(imgPath);
		mb.setFramepath(framePath);
		mb.setDescription(description);
		int res = MovieBeanDAO.updateMovie(mb);
		
		RequestDispatcher view = request.getRequestDispatcher("/redirect.jsp?act=adm&res=" + res);
		view.forward(request, response);
	}

}
