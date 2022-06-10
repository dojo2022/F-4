package model;

public class Task {
	private int taskid; //タスク番号
	private int userid; //ユーザー番号
	private String day; //日付
	private String status; //完了フラグ
	private String time; //時間
	private String taskcontent; //タスク内容

	public Task(int taskid, int userid, String day, String status, String time, String taskcontent) {
		this.taskid = taskid;
		this.userid = userid;
		this.day = day;
		this.status = status;
		this.time = time;
		this.taskcontent = taskcontent;
	}

	public Task() {
		this.taskid = 0;
		this.userid = 0;
		this.day = "";
		this.status = "";
		this.time = "";
		this.taskcontent = "";
	}


	public int getTaskid() {
		return taskid;
	}

	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTaskcontent() {
		return taskcontent;
	}

	public void setTaskcontent(String taskcontent) {
		this.taskcontent = taskcontent;
	}


}

