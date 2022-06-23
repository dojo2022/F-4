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
 * Servlet implementation class CompTaskServlet
 */
@WebServlet("/CompTaskServlet")
public class CompTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		LoginUser user = (LoginUser)session.getAttribute("user");
		if(user == null) {
			// ログインページにフォワードする
			response.sendRedirect("/Sol_ty/LoginServlet");
		}

		// リクエストパラメータを取得する
		// search.jspと変数名を統一、大文字小文字も
		// 検索処理を行う
		TaskDAO tDao = new TaskDAO();
		List<Task> compList = tDao.compSelect(user);

		// 検索結果をリクエストスコープに格納する
		request.setAttribute("compList", compList);
		//request.setAttribute("id", session.getAttribute("id"));

		// 完了タスク画面ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskComp.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		LoginUser user = (LoginUser)session.getAttribute("user");
		if(user == null) {
			// ログインページにフォワードする
			response.sendRedirect("/Sol_ty/LoginServlet");
		}

		request.setCharacterEncoding("UTF-8");
		int registday = Integer.parseInt(request.getParameter("REGISTDAY"));


		TaskDAO TDao = new TaskDAO();
		int todays = Integer.parseInt(LocalDate.now().toString().replaceAll("-", "/"));
		List<List<Task>> taskList = TDao.select(user , registday, todays);

		request.setAttribute("taskList", taskList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskIncomp.jsp");
		dispatcher.forward(request, response);
	}
}
