package entity;

public class Activity_checkwork {
	public static String checks[] = {"正常","迟到","早退","请假","未到","未知"};
	private int id;
	private int activity_id;
	private int user_id;
	private int check1;
	private int check2;
	private int check3;
	private int operator_id;
	private String date;
	private String lastdate;
	private String comments="";
	private String aname;
	private String uname;
	private String oname;
	
	
	public String getCheck1_Name() {
		return checks[check1];
	}
	
	public String getCheck2_Name() {
		return checks[check2];
	}
	
	public String getCheck3_Name() {
		return checks[check3];
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
	public Activity_checkwork() {
		
	}
	
	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public Activity_checkwork(int id, int activity_id, int user_id, int check1, int check2, int check3, int operator_id,
			String date, String lastdate, String comments, String aname, String uname, String oname) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.user_id = user_id;
		this.check1 = check1;
		this.check2 = check2;
		this.check3 = check3;
		this.operator_id = operator_id;
		this.date = date;
		this.lastdate = lastdate;
		this.comments = comments;
		this.aname = aname;
		this.uname = uname;
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getCheck1() {
		return check1;
	}
	public void setCheck1(int check1) {
		this.check1 = check1;
	}
	public int getCheck2() {
		return check2;
	}
	public void setCheck2(int check2) {
		this.check2 = check2;
	}
	public int getCheck3() {
		return check3;
	}
	public void setCheck3(int check3) {
		this.check3 = check3;
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
	public String getLastdate() {
		return lastdate;
	}
	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
