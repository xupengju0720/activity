package service;

import java.util.List;

import entity.Activity_college;
import entity.Activity_user;
import entity.Login;
import utils.Ids;
import utils.SeachInfo;

public interface Activity_user_Service extends basicService<Activity_user>{
	public List<Activity_college> getcollege(int id);
	public List<Activity_user> alluser();
	public List<Activity_user> teamperson(Ids ids); 
	public Activity_user loginquesto(Login ll); 
	public Activity_user loginquestoo(Login ll); 
	public List<Activity_user>  selectuser(SeachInfo sea);
	public List<Activity_user> getIds(Ids ids);
	public int justnow();
	public Activity_user getByinfo(Activity_user uu);
	public void updatepass(Activity_user t);
	}