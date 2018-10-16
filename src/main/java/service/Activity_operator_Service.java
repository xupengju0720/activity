package service;

import entity.Activity_operator;
import entity.Login;

public interface Activity_operator_Service extends basicService<Activity_operator>{
	public Activity_operator loginquesto(Login ll); 
	public Activity_operator loginquestoo(Login ll); 
	public void updatepass(Activity_operator t);
}