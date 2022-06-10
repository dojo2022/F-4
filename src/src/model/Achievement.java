package model;

public class Achievement {
	private int achieveid; //実績ID
	private String condition; //取得条件
	private int point; //実績ポイント
	private String achievecontent; //実績内容

	public Achievement(int achieveid, String condition, int point, String achievecontent) {
		this.achieveid = achieveid;
		this.condition = condition;
		this.point = point;
		this.achievecontent = achievecontent;
	}

	public Achievement() {
		this.achieveid = 0;
		this.condition = "";
		this.point = 0;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAchievecontent() {
		return achievecontent;
	}

	public void setAchievecontent(String achievecontent) {
		this.achievecontent = achievecontent;
	}




}
