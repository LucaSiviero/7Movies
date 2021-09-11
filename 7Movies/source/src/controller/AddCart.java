package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MovieBean;
import model.MovieBeanDAO;
import model.UserBean;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<MovieBean> cart =(ArrayList<MovieBean>) s.getAttribute("cart");
		UserBean user = (UserBean) s.getAttribute("user");
		Boolean log = (Boolean) s.getAttribute("isLogged");
		
		String url = request.getHeader("referer");
		int i = url.indexOf('?'); 
		if(i != -1)
			url = url.substring(0, i);
		
		if(cart == null) {
			cart = new ArrayList<MovieBean>();
		}
		
		String id;
		id = (String) request.getParameter("mov");
		if(id == null) {
			response.sendRedirect(url + "?add=0");
		}else {
			MovieBean mb = MovieBeanDAO.getMovieById(id);
			if(mb != null) {
				
				if(!cart.contains(mb)){
					System.out.println("Film non trovato");
					cart.add(mb);
					if(user != null && log) {
						String sCart = MovieBean.getIdString(cart);
						user.setCart(sCart);
					}
					s.setAttribute("cart", cart);
					System.out.println(url);
					response.sendRedirect(url + "?add=1&movie=" + mb.getId() + "#movie" + mb.getId());
				}else {
					response.sendRedirect(url + "?add=2&movie=" + mb.getId() + "#movie" + mb.getId());
				}
			}else {
				response.sendRedirect(url + "?add=0");
			}
			
		}
		
	}

}
