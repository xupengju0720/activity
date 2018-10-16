package service;

import entity.Activity_summary;

public interface Activity_summary_Service extends basicService<Activity_summary>{
	public Activity_summary getByiddate(Activity_summary as);
}