package servlet;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TaskDAO;
import model.LoginUser;


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
		LoginUser user = (LoginUser)session.getAttribute("user");

		if (user == null) {
			response.sendRedirect("/Sol_ty/LoginServlet");
			return;
		}
		//3つ使う
		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		String[] taskid = request.getParameter("TASKID").split(",");
		String taskflag = request.getParameter("TASKFLAG");

		String taskcontent = "";
		if(request.getParameter("TASKCONTENT") != null) {
			taskcontent = request.getParameter("TASKCONTENT");
		}

		String sub = request.getParameter("COMP");


		// 更新または削除を行う
		TaskDAO TDao = new TaskDAO();
		if (sub.equals("完了")) {
			String compday = LocalDate.now().toString().replaceAll("-", "");
			if (TDao.flagUpdate(user,compday,taskflag,taskid)) {	// 更新成功
				request.setAttribute("result", "更新しました");
				user.setTaskcount(user.getTaskcount() + taskid.length);
				session.setAttribute("user", user);
			}
			else {												// 更新失敗
				request.setAttribute("result", "更新に失敗しました");
			}
		}
		else if(sub.equals("削除")) {
			if (TDao.delete(user.getUserid(),taskid)) {	// 更新成功
				request.setAttribute("result", "更新しました");
			}
			else {												// 更新失敗
				request.setAttribute("result", "更新に失敗しました");
			}
		}
		else {	if (TDao.textUpdate(user.getUserid(), taskcontent,taskid[0])) {	// 更新成功
				request.setAttribute("result", "更新しました");
			}
			else {												// 更新失敗
				request.setAttribute("result", "更新に失敗しました");
			}
		}
		 //結果ページにフォワードする
		response.sendRedirect("/Sol_ty/InCompTaskServlet");

	}
}





