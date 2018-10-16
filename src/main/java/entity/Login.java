package entity;

import utils.MD5;

public class Login {
private int id;	
private String niki;
private String pass;
private String recomend;


public Login() {
	super();
}
public Login(int id, String niki, String pass, String recomend) {
	super();
	this.id = id;
	this.niki = niki;
	this.pass = pass;
	this.recomend = recomend;
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
public String getRecomend() {
	return recomend;
}
public void setRecomend(String recomend) {
	this.recomend = recomend;
}

public String getMd5() {
	return MD5.MD5(pass);
}

}
