package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import dao.TaskDAO;

/**
 * Servlet implementation class CalendarServlet
 */
@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		/*HttpSession session = request.getSession();
				if (session.getAttribute("user") == null) {
					response.sendRedirect("/Sol_ty/LoginServlet");
					return;
				}*/

		// カレンダーページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/calendar.jsp");
		dispatcher.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");

		String submit = request.getParameter("SUBMIT");

		int registday = 0;

		if(request.getParameter("REGISTDAY") != null) {
			registday = Integer.parseInt(request.getParameter("REGISTDAY"));
		}


		HttpSession session = request.getSession();
		//LoginUser user = (LoginUser)session.getAttribute("user");

		if (submit.equals("タスク確認")) {

			session.setAttribute("registday", registday);
			response.sendRedirect("/Sol_ty/InCompTaskServlet");
		}
		else if(submit.equals("タスク登録")) {
			session.setAttribute("registday", registday);
			response.sendRedirect("/Sol_ty/TaskRegistServlet");
		}
		else if(submit.equals("日付変更")) {
			int taskid = Integer.parseInt(request.getParameter("TASKID"));
			TaskDAO TDao = new TaskDAO();

			if(TDao.updateDate(1, taskid, registday))
				request.setAttribute("result", true);
			else
				request.setAttribute("result", false);
		}
		else {
			int year = Integer.parseInt(request.getParameter("YEAR"));
			int month = Integer.parseInt(request.getParameter("MONTH"));

			TaskDAO TDao = new TaskDAO();
			JSONObject json = new JSONObject();

			json = TDao.monthTask(1, year, month);

			response.setContentType("application/json");
			response.setHeader("Cache-Control", "nocache");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}
	}
}
