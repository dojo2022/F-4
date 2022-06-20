package model;
import java.io.Serializable;

public class Result implements Serializable{
	private boolean result;

	public Result(boolean result) {
		this.result = result;
	}

	public Result() {
		this.result = false;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}



}
