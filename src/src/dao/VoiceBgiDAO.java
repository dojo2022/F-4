package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Upload;

public class VoiceBgiDAO {
	public List<Map<Integer, String>> voiceBgiSelect() {
		List<Map<Integer, String>> vbList = new ArrayList<Map<Integer, String>>();
		Map<Integer, String> voiceList = new HashMap<Integer, String>();
		Map<Integer, String> bgiList = new HashMap<Integer, String>();

		Connection conn = null;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SELECT文を準備する
			String sql = "select voiceselect, voicetitle from voice";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			String sql2 = "select bgiselect, bgititle from bgi";
			PreparedStatement pStmt2 = conn.prepareStatement(sql2);

			// SELECT文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();
			ResultSet rs2 = pStmt2.executeQuery();

			// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
			while(rs.next()) {
				voiceList.put(rs.getInt("VOICESELECT"), rs.getString("VOICETITLE"));
			}
			while(rs2.next()) {
				bgiList.put(rs.getInt("BGISELECT"), rs.getString("BGITITLE"));
			}
			vbList.add(voiceList);
			vbList.add(bgiList);
		}
		catch (SQLException e) {
			e.printStackTrace();
			vbList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			vbList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					vbList = null;
				}
			}
		}
		return vbList;
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
