package entity;

import java.io.Serializable;

public class Activity_feedback implements Serializable{
	public static String [] statuss = {"¿É¼û","Òþ²Ø"};
	private int id;
	private int activity_id;
	private int user_id;
	private int status=0;
	private String result="";
	private int opt1;
	private int opt2;
	private int opt3;
	private int opt4;
	private int opt5;
	private int opt6;
	private int opt7;
	private int opt8;
	private int opt9;
	private int opt10;
	private String text1="";
	private String text2="";
	private String text3="";
	private String text4="";
	private String text5="";
	private String text6="";
	private String text7="";
	private String text8="";
	private String text9="";
	private String text10="";
	private String aname;
	private String uname;
	
	public  String[] getOptions_select(){
		String [] aa = {"A","B","C"};
		return aa;
	}
	
	public String getStatus_Name() {
		return statuss[status];	
		}
	public Activity_feedback() {
		super();
	}
	public Activity_feedback(int id, int activity_id, int user_id, int status, String result, int opt1, int opt2,
			int opt3, int opt4, int opt5, int opt6, int opt7, int opt8, int opt9, int opt10, String text1, String text2,
			String text3, String text4, String text5, String text6, String text7, String text8, String text9,
			String text10, String aname, String uname) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.user_id = user_id;
		this.status = status;
		this.result = result;
		this.opt1 = opt1;
		this.opt2 = opt2;
		this.opt3 = opt3;
		this.opt4 = opt4;
		this.opt5 = opt5;
		this.opt6 = opt6;
		this.opt7 = opt7;
		this.opt8 = opt8;
		this.opt9 = opt9;
		this.opt10 = opt10;
		this.text1 = text1;
		this.text2 = text2;
		this.text3 = text3;
		this.text4 = text4;
		this.text5 = text5;
		this.text6 = text6;
		this.text7 = text7;
		this.text8 = text8;
		this.text9 = text9;
		this.text10 = text10;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getOpt1() {
		return opt1;
	}
	public void setOpt1(int opt1) {
		this.opt1 = opt1;
	}
	public int getOpt2() {
		return opt2;
	}
	public void setOpt2(int opt2) {
		this.opt2 = opt2;
	}
	public int getOpt3() {
		return opt3;
	}
	public void setOpt3(int opt3) {
		this.opt3 = opt3;
	}
	public int getOpt4() {
		return opt4;
	}
	public void setOpt4(int opt4) {
		this.opt4 = opt4;
	}
	public int getOpt5() {
		return opt5;
	}
	public void setOpt5(int opt5) {
		this.opt5 = opt5;
	}
	public int getOpt6() {
		return opt6;
	}
	public void setOpt6(int opt6) {
		this.opt6 = opt6;
	}
	public int getOpt7() {
		return opt7;
	}
	public void setOpt7(int opt7) {
		this.opt7 = opt7;
	}
	public int getOpt8() {
		return opt8;
	}
	public void setOpt8(int opt8) {
		this.opt8 = opt8;
	}
	public int getOpt9() {
		return opt9;
	}
	public void setOpt9(int opt9) {
		this.opt9 = opt9;
	}
	public int getOpt10() {
		return opt10;
	}
	public void setOpt10(int opt10) {
		this.opt10 = opt10;
	}
	public String getText1() {
		return text1;
	}
	public void setText1(String text1) {
		this.text1 = text1;
	}
	public String getText2() {
		return text2;
	}
	public void setText2(String text2) {
		this.text2 = text2;
	}
	public String getText3() {
		return text3;
	}
	public void setText3(String text3) {
		this.text3 = text3;
	}
	public String getText4() {
		return text4;
	}
	public void setText4(String text4) {
		this.text4 = text4;
	}
	public String getText5() {
		return text5;
	}
	public void setText5(String text5) {
		this.text5 = text5;
	}
	public String getText6() {
		return text6;
	}
	public void setText6(String text6) {
		this.text6 = text6;
	}
	public String getText7() {
		return text7;
	}
	public void setText7(String text7) {
		this.text7 = text7;
	}
	public String getText8() {
		return text8;
	}
	public void setText8(String text8) {
		this.text8 = text8;
	}
	public String getText9() {
		return text9;
	}
	public void setText9(String text9) {
		this.text9 = text9;
	}
	public String getText10() {
		return text10;
	}
	public void setText10(String text10) {
		this.text10 = text10;
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
