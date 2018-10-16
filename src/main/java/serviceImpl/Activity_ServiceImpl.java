package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity;
import entity.Activity_evaluation;
import entity.Activity_time;
import mapper.Activity_Mapper;
import service.Activity_Service;


@Service("Activity_ServiceImpl")
public class Activity_ServiceImpl extends basicServiceImpl<Activity> implements Activity_Service{
@Resource(name="Activity_Mapper")
Activity_Mapper mapper;
public List<Activity_time> datedetail(int id) {
	return mapper.datedetail(id);
}
public void updateactivityids(Activity t) {
   mapper.updateactivityids(t);	
}
public List<Activity> getidname() {
	return mapper.getidname();
}
}
