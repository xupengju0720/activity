package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_summary;
import mapper.Activity_summary_Mapper;
import service.Activity_summary_Service;


@Service("Activity_summary_ServiceImpl")
public class Activity_summary_ServiceImpl extends basicServiceImpl<Activity_summary> implements Activity_summary_Service{
	
@Resource(name="Activity_summary_Mapper")
Activity_summary_Mapper mapper;

public Activity_summary getByiddate(Activity_summary as) {
	// TODO Auto-generated method stub
	return mapper.getByiddate(as);
}

}
