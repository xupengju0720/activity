package entity;

import utils.MD5;

public class Activity_user {

	public static String types[] = { "学生", "辅导员", "临时" };
	public static String sexs[] = { "男", "女" };
	public static String statuss[] = { "正常", "禁止", "过期" };
	public static String ylevels[] = { "公务员", "考研", "直接就业", "培训就业" };
	public static String glevels[] = { "A", "B", "C", "D", "E" };
	public static String slevels[] = { "未联系", "已联系", "预报名", "已报名" };

	private int operator_id;
	private int id;
	private int sex;
	private int type;
	private int school_id;
	private int college_id;
	private int ylevel;
	private int glevel;
	private int slevel;
	private int status;
	private String info;
	private String createdate;
	private String niki;
	private String pass="";
	private String name;
	private String qq;
	private String tel;
	private String classinfo;
	private String comments;
	private String sname;
	private String cname;
    
	public Activity_user() {
	}

	public Activity_user(int operator_id, int id, int sex, int type, int school_id, int college_id, int ylevel,
			int glevel, int slevel, int status, String info, String createdate, String niki, String pass, String name,
			String qq, String tel, String classinfo, String comments) {
		super();
		this.operator_id = operator_id;
		this.id = id;
		this.sex = sex;
		this.type = type;
		this.school_id = school_id;
		this.college_id = college_id;
		this.ylevel = ylevel;
		this.glevel = glevel;
		this.slevel = slevel;
		this.status = status;
		this.info = info;
		this.createdate = createdate;
		this.niki = niki;
		this.pass = pass;
		this.name = name;
		this.qq = qq;
		this.tel = tel;
		this.classinfo = classinfo;
		this.comments = comments;
	}

	public String getType_Name() {
		return types[type];
	}

	public String getSex_Name() {
		return sexs[sex];
	}

	public String getStatus_Name() {
		return statuss[status];
	}

	public String getYlevel_Name() {
		if(ylevel==-1) {
			return "";
		}else {
			return ylevels[ylevel];
		}
	}

	public String getSlevel_Name() {
		if(slevel==-1) {
			return "";
		}else {
		return slevels[slevel];
		}
	}

	public String getGlevel_Name() {
		if(glevel==-1) {
			return "";
		}else {
		return glevels[glevel];}
	}

	public int getOperator_id() {
		return operator_id;
	}

	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getSchool_id() {
		return school_id;
	}

	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}

	public int getCollege_id() {
		return college_id;
	}

	public void setCollege_id(int college_id) {
		this.college_id = college_id;
	}

	public int getYlevel() {
		return ylevel;
	}

	public void setYlevel(int ylevel) {
		this.ylevel = ylevel;
	}

	public int getGlevel() {
		return glevel;
	}

	public void setGlevel(int glevel) {
		this.glevel = glevel;
	}

	public int getSlevel() {
		return slevel;
	}

	public void setSlevel(int slevel) {
		this.slevel = slevel;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
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

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getClassinfo() {
		return classinfo;
	}

	public void setClassinfo(String classinfo) {
		this.classinfo = classinfo;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getMd5() {
		return MD5.MD5(pass);
	}

}
