package com.igot.models;

public class MainThread {
	
	private String mthreadID;
	private String categoryID;
	private String title;
	private String description;
	private String dateStarted;
	private String username;
	
	public MainThread(){
		
	}
	
	public MainThread(String mthreadID, String categoryID, String title,
			String description, String dateStarted,String username) {
		super();
		this.mthreadID = mthreadID;
		this.username = username;
		this.categoryID = categoryID;
		this.title = title;
		this.description = description;
		this.dateStarted = dateStarted;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getMthreadID() {
		return mthreadID;
	}

	public void setMthreadID(String mthreadID) {
		this.mthreadID = mthreadID;
	}

	public String getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDateStarted() {
		return dateStarted;
	}

	public void setDateStarted(String dateStarted) {
		this.dateStarted = dateStarted;
	}
	
	
	
}
