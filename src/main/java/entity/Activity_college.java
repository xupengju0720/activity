package entity;

import java.io.Serializable;

public class Activity_college implements Serializable{
	
	private int id;
	private int school_id;
	private String name;
	private String sname;

	public Activity_college() {
		super();
	}
	
	public Activity_college(int id, int school_id, String name, String sname) {
		super();
		this.id = id;
		this.school_id = school_id;
		this.name = name;
		this.sname = sname;
	}

	public String getSname() {
		return sname;
	}
	
	
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSchool_id() {
		return school_id;
	}
	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
