package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class RemoveCart
 */
@WebServlet("/RemoveCart")
public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RemoveCart() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<MovieBean> cart =(ArrayList<MovieBean>) s.getAttribute("cart");
		UserBean user = (UserBean) s.getAttribute("user");
		Boolean log = (Boolean) s.getAttribute("isLogged");
		
		if(cart == null) {
			RequestDispatcher view = request.getRequestDispatcher("/cart.jsp");
			view.forward(request, response);
		}
		
		String id;
		id = (String) request.getParameter("mov");
		if(id == null) {
			RequestDispatcher view = request.getRequestDispatcher("/catalogo.jsp?add=0");
			view.forward(request, response);
		}else {
			MovieBean mb = MovieBeanDAO.getMovieById(id);
			if(mb != null) {
				
				if(cart.contains(mb)){
					System.out.println("Film trovato");
					cart.remove(mb);
				}
				
				if(user != null && log) {
					String sCart = MovieBean.getIdString(cart);
					user.setCart(sCart);
				}
				s.setAttribute("cart", cart);
				RequestDispatcher view = request.getRequestDispatcher("/cart.jsp");
				view.forward(request, response);
			}else {
				RequestDispatcher view = request.getRequestDispatcher("/cart.jsp");
				view.forward(request, response);
			}
			
		}
	}


}
