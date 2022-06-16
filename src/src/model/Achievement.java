package model;

public class Achievement {
	private int achieveid; //実績ID
	private String title; //タイトル
	private String condition; //取得条件
	private String achievecontent; //実績内容

	public Achievement(int achieveid, String title, String condition, String achievecontent) {
		this.achieveid = achieveid;
		this.title = title;
		this.condition = condition;
		this.achievecontent = achievecontent;
	}

	public Achievement() {
		this.achieveid = 0;
		this.title = "";
		this.condition = "";
		this.achievecontent = "";
	}

	public int getAchieveid() {
		return achieveid;
	}

	public void setAchieveid(int achieveid) {
		this.achieveid = achieveid;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getAchievecontent() {
		return achievecontent;
	}

	public void setAchievecontent(String achievecontent) {
		this.achievecontent = achievecontent;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}




}
