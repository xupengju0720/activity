package service;

import java.util.List;

import entity.Activity;
import entity.Activity_evaluation;
import utils.Ids;

public interface Activity_evaluation_Service extends basicService<Activity_evaluation>{
	 public List<Activity_evaluation> getIds(Activity acc);
	 public List<Activity_evaluation> getAllactid(int id);
}