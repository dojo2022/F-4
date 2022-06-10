package model;
import java.io.Serializable;
	public class Idpw implements Serializable{
		private int userid; //ユーザーID
		private String username; //ユーザーネーム
		private String password; //パスワード
		private String secquestion; //秘密の質問
		private String secanswer; //秘密の質問の回答

		//引数のあるコンストラクタ
		public Idpw(int userid, String username, String password, String secquestion, String secanswer) {
			this.userid = userid;
			this.username = username;
			this.password = password;
			this.secquestion = secquestion;
			this.secanswer = secanswer;
		}

		//引数のないコンストラクタ
		public Idpw() {
			this.userid = 0;
			this.username = "";
			this.password = "";
			this.secquestion = "";
			this.secanswer = "";
		}


		//ゲッターとセッター

		public int getUserid() {
			return userid;
		}

		public void setUserid(int userid) {
			this.userid = userid;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getSecquestion() {
			return secquestion;
		}


		public void setSecquestion(String secquestion) {
			this.secquestion = secquestion;
		}


		public String getSecanswer() {
			return secanswer;
		}


		public void setSecanswer(String secanswer) {
			this.secanswer = secanswer;
		}

	}
