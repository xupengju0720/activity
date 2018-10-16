package entity;

public class Activity_time {
public static String statuss[] = {"Õý³£","ÔÝ¶¨"};
private  int id;
private  int activity_id;
private  int operator_id;
private  int status;
private String aname;
private String oname;
private String roominfo;
private String date;
private String comments;
private String time1;
private String time2;
private String time3;
private String time4;
private String time5;
private String time6;



public String getStatus_Name() {
	return statuss[status];
}

public Activity_time() {
	super();
}



public Activity_time(int id, int activity_id, int operator_id, int status, String aname, String roominfo, String date,
		String comments, String time1, String time2, String time3, String time4, String time5, String time6) {
	super();
	this.id = id;
	this.activity_id = activity_id;
	this.operator_id = operator_id;
	this.status = status;
	this.aname = aname;
	this.roominfo = roominfo;
	this.date = date;
	this.comments = comments;
	this.time1 = time1;
	this.time2 = time2;
	this.time3 = time3;
	this.time4 = time4;
	this.time5 = time5;
	this.time6 = time6;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getRoominfo() {
	return roominfo;
}
public void setRoominfo(String roominfo) {
	this.roominfo = roominfo;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public String getTime1() {
	return time1;
}
public void setTime1(String time1) {
	this.time1 = time1;
}
public String getTime2() {
	return time2;
}
public void setTime2(String time2) {
	this.time2 = time2;
}
public String getTime3() {
	return time3;
}
public void setTime3(String time3) {
	this.time3 = time3;
}
public String getTime4() {
	return time4;
}
public void setTime4(String time4) {
	this.time4 = time4;
}
public String getTime5() {
	return time5;
}
public void setTime5(String time5) {
	this.time5 = time5;
}
public String getTime6() {
	return time6;
}
public void setTime6(String time6) {
	this.time6 = time6;
}


}
