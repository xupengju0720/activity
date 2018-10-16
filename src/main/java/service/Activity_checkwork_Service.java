package service;

import java.util.List;

import entity.Activity_checkwork;

public interface Activity_checkwork_Service extends basicService<Activity_checkwork>{
	  public List<Activity_checkwork> getByactid(Activity_checkwork che);
	  public void fbupdate(Activity_checkwork t);
	  public void allupdate(Activity_checkwork t);
}