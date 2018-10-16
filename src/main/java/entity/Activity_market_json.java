package entity;

import java.io.Serializable;

public class Activity_market_json implements Serializable {
	private int id;
	private String name;
	private String info;
	
	
	
	public Activity_market_json() {
		super();
	}
	public Activity_market_json(int id, String name, String info) {
		super();
		this.id = id;
		this.name = name;
		this.info = info;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	

}
