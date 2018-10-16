package entity;

import java.io.Serializable;

public class Activity_market implements Serializable {
	private int id;
	private int activity_id;
	private int operator_id;
	private String date;
	private String json;
	private String info;
	private String comments;
	private String aname;
	private String oname;
    
	public Activity_market() {
		super();
	}
	public Activity_market(int id, int activity_id, int operator_id, String date, String json, String info,
			String comments, String aname, String oname) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.operator_id = operator_id;
		this.date = date;
		this.json = json;
		this.info = info;
		this.comments = comments;
		this.aname = aname;
		this.oname = oname;
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

	public int getOperator_id() {
		return operator_id;
	}

	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
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


	public String getOname() {
		return oname;
	}


	public void setOname(String oname) {
		this.oname = oname;
	}



}
