package model;

import java.io.Serializable;

public class LoginUser implements Serializable{
	private int userid;
	private String username;
	private int taskcount;
	private int voiceswitch;
	private String compvoice;
	private String incompvoice;
	private String acvoice;
	private String bgicontent;

	public LoginUser() {
		this.userid = 0;
		this.username = "";
		this.taskcount = 0;
		this.voiceswitch = 0;
		this.compvoice = "";
		this.incompvoice = "";
		this.acvoice = "";
		this.bgicontent = "";
	}

	public LoginUser(int userid, String username, int taskcount, int voiceswitch, String compvoice, String incompvoice,
			String acvoice, String bgicontent) {
		this.userid = userid;
		this.username = username;
		this.taskcount = taskcount;
		this.voiceswitch = voiceswitch;
		this.compvoice = compvoice;
		this.incompvoice = incompvoice;
		this.acvoice = acvoice;
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
	public String getCompvoice() {
		return compvoice;
	}
	public void setCompvoice(String compvoice) {
		this.compvoice = compvoice;
	}
	public String getIncompvoice() {
		return incompvoice;
	}
	public void setIncompvoice(String incompvoice) {
		this.incompvoice = incompvoice;
	}
	public String getAcvoice() {
		return acvoice;
	}
	public void setAcvoice(String acvoice) {
		this.acvoice = acvoice;
	}
	public String getBgicontent() {
		return bgicontent;
	}
	public void setBgicontent(String bgicontent) {
		this.bgicontent = bgicontent;
	}



}
