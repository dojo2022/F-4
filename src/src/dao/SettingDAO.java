package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.Setting;

public class SettingDAO {
	// 引数settingで指定されたレコードを更新し、成功したらtrueを返す
		public boolean update(Setting setting) {
			Connection conn = null;
			boolean result = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

				// SQL文を準備する
				String sql = "UPDATE IDPW set VOICESWITCH=?, VOICESELECT=?, BGISELECT=? where USERID=?";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				// SQL文を完成させる
				if (setting.getVoiceswitch() == 0 || setting.getVoiceswitch() == 1) {
					pStmt.setInt(1, setting.getVoiceswitch());
				}
				else {
					pStmt.setInt(1, 0);
				}
				if (setting.getVoiceselect() > 0) {
					pStmt.setInt(2, setting.getVoiceselect());
				}
				else {
					pStmt.setInt(2, 1);
				}
				if (setting.getBgiselect() > 0) {
					pStmt.setInt(3, setting.getBgiselect());
				}
				else {
					pStmt.setInt(3, 1);
				}

				pStmt.setInt(4, setting.getUserid());

				// SQL文を実行する
				if (pStmt.executeUpdate() == 1) {
					result = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			// 結果を返す
			return result;
		}
		//select文でLoginUserに格納する処理を書く？
}
