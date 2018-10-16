package entity;

import java.io.Serializable;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class Activity implements Serializable {
	public static String types[] = { "实训", "宣讲", "比赛" };
	public static String statuss[] = { "正常", "取消" };
	public static String optionss[] = { "桌椅", "音响", "灯光", "话筒", "工具1", "工具2", "工具3", "工具4", "工具5" };
	private int id;
	private String school_id;
	private String college_id;
	private int count;
	private String ids ="";
	private int classcount;
	private int operator_id;
	private int charge_operator_id;
	private String instructor_user_id;
	private int source_operator_id;
	private int type;
	private int status;
	private String options;
	private String courseinfo;
	private String planinfo;
	private String date;
	private String name;
	private String attention;
	private String comments;
	private String createdate;

	public  int[] getOptions_Number(){
		String[] a = options.split(",");
		int[] aa=new int[a.length];
		for (int i = 0; i < a.length; i++) {
			 aa[i]= Integer.valueOf(a[i]);
		}
		return aa;
	}
	public  int[] getOptions_Numbers(){
		String[] a = options.split(",");
	    ArrayList<Integer> aa = new ArrayList<Integer>();
	     for (int i = 0; i < 8; i++) {
			aa.add(i);
		}
		for (int i = 0; i < a.length; i++) {
			 aa.remove(Integer.valueOf(a[i]));
		}
		int[] bb=new int[aa.size()];
		for (int i = 0; i < aa.size(); i++) {
			bb[i]=aa.get(i);
		}
		return bb;
	}
	public String getOptions_Name() {
		ArrayList<String> aa = new ArrayList<String>();
		String[] a = options.split(",");
		for (int i = 0; i < a.length; i++) {
			aa.add(optionss[Integer.valueOf(a[i])]);
		}
		return aa.toString().substring(1, aa.toString().length() - 1);
	}
	

	public String getIds() {
		
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getSchool_id() {
		return school_id;
	}

	public void setSchool_id(String school_id) {
		this.school_id = school_id;
	}

	public String getCollege_id() {
		return college_id;
	}

	public void setCollege_id(String college_id) {
		this.college_id = college_id;
	}

	public String getType_Name() {
		return types[type];
	}

	public int getOperator_id() {
		return operator_id;
	}

	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getStatus_Name() {
		return statuss[status];
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getClasscount() {
		return classcount;
	}

	public void setClasscount(int classcount) {
		this.classcount = classcount;
	}
	

	public int getCharge_operator_id() {
		return charge_operator_id;
	}

	public void setCharge_operator_id(int charge_operator_id) {
		this.charge_operator_id = charge_operator_id;
	}
	public String getInstructor_user_id() {
		return instructor_user_id;
	}

	public void setInstructor_user_id(String instructor_user_id) {
		this.instructor_user_id = instructor_user_id;
	}

	public int getSource_operator_id() {
		return source_operator_id;
	}

	public void setSource_operator_id(int source_operator_id) {
		this.source_operator_id = source_operator_id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCourseinfo() {
		return courseinfo;
	}

	public void setCourseinfo(String courseinfo) {
		this.courseinfo = courseinfo;
	}

	public String getPlaninfo() {
		return planinfo;
	}

	public void setPlaninfo(String planinfo) {
		this.planinfo = planinfo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAttention() {
		return attention;
	}

	public void setAttention(String attention) {
		this.attention = attention;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

}
