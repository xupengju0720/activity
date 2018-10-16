package entity;

import java.io.Serializable;

public class Activity_summary implements Serializable{
	
	private int id;
	private int activity_id;
	private int operator_id;
	private String createdate;
	private String options;
	private String summary;
	private String proposal;
	private String sstatus;
	private String tstatus;
	private String cstatus;
	private String xstatus;
	private String aname;
	private String oname;
	
	
	public  int[] getOptions_Number(){
		String[] a = options.split(",");
		int[] aa=new int[a.length];
		for (int i = 0; i < a.length; i++) {
			 aa[i]= Integer.valueOf(a[i]);
		}
		return aa;
	}
	
	public  String[] getOptions_select(){
		String [] aa = {"A","B","C"};
		return aa;
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
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getProposal() {
		return proposal;
	}
	public void setProposal(String proposal) {
		this.proposal = proposal;
	}
	public String getSstatus() {
		return sstatus;
	}
	public void setSstatus(String sstatus) {
		this.sstatus = sstatus;
	}
	public String getTstatus() {
		return tstatus;
	}
	public void setTstatus(String tstatus) {
		this.tstatus = tstatus;
	}
	public String getCstatus() {
		return cstatus;
	}
	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}
	public String getXstatus() {
		return xstatus;
	}
	public void setXstatus(String xstatus) {
		this.xstatus = xstatus;
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
	public Activity_summary(int id, int activity_id, int operator_id, String createdate, String options, String summary,
			String proposal, String sstatus, String tstatus, String cstatus, String xstatus) {
		super();
		this.id = id;
		this.activity_id = activity_id;
		this.operator_id = operator_id;
		this.createdate = createdate;
		this.options = options;
		this.summary = summary;
		this.proposal = proposal;
		this.sstatus = sstatus;
		this.tstatus = tstatus;
		this.cstatus = cstatus;
		this.xstatus = xstatus;
	}
	public Activity_summary() {
		super();
	}
}
