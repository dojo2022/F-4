package model;
import java.io.Serializable;

public class Result implements Serializable{
	private String result;

	public Result(String result) {
		this.result = result;
	}

	public Result() {
		this.result = "";
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
}
