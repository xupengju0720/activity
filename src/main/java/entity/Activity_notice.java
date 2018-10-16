package entity;

import java.io.Serializable;

public class Activity_notice implements Serializable {
	public static String[] statuss = { "¿É¼û", "Òþ²Ø" };
	private int activity_id;
	private int operator_id;
	private int status;
	private String date;
	private String title;
	private String info;
	private String aname;
	private String oname;

	public String getStatus_name() {
		return statuss[status];
	}

	public Activity_notice() {
		super();
	}

	public Activity_notice(int activity_id, int operator_id, int status, String date, String title, String info,
			String aname, String oname) {
		super();
		this.activity_id = activity_id;
		this.operator_id = operator_id;
		this.status = status;
		this.date = date;
		this.title = title;
		this.info = info;
		this.aname = aname;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
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

}
