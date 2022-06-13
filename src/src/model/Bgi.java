package model;
import java.io.Serializable;

public class Bgi implements Serializable {
	private int bgiselect;
	private String bgititle;

	public Bgi(int bgiselect, String bgititle) {
		super();
		this.bgiselect = bgiselect;
		this.bgititle = bgititle;
	}

	public Bgi() {
		super();
		this.bgiselect = 0;
		this.bgititle = "";
	}

	public int getBgiselect() {
		return bgiselect;
	}

	public void setBgiselect(int bgiselect) {
		this.bgiselect = bgiselect;
	}

	public String getBgititle() {
		return bgititle;
	}

	public void setBgititle(String bgititle) {
		this.bgititle = bgititle;
	}
}
