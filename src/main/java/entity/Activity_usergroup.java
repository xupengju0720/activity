package entity;

import java.io.Serializable;
import java.text.DecimalFormat;

public class Activity_usergroup implements Serializable{
	
	private int id;
	private int activity_id;
	private int operator_id;
	private int point1=0;
	private int point2=0;
	private int point3=0;
	private int point4=0;
	private int point5=0;
	private int point6=0;
	private int point7=0;
	private int point8=0;
	private int point9=0;
	private int point10=0;
	private String name;
	private String path;
	private String ids;
	private String createdate;
	private String project;
	private String comments;
	private String aname;
	private String oname;
	
	public Activity_usergroup() {
		
	}
	
	 public String getScore() {
		 DecimalFormat df=new DecimalFormat("0.00");
         int a = point1+point2+point3+point4+point5+point6+point7+point8+point9+point10;
         int b = 10;
		return df.format((float)a/b); 
	 }
	
	public int getIscount() {
	 if(point1==0&&point2==0&&point3==0&&point4==0&&point5==0&&point6==0&&point7==0&&point8==0&&point9==0&&point10==0) {
		 return 1;
	 }
	  return 0;
	}
	public Activity_usergroup(int id, int activity_id, int operator_id, int point1, int point2, int point3, int point4,
			int point5, int point6, int point7, int point8, int point9, int point10, String name, String path,
			String ids, String createdate, String project, String comments, String aname, String oname) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.operator_id = operator_id;
		this.point1 = point1;
		this.point2 = point2;
		this.point3 = point3;
		this.point4 = point4;
		this.point5 = point5;
		this.point6 = point6;
		this.point7 = point7;
		this.point8 = point8;
		this.point9 = point9;
		this.point10 = point10;
		this.name = name;
		this.path = path;
		this.ids = ids;
		this.createdate = createdate;
		this.project = project;
		this.comments = comments;
		this.aname = aname;
		this.oname = oname;
	}



	public String getAname() {
		return aname;
	}
	
	public void setAname(String aname) {
		this.aname = aname;
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
	public int getOperator_id() {
		return operator_id;
	}

	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}

	public int getPoint1() {
		return point1;
	}
	public void setPoint1(int point1) {
		this.point1 = point1;
	}
	public int getPoint2() {
		return point2;
	}
	public void setPoint2(int point2) {
		this.point2 = point2;
	}
	public int getPoint3() {
		return point3;
	}
	public void setPoint3(int point3) {
		this.point3 = point3;
	}
	public int getPoint4() {
		return point4;
	}
	public void setPoint4(int point4) {
		this.point4 = point4;
	}
	public int getPoint5() {
		return point5;
	}
	public void setPoint5(int point5) {
		this.point5 = point5;
	}
	public int getPoint6() {
		return point6;
	}
	public void setPoint6(int point6) {
		this.point6 = point6;
	}
	public int getPoint7() {
		return point7;
	}
	public void setPoint7(int point7) {
		this.point7 = point7;
	}
	public int getPoint8() {
		return point8;
	}
	public void setPoint8(int point8) {
		this.point8 = point8;
	}
	public int getPoint9() {
		return point9;
	}
	public void setPoint9(int point9) {
		this.point9 = point9;
	}
	public int getPoint10() {
		return point10;
	}
	public void setPoint10(int point10) {
		this.point10 = point10;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
}
