package servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.VoiceBgiDAO;
import model.LoginUser;
import model.Upload;

/**
 * Servlet implementation class BgiUploadServlet
 */
@WebServlet("/BgiUploadServlet")
public class BgiUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BgiUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}


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
		LoginUser user = (LoginUser)session.getAttribute("user");

		request.setCharacterEncoding("utf-8");
		//name属性がpictのファイルをPartオブジェクトとして取得
		Part part=request.getPart("BGIUPLOAD");
		//ファイル名を取得
		String filename=part.getSubmittedFileName();//ie対応が不要な場合
		//String filename=Paths.get(part.getSubmittedFileName()).getFileName().toString();
		//アップロードするフォルダ
		String path=getServletContext().getRealPath("/フォルダ名");
		//実際にファイルが保存されるパス確認　ここを変える？

		//System.out.println(path);
		//書き込み
		part.write(path+File.separator+filename);
		request.setAttribute("BGIUPLOAD", filename);


		// リクエストパラメータを取得する
		request.setCharacterEncoding("UTF-8");
		int userid = user.getUserid();
		String bgiupload = request.getParameter("BGIUPLOAD");
		String bgititle = request.getParameter("BGITITLE");


		// 更新または削除を行う
		VoiceBgiDAO VDao = new VoiceBgiDAO();

		if (VDao.upload(new Upload(userid,bgiupload,bgititle))) {	// アップロード成功
			request.setAttribute("result",
					"アップロード成功");
		}
		else {												// アップロード失敗
			request.setAttribute("result",
					"アップロード失敗");
		}




		// 結果ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/result.jsp");
		dispatcher.forward(request, response);
	}

}


