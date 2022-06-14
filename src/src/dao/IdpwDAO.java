package dao;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Idpw;
import model.LoginUser;

public class IdpwDAO {
	// ログインできるならtrueを返す
		public LoginUser isLoginOK(Idpw idpw) {
			Connection conn = null;
			LoginUser user = null;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

				// SELECT文を準備する
				String sql = "select count(*), USERID, USERNAME, TASKCOUNT, VOICESWITCH, COMPVOICE, INCOMPVOICE, ACVOICE, BGICONTENT FROM IDPW LEFT OUTER JOIN VOICE ON IDPW.VOICESELECT = VOICE.VOICESELECT LEFT OUTER JOIN BGI ON IDPW.BGISELECT = BGI.BGISELECT where USERNAME = ? and PASSWORD = ? GROUP BY USERID";
				PreparedStatement pStmt = conn.prepareStatement(sql);

				String result = getHash(idpw.getPassword(),"MD5");//MD5でハッシュ化
				pStmt.setString(1, idpw.getUsername());
				pStmt.setString(2,result);

				// SELECT文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
				rs.next();
				if (rs.getInt("count(*)") == 1) {
					user =  new LoginUser(rs.getInt("USERID"),
							rs.getString("USERNAME"),
							rs.getInt("TASKCOUNT"),
							rs.getInt("VOICESWITCH"),
							rs.getString("COMPVOICE"),
							rs.getString("INCOMPVOICE"),
							rs.getString("ACVOICE"),
							rs.getString("BGICONTENT"));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				user = null;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				user = null;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						user = null;
					}
				}
			}

			// 結果を返す
			return user;
		}
		public LoginUser update(LoginUser user) {
			Connection conn = null;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

				// SELECT文を準備する
				String sql = "select count(*), VOICESWITCH, COMPVOICE, INCOMPVOICE, ACVOICE, BGICONTENT FROM IDPW LEFT OUTER JOIN VOICE ON IDPW.VOICESELECT = VOICE.VOICESELECT LEFT OUTER JOIN BGI ON IDPW.BGISELECT = BGI.BGISELECT where USERID = ?";
				PreparedStatement pStmt = conn.prepareStatement(sql);


				pStmt.setInt(1,user.getUserid());


				// SELECT文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// ユーザーIDとパスワードが一致するユーザーがいたかどうかをチェックする
				rs.next();
				if (rs.getInt("count(*)") == 1) {
					user.setVoiceswitch(rs.getInt("VOICESWITCH"));
					user.setCompvoice(rs.getString("COMPVOICE"));
					user.setIncompvoice(rs.getString("INCOMPVOICE"));
					user.setAcvoice(rs.getString("ACVOICE"));
					user.setBgicontent(rs.getString("BGICONTENT"));


				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				user = null;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				user = null;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						user = null;
					}
				}
			}

			return user;
		}
		public boolean insert(Idpw idpw) {
			Connection conn = null;
			boolean insertResult = false;

			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo_db/Sol-ty", "sa", "");

				// SELECT文を準備する
				String sql = "insert into idpw (USERNAME, PASSWORD, SECQUESTION, SECANSWER, VOICESWITCH, VOICESELECT, BGISELECT) values (?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement pStmt = conn.prepareStatement(sql);
				String username = idpw.getUsername();
				String password = idpw.getPassword();
			    String secques = idpw.getSecquestion();
				String secans = idpw.getSecanswer();

				password = getHash(password, "MD5");

				String sql2 = "select count(*) from idpw where USERNAME = ?";
				PreparedStatement pStmt2 = conn.prepareStatement(sql2);
				pStmt2.setString(1, idpw.getUsername());

				// SELECT文を実行し、結果表を取得する
				ResultSet rs = pStmt2.executeQuery();
				rs.next();
				// ユーザーネームが一致するユーザーがいたかどうかをチェックする
				if (rs.getInt("count(*)") == 1) {
					return false;
				}


				if (username != null && !username.equals("")) pStmt.setString(1, username);
				else return false;
				if (password != null && !password.equals("")) pStmt.setString(2, password);
				else return false;
				if (secques != null && !secques.equals("")) pStmt.setString(3, secques);
				else return false;
				if (secans != null && !secans.equals("")) pStmt.setString(4, secans);
				else return false;
				pStmt.setInt(5, 1);
				pStmt.setInt(6, 1);
				pStmt.setInt(7, 1);

				if (pStmt.executeUpdate() == 1) {
					return true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				insertResult = false;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				insertResult = false;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						insertResult = false;
					}
				}
			}

			// 結果を返す
			return insertResult;
		}
		//複数のハッシュアルゴリズムに対応しています。
		//マルチハッシュ化メソッドです。
		public String getHash(String str, String algo) {
			byte[] cipher_byte;
			try{
				MessageDigest md = MessageDigest.getInstance(algo);
				md.update(str.getBytes());
				cipher_byte = md.digest();
				StringBuilder sb = new StringBuilder(2 * cipher_byte.length);
				for(byte b: cipher_byte) {
					sb.append(String.format("%02x", b&0xff) );
				}
				return sb.toString();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return "";
		}
}
