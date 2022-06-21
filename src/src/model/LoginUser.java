package model;

import java.io.Serializable;

public class LoginUser implements Serializable{
	private int userid;
	private String username;
	private int taskcount;
	private int voiceswitch;
	private int voiceselect;
	private int bgiselect;
	private String bgicontent;



	public LoginUser() {
		this.userid = 0;
		this.username = "";
		this.taskcount = 0;
		this.voiceswitch = 0;
		this.voiceselect = 0;
		this.bgiselect = 0;
		this.bgicontent = "";
	}

	public LoginUser(int userid, String username, int taskcount, int voiceswitch, int voiceselect, int bgiselect,
			String bgicontent) {
		super();
		this.userid = userid;
		this.username = username;
		this.taskcount = taskcount;
		this.voiceswitch = voiceswitch;
		this.voiceselect = voiceselect;
		this.bgiselect = bgiselect;
		this.bgicontent = bgicontent;
	}


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

	public int getTaskcount() {
		return taskcount;
	}

	public void setTaskcount(int taskcount) {
		this.taskcount = taskcount;
	}

	public int getVoiceswitch() {
		return voiceswitch;
	}

	public void setVoiceswitch(int voiceswitch) {
		this.voiceswitch = voiceswitch;
	}

	public int getVoiceselect() {
		return voiceselect;
	}

	public void setVoiceselect(int voiceselect) {
		this.voiceselect = voiceselect;
	}

	public int getBgiselect() {
		return bgiselect;
	}

	public void setBgiselect(int bgiselect) {
		this.bgiselect = bgiselect;
	}

	public String getBgicontent() {
		return bgicontent;
	}

	public void setBgicontent(String bgicontent) {
		this.bgicontent = bgicontent;
	}

}
