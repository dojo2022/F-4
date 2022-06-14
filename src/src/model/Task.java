package model;

public class Task {
	private int taskid;
	private int userid;
	private int registday;
	private String compday;
	private String taskflag;
	private String deadline;
	private String taskcontent;


	public Task(int taskid, int userid, int registday, String compday, String taskflag, String deadline, String taskcontent)
	{
		this.taskid = taskid;
		this.userid = userid;
		this.registday = registday;
		this.compday = compday;
		this.taskflag = taskflag;
		this.deadline = deadline;
		this.taskcontent = taskcontent;
	}

	public Task() {
		this.taskid = 0;
		this.userid = 0;
		this.registday = 0;
		this.compday = "";
		this.taskflag = "";
		this.deadline = "";
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

	public int getRegistday() {
		return registday;
	}

	public void setRegistday(int registday) {
		this.registday = registday;
	}

	public String getCompday() {
		return compday;
	}


	public void setCompday(String compday) {
		this.compday = compday;
	}
	public String getTaskflag() {
		return taskflag;
	}

	public void setTaskflag(String taskflag) {
		this.taskflag = taskflag;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getTaskcontent() {
		return taskcontent;
	}

	public void setTaskcontent(String taskcontent) {
		this.taskcontent = taskcontent;
	}


}

