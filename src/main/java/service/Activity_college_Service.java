package service;

import java.util.List;

import entity.Activity_college;

public interface Activity_college_Service extends basicService<Activity_college>{
	public List<Activity_college> selectcollege(int id);
}