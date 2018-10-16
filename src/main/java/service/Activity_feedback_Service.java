package service;

import java.util.List;

import entity.Activity_feedback;

public interface Activity_feedback_Service extends basicService<Activity_feedback>{
	public List<Activity_feedback> getByactid(int id);
	public void resultupdate(Activity_feedback t);
	public void statusupdate(Activity_feedback t);
}