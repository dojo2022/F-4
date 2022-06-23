package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONObject;

import dao.VoiceBgiDAO;
import model.LoginUser;
import model.Upload;
/**
 * Servlet implementation class BgiUploadServlet
 */
@WebServlet("/BgiUploadServlet")
@MultipartConfig (location = "C:\\dojo6\\src\\WebContent\\uploadBgi")
public class BgiUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		LoginUser user = (LoginUser)session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			response.sendRedirect("/Sol_ty/LoginServlet");
		}

		request.setCharacterEncoding("UTF-8");
		//name属性がpictのファイルをPartオブジェクトとして取得
		Part part=request.getPart("BGICONTENT");
		//ファイル名を取得
		String filename=part.getSubmittedFileName();//ie対応が不要な場合
		//String filename=Paths.get(part.getSubmittedFileName()).getFileName().toString();

		//実際にファイルが保存されるパス確認
		part.write("C:\\dojo6\\src\\WebContent\\uploadBgi\\"+ filename);

		int userid = user.getUserid();
		String bgicontent = "uploadBgi/"+filename;
		// 更新または削除を行う

		VoiceBgiDAO VDao = new VoiceBgiDAO();
		JSONObject json = new JSONObject();

		int bgiselect = VDao.upload(new Upload(userid, bgicontent,filename));
		if (bgiselect > 0) {	// アップロード成功
			Map<String, String> option = new HashMap<String, String>();
			option.put("bgiselect", Integer.toString(bgiselect));
			option.put("filename", filename);

			json.put("option", option);


			session.setAttribute("result", "アップロードに成功しました");
			response.setContentType("application/json");
			response.setHeader("Cache-Control", "nocache");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);

		}
		else {												// アップロード失敗
			session.setAttribute("result", "アップロードに失敗しました");
		}
	}

}
