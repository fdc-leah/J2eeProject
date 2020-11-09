package com.igot.models;

public class SubThread {
	
	private String category;
	private String mainThread;
	private String comment;
	private String dateSent;
	private String sender;
	
	public SubThread(){
		
	}

	public SubThread(String category, String mainThread, String comment,
			String dateSent, String sender) {
		super();
		this.category = category;
		this.mainThread = mainThread;
		this.comment = comment;
		this.dateSent = dateSent;
		this.sender = sender;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMainThread() {
		return mainThread;
	}

	public void setMainThread(String mainThread) {
		this.mainThread = mainThread;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getDateSent() {
		return dateSent;
	}

	public void setDateSent(String dateSent) {
		this.dateSent = dateSent;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}
	
	
	

}
