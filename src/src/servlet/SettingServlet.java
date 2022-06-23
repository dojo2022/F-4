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

import dao.IdpwDAO;
import dao.SettingDAO;
import dao.VoiceBgiDAO;
import model.Bgi;
import model.LoginUser;
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
				LoginUser user = (LoginUser)session.getAttribute("user");

				if (user == null) {
					response.sendRedirect("/Sol_ty/LoginServlet");
					return;
				}

				// 設定ページにフォワードする
				VoiceBgiDAO vbDAO = new VoiceBgiDAO();
				List<Bgi> bgiList = vbDAO.BgiSelect(user.getUserid());

				session.setAttribute("bgiList", bgiList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/setting.jsp");
			dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// もしもログインしていなかったらログインサーブレットにリダイレクトする
				HttpSession session = request.getSession();
				LoginUser user = (LoginUser)session.getAttribute("user");
				if (user == null) {
					response.sendRedirect("/Sol_ty/LoginServlet");
					return;
				}

				// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				int userid = user.getUserid();
				int voiceswitch = Integer.parseInt(request.getParameter("VOICESWITCH"));
				int voiceselect = Integer.parseInt(request.getParameter("VOICESELECT"));
				int bgiselect = Integer.parseInt(request.getParameter("BGISELECT"));

				//
				SettingDAO sDao = new SettingDAO();
				IdpwDAO iDao = new IdpwDAO();

				//getParameterの値は未定なので後で決定
				Setting setting = new Setting(userid, voiceswitch, voiceselect, bgiselect);
				if (sDao.update(setting)) {
					//設定反映成功
					iDao.update(user);
					session.setAttribute("user", user);
					request.setAttribute("result", "設定が反映されました");

					VoiceBgiDAO vbDAO = new VoiceBgiDAO();
					List<Bgi> bgiList = vbDAO.BgiSelect(user.getUserid());

					session.setAttribute("bgiList", bgiList);
				}

				else {

					request.setAttribute("result", "反映に失敗しました"); //設定反映失敗

				}

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/setting.jsp");
				dispatcher.forward(request, response);
	}

}
