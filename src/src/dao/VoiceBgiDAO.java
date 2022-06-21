package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Bgi;
import model.Upload;

public class VoiceBgiDAO {
	public List<Bgi> BgiSelect(int userid) {

		List<Bgi> bgiList = new ArrayList<Bgi>();

		Connection conn = null;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SELECT文を準備する
			String sql = "select bgiselect, bgititle from bgi where userid = -1 or userid = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
		    pStmt.setInt(1, userid);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			while(rs.next()) {
				bgiList.add(new Bgi(rs.getInt("BGISELECT"), rs.getString("BGITITLE")));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			bgiList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			bgiList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					bgiList = null;
				}
			}
		}
		return bgiList;
	}

	public boolean upload(Upload upload) {
		Connection conn = null;
		boolean uploadResult = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SELECT文を準備する
			String sql = "insert into idpw (USERID, BGIUPLOAD, BGITITLE) values (?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			int userid = upload.getUserid();
			String bgicontent = upload.getBgicontent();
		    String bgititle  = upload.getBgititle();

			if (userid != -1) pStmt.setInt(1, userid);
			else return false;
			if (bgicontent != null && !bgicontent.equals("")) pStmt.setString(2, bgicontent);
			else return false;
			if (bgititle != null && !bgititle.equals("")) pStmt.setString(3, bgititle);
			else return false;

			//
			if (pStmt.executeUpdate() == 1) {
				return true;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			uploadResult = false;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			uploadResult = false;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					uploadResult = false;
				}
			}
		}

		// 結果を返す
		return uploadResult;
	}
}
