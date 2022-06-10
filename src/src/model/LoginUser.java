package model;

import java.io.Serializable;

public class LoginUser implements Serializable{
	private String username;

	public LoginUser() {
		this(null);
	}

	public LoginUser(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
