package service;

import java.util.List;

import entity.Activity;
import entity.Activity_evaluation;
import entity.Activity_time;

public interface Activity_Service extends basicService<Activity>{
	public List<Activity_time> datedetail(int id);
	 public void updateactivityids(Activity t);
	 public List<Activity> getidname();
	 
}