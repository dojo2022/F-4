package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SettingDAO;
import model.Setting;

/**
 * Servlet implementation class SettingServlet
 */
@WebServlet("/SettingServlet")
public class SettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				HttpSession session = request.getSession();
				if (session.getAttribute("user") == null) {
					response.sendRedirect("/Sol_ty/LoginServlet");
					return;
				}

				// 設定ページにフォワードする
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/setting.jsp");
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				HttpSession session = request.getSession();
				if (session.getAttribute("user") == null) {
					response.sendRedirect("/Sol_ty/LoginServlet");
					return;
				}

				// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				int userid = Integer.parseInt(request.getParameter("USERID"));
				int voiceswitch = Integer.parseInt(request.getParameter("VOICESWITCH"));
				int voiceselect = Integer.parseInt(request.getParameter("VOICESELECT"));
				int bgiselect = Integer.parseInt(request.getParameter("BGISELECT"));

				//
				SettingDAO sDao = new SettingDAO();
				//getParameterの値は未定なので後で決定
				if (sDao.update(new Setting(userid, voiceswitch, voiceselect, bgiselect))) {

					request.setAttribute("result", "設定が反映されました"); //設定反映成功
				}

				else {

					request.setAttribute("result", "反映に失敗しました"); //設定反映失敗

				}

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/setting.jsp");
				dispatcher.forward(request, response);
	}

}
