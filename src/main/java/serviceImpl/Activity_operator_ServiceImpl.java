package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_operator;
import entity.Login;
import mapper.Activity_operator_Mapper;
import service.Activity_operator_Service;


@Service("Activity_operator_ServiceImpl")
public class Activity_operator_ServiceImpl extends basicServiceImpl<Activity_operator> implements Activity_operator_Service{
	
@Resource(name="Activity_operator_Mapper")
Activity_operator_Mapper mapper;

public Activity_operator loginquesto(Login ll) {
	// TODO Auto-generated method stub
	return mapper.loginquesto(ll);
}

public Activity_operator loginquestoo(Login ll) {
	// TODO Auto-generated method stub
	return mapper.loginquestoo(ll);
}

public void updatepass(Activity_operator t) {
mapper.updatepass(t);	
}
}
