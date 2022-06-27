package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Achievement;
import model.LoginUser;

public class AchievementDAO {
	public List<Achievement> select(LoginUser user) {
		Connection conn = null;
		List<Achievement> achieveList = new ArrayList<Achievement>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

			// SQL文を準備する<<ここを改造>>
			String sql = "select * from Achievement";
			PreparedStatement pStmt = conn.prepareStatement(sql);



			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする<<ここを改造>>

						while (rs.next()) {
							if (user.getTaskcount() >= rs.getInt("ACHIEVEID")) {
								Achievement achieve = new Achievement(
								(rs.getInt("ACHIEVEID") / 5) + 1,
								rs.getString("ACHIEVETITLE"),
								rs.getString("CONDITION"),
								rs.getString("ACHIEVECONTENT")
								);
								achieveList.add(achieve);
							}
						}
					}
					catch (SQLException e) {
						e.printStackTrace();
						achieveList = null;
					}
					catch (ClassNotFoundException e) {
						e.printStackTrace();
						achieveList = null;
					}
					finally {
						// データベースを切断
						if (conn != null) {
							try {
								conn.close();
							}
							catch (SQLException e) {
								e.printStackTrace();
								achieveList = null;
							}
						}
					}
			return achieveList;
	}

}
