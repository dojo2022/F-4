package servlet;

import java.io.File;
import java.io.IOException;

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
		Part part=request.getPart("BGICONTENT");
		//ファイル名を取得
		String filename=part.getSubmittedFileName();//ie対応が不要な場合
		//String filename=Paths.get(part.getSubmittedFileName()).getFileName().toString();
		//アップロードするフォルダ
		String path=getServletContext().getRealPath("/Sol_ty");
		//実際にファイルが保存されるパス確認
		part.write(path+File.separator+filename);
		//System.out.println(path);
		//書き込み
		/*
		part.write(path+File.separator+filename);
		request.setAttribute("BGICONTENT", path+File.separator+filename);
		request.setAttribute("BGITITLE", filename);
		*/
		// リクエストパラメータを取得する
		/*
		request.setCharacterEncoding("UTF-8");
		String bgicontent = request.getParameter("BGICONTENT");
		String bgititle = request.getParameter("BGITITLE");
		*/
		int userid = user.getUserid();
		String bgicontent = path+File.separator+filename;
		// 更新または削除を行う

		VoiceBgiDAO VDao = new VoiceBgiDAO();

		if (VDao.upload(new Upload(userid, bgicontent,filename))) {	// アップロード成功
			request.setAttribute("result", true);
		}
		else {												// アップロード失敗
			request.setAttribute("result", false);
		}
	}

}


