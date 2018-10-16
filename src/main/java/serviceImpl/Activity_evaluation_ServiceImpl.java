package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity;
import entity.Activity_evaluation;
import mapper.Activity_evaluation_Mapper;
import service.Activity_evaluation_Service;
import utils.Ids;


@Service("Activity_evaluation_ServiceImpl")
public class Activity_evaluation_ServiceImpl extends basicServiceImpl<Activity_evaluation> implements Activity_evaluation_Service{
	
@Resource(name="Activity_evaluation_Mapper")
Activity_evaluation_Mapper mapper;

public List<Activity_evaluation> getIds(Activity acc) {
	// TODO Auto-generated method stub
	return mapper.getIds(acc);
}

public List<Activity_evaluation> getAllactid(int id) {
	// TODO Auto-generated method stub
	return mapper.getAllactid(id);
}



}
