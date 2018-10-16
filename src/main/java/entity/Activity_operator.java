package entity;

import java.io.Serializable;

import utils.MD5;

public class Activity_operator implements Serializable{
	public static String types[]= {"讲师","非讲师"};   
	public static String statuss[]= {"在职","离职"};   
	public static String powers[]= {"管理员","操作员"};   
	
	private int id;
	private String niki;
	private String pass;
	private String name;
	private int type;
	private String tel;
	private int status;
	private int power;
	private String comments;
	
	public String getStatus_Name() {
		return statuss[status];
	}
	public String getType_Name() {
		return types[type];
	}
	public String getPower_Name() {
		return powers[power];
	}
	
	public Activity_operator() {
		super();
	}
	public Activity_operator(int id, String niki, String pass, String name, int type, String tel, int status, int power,
			String comments) {
		super();
		this.id = id;
		this.niki = niki;
		this.pass = pass;
		this.name = name;
		this.type = type;
		this.tel = tel;
		this.status = status;
		this.power = power;
		this.comments = comments;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNiki() {
		return niki;
	}
	public void setNiki(String niki) {
		this.niki = niki;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getMd5() {
		return MD5.MD5(pass);
	}
	
	
}
