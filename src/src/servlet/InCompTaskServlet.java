package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TaskDAO;
import model.LoginUser;
import model.Task;

/**
 * Servlet implementation class InCompTaskServlet
 */
@WebServlet("/InCompTaskServlet")
public class InCompTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		LoginUser user = (LoginUser)session.getAttribute("user");
		if(user == null) {
			// ログインページにフォワードする
			response.sendRedirect("/Sol_ty/LoginServlet");
		}

		TaskDAO TDao = new TaskDAO();

		int todays = Integer.parseInt(LocalDate.now().toString().replaceAll("-", ""));
		int registday = todays;

		if(session.getAttribute("registday") != null) {
			registday = (int)session.getAttribute("registday");
			session.removeAttribute("registday");
		}
		else registday = todays;

		List<List<Task>> taskList = TDao.select(user , registday, todays);

		request.setAttribute("taskList", taskList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskIncomp.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		if(session.getAttribute("user") == null) {
			// ログインページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
			dispatcher.forward(request, response);
		}

		request.setCharacterEncoding("UTF-8");
		int registday = Integer.parseInt(request.getParameter("REGISTDAY"));


		TaskDAO TDao = new TaskDAO();
		LoginUser user = (LoginUser)session.getAttribute("user");
		int todays = Integer.parseInt(LocalDate.now().toString().replaceAll("-", ""));
		List<List<Task>> taskList = TDao.select(user , registday, todays);

		request.setAttribute("taskList", taskList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskIncomp.jsp");
		dispatcher.forward(request, response);
	}

}
