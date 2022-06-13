package model;
import java.io.Serializable;

public class Voice implements Serializable {
	private int voiceselect;
	private String voicetitle;

	public Voice(int voiceselect, String voicetitle) {
		super();
		this.voiceselect = voiceselect;
		this.voicetitle = voicetitle;
	}

	public Voice() {
		super();
		this.voiceselect = 0;
		this.voicetitle = "";
	}

	public int getVoiceselect() {
		return voiceselect;
	}

	public void setVoiceselect(int voiceselect) {
		this.voiceselect = voiceselect;
	}

	public String getVoicetitle() {
		return voicetitle;
	}

	public void setVoicetitle(String voicetitle) {
		this.voicetitle = voicetitle;
	}
}
