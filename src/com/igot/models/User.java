package com.igot.models;

public class User {

	private String userName;
	private String password;
	private String lastname;
	private String firstName;
	
	public User(){
		
	}

	public User(String userName, String password, String lastname,
			String firstName) {
		super();
		this.userName = userName;
		this.password = password;
		this.lastname = lastname;
		this.firstName = firstName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
}
