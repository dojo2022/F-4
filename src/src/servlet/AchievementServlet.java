package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AchievementDAO;
import model.Achievement;
import model.LoginUser;


/**
 * Servlet implementation class AchievementServlet
 */
@WebServlet("/AchievementServlet")
public class AchievementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				HttpSession session = request.getSession();
				if (session.getAttribute("user") == null) {
					response.sendRedirect("/Sol_ty/LoginServlet");
				}
				LoginUser user = (LoginUser)session.getAttribute("user");
				// 検索処理を行う
				AchievementDAO achieveDao = new AchievementDAO();
				List<Achievement> achieveList = achieveDao.select(user);

				// 検索結果をリクエストスコープに格納する
				request.setAttribute("achieveList", achieveList);
				//request.setAttribute("id", session.getAttribute("id"));

				// 登録ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/achievement.jsp");
				dispatcher.forward(request, response);
	}
}

