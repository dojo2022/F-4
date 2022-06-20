package model;
import java.io.Serializable;

public class Upload implements Serializable {
	private int userid;
	private String bgicontent;
	private String bgititle;

	public Upload(int userid, String bgicontent, String bgititle) {
		super();
		this.userid = userid;
		this.bgicontent = bgicontent;
		this.bgititle = bgititle;
	}

	public Upload() {
		super();
		this.userid = 0;
		this.bgicontent = "";
		this.bgititle = "";
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getBgicontent() {
		return bgicontent;
	}

	public void setBgicontent(String bgicontent) {
		this.bgicontent = bgicontent;
	}

	public String getBgititle() {
		return bgititle;
	}

	public void setBgititle(String bgititle) {
		this.bgititle = bgititle;
	}

}
