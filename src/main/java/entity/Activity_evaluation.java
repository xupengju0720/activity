package entity;

import java.io.Serializable;

public class Activity_evaluation implements Serializable{
	public static String statuss[] = {"Î´²â","ÒÑ²â"};
	
	private int id;
	private int activity_id;
	private int user_id;
	private int point;
	private int status;
	private String comments;
	private String aname;
	private String uname;
	
	
	public String getStatus_Name(){
		return statuss[status];
	}
	
	
	
	public Activity_evaluation() {
		super();
	}
	
	
	public Activity_evaluation(int id, int activity_id, int user_id, int point, int status, String comments,
			String aname, String uname) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.user_id = user_id;
		this.point = point;
		this.status = status;
		this.comments = comments;
		this.aname = aname;
		this.uname = uname;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	
}
