package entity;

import java.io.Serializable;

public class Activity_school implements Serializable{
	
	private int id;
	private String name;
	
	
	public Activity_school(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Activity_school() {
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
