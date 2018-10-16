package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_feedback;
import mapper.Activity_feedback_Mapper;
import service.Activity_feedback_Service;


@Service("Activity_feedback_ServiceImpl")
public class Activity_feedback_ServiceImpl extends basicServiceImpl<Activity_feedback> implements Activity_feedback_Service{
	
@Resource(name="Activity_feedback_Mapper")
Activity_feedback_Mapper mapper;

public List<Activity_feedback> getByactid(int id) {
	// TODO Auto-generated method stub
	return mapper.getByactid(id);
}

public void resultupdate(Activity_feedback t) {
   mapper.resultupdate(t);
}

public void statusupdate(Activity_feedback t) {
mapper.statusupdate(t);	
}



}
