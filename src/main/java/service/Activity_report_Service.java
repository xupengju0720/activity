package service;

import java.util.List;

import entity.Activity_report;

public interface Activity_report_Service extends basicService<Activity_report>{
	public Activity_report getByactid(Activity_report acr);
}