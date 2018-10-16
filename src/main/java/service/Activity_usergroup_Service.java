package service;

import java.util.ArrayList;
import java.util.List;

import entity.Activity;
import entity.Activity_usergroup;

public interface Activity_usergroup_Service extends basicService<Activity_usergroup>{
	 public  ArrayList<String>  getAllids(int id);
	 public void removeidsid(Activity_usergroup t);
	 public int updatecount(Activity_usergroup t);
}