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
 * Servlet implementation class UpdateDeleteServlet
 */
@WebServlet("/UpdateDeleteServlet")
public class UpdateDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/Sol_ty/LoginServlet");
			return;
		}
		//3つ使う
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String[] taskid = request.getParameterValues("TASKID");
		String taskflag = request.getParameter("TASKFLAG");
		String taskcontent = request.getParameter("TASKCONTENT");


		// 更新または削除を行う
		TaskDAO TDao = new TaskDAO();
		if (request.getParameter("SUBMIT").equals("更新")) {
			if (TDao.update(new Task(0,0,0,"",taskflag,"",taskcontent),taskid)) {	// 更新成功
				request.setAttribute("result",
				 "更新成功");
			}
			else {												// 更新失敗
				request.setAttribute("result",
						 "更新失敗");
			}
		}
		else {
			if (TDao.delete(taskid)) {	// 削除成功
				request.setAttribute("result",
						 "削除成功");
			}
			else {						// 削除失敗
				request.setAttribute("result",
						 "削除失敗");
			}
		}

		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}
}




