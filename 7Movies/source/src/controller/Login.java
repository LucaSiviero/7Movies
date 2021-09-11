package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserBeanDAO;
import model.MovieBeanDAO;
import model.UserBean;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String mail = request.getParameter("mail");
		String psw = request.getParameter("password");
		HttpSession session = request.getSession();
		UserBean ub;
		ub = UserBeanDAO.doRetrieveByKey(mail, psw);
		session.setAttribute("user", ub);
		Boolean b = (ub != null);
	
		session.setAttribute("isLogged", b);
		if(ub != null) {
			String list = ub.getCart();
			session.setAttribute("cart", MovieBeanDAO.getMoviesById(list));
			RequestDispatcher view = request.getRequestDispatcher("/redirect.jsp?act=login");
			view.forward(request, response);
		}else{
			RequestDispatcher view = request.getRequestDispatcher("/login.jsp?err=1");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}