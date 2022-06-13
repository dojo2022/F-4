package model;
import java.io.Serializable;

public class Upload implements Serializable {
	private int userid;
	private String bgiupload;
	private String bgititle;

	public Upload(int userid, String bgiupload, String bgititle) {
		super();
		this.userid = userid;
		this.bgiupload = bgiupload;
		this.bgititle = bgititle;
	}

	public Upload() {
		super();
		this.userid = 0;
		this.bgiupload = "";
		this.bgititle = "";
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getBgiupload() {
		return bgiupload;
	}

	public void setBgiupload(String bgiupload) {
		this.bgiupload = bgiupload;
	}

	public String getBgititle() {
		return bgititle;
	}

	public void setBgititle(String bgititle) {
		this.bgititle = bgititle;
	}


}
