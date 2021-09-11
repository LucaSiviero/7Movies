package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ReviewBean;
import model.ReviewBeanDAO;
import model.UserBean;

/**
 * Servlet implementation class ReviewMovie
 */
@WebServlet("/ReviewMovie")
public class ReviewMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewMovie() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		UserBean user = (UserBean) s.getAttribute("user");
		String title;
		String rev;
		long id = Long.parseLong(request.getParameter("id"));
		title = request.getParameter("title");
		rev = request.getParameter("rev");
		
		if(user != null && title != null && rev != null) {
			ReviewBean review = new ReviewBean();
			review.setTitle(title);
			review.setReview(rev);
			review.setName(user.getName());
			review.setMail(user.getMail());
			review.setId(id);
			int i = ReviewBeanDAO.addReview(review);
			
			RequestDispatcher view = request.getRequestDispatcher("movieinfo.jsp?movie=" + id + "&act=rev&res=" + i);
			view.forward(request, response);
		}
	}

}
