package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TaskDAO;
import model.Task;

/**
 * Servlet implementation class TaskRegistServlet
 */
@WebServlet("/TaskRegistServlet")
public class TaskRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/Sol_ty/LoginServlet");
			return;
		}

		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskregist.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				HttpSession session = request.getSession();
				if (session.getAttribute("user") == null) {
					response.sendRedirect("/Sol_ty/LoginServlet");
					return;
				}

				// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				int taskid = Integer.parseInt(request.getParameter("taskid"));
				int userid = Integer.parseInt(request.getParameter("userid"));
				int registday =- Integer.parseInt(request.getParameter("registday"));
				String compday = request.getParameter("compday");
				String taskflag = request.getParameter("taskflag");
				String deadline = request.getParameter("deadline");
				String taskcontent = request.getParameter("taskcontent");


				// 登録処理を行う
				TaskDAO tDao = new TaskDAO();

				//登録成功
				if (tDao.insert(new Task(taskid, userid, registday, compday, taskflag, deadline, taskcontent))) {
				request.setAttribute("result", "タスクが登録されました" );
				// 登録失敗
				}else {
				request.setAttribute("result", "登録に失敗しました");
				}

				// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskRegist.jsp");
				dispatcher.forward(request, response);

	}

}
