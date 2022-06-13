package model;

public class Setting {

	private int userid;
	private int voiceswitch;
	private int voiceselect;
	private int bgiselect;

	public Setting() {
		this.userid = 0;
		this.voiceswitch = 0;
		this.voiceselect = 0;
		this.bgiselect = 0;
	}

	public Setting(int userid, int voiceswitch, int voiceselect, int bgiselect) {
		this.userid = userid;
		this.voiceswitch = voiceswitch;
		this.voiceselect = voiceselect;
		this.bgiselect = bgiselect;
	}


	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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

}
