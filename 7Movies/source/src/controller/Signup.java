package controller;

import java.io.IOException;
import java.util.ArrayList;

import model.MovieBean;
import model.UserBean;
import model.UserBeanDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
        String surname=request.getParameter("surname");
        String mail = request.getParameter("mail");
        String psw = request.getParameter("password");
        String sCart;
        
        HttpSession s = request.getSession();
        
        @SuppressWarnings("unchecked")
		ArrayList<MovieBean> cart = (ArrayList<MovieBean>) s.getAttribute("cart");
        
        sCart = MovieBean.getIdString(cart);
        
        UserBean ub = new UserBean(name, surname, mail, sCart);
        
        int i = UserBeanDAO.insertUser(ub, psw);
        
        if(i > 0) {
        	RequestDispatcher view = request.getRequestDispatcher("/redirect.jsp?act=signup");
    		view.forward(request, response);
        }else {
        	RequestDispatcher view = request.getRequestDispatcher("/signup.jsp?err=1");
    		view.forward(request, response);
        }
        
        
	}


}