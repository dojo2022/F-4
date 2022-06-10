package model;

public class Setting {
	private int voiceswitch;
	private int voiceselect;
	private int bgiselect;
	private int taskcount;
	private String compvoice;
	private String incompvoice;
	private String acvoice;
	private int uploaduser;
	private String bgiupload;

	public Setting(int voiceswitch, int voiceselect, int bgiselect, int taskcount, String compvoice, String incompvoice,
			String acvoice, int uploaduser, String bgiupload) {
		this.voiceswitch = voiceswitch;
		this.voiceselect = voiceselect;
		this.bgiselect = bgiselect;
		this.taskcount = taskcount;
		this.compvoice = compvoice;
		this.incompvoice = incompvoice;
		this.acvoice = acvoice;
		this.uploaduser = uploaduser;
		this.bgiupload = bgiupload;
	}

	public Setting() {
		this.voiceswitch = 0;
		this.voiceselect = 0;
		this.bgiselect = 0;
		this.taskcount = 0;
		this.compvoice = "";
		this.incompvoice = "";
		this.acvoice = "";
		this.uploaduser = 0;
		this.bgiupload = "";
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

	public int getTaskcount() {
		return taskcount;
	}

	public void setTaskcount(int taskcount) {
		this.taskcount = taskcount;
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

	public int getUploaduser() {
		return uploaduser;
	}

	public void setUploaduser(int uploaduser) {
		this.uploaduser = uploaduser;
	}

	public String getBgiupload() {
		return bgiupload;
	}

	public void setBgiupload(String bgiupload) {
		this.bgiupload = bgiupload;
	}


}
