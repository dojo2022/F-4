package servlet;

import java.io.IOException;
import java.time.LocalDate;

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
		if(session.getAttribute("registday") == null) {
			session.setAttribute("registday",  LocalDate.now().toString().replaceAll("-", "/"));
		}
		// 登録ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskRegist.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				HttpSession session = request.getSession();
				LoginUser user = (LoginUser)session.getAttribute("user");
				if(user == null) {
					// ログインページにフォワードする
					response.sendRedirect("/Sol_ty/LoginServlet");
				}

				// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				int userid = user.getUserid();
				int registday = Integer.parseInt(request.getParameter("REGISTDAY"));
				String deadline = request.getParameter("DEADLINE");
				String taskcontent = request.getParameter("TASKCONTENT");

				// 登録処理を行う
				TaskDAO tDao = new TaskDAO();

				//登録成功
				if (tDao.insert(new Task(0, userid, registday, "", "", deadline, taskcontent))) {
				request.setAttribute("result", "タスクが登録されました" );
				String regist = Integer.toString(registday);
				regist = String.format("%s/%s/%s", regist.substring(0,4),regist.substring(4,6),regist.substring(6));
				session.setAttribute("registday", regist);
				// 登録失敗
				}else {
				request.setAttribute("result", "登録に失敗しました");
				}

				// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/taskRegist.jsp");
				dispatcher.forward(request, response);

	}

}
