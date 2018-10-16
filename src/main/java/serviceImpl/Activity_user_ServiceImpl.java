package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_college;
import entity.Activity_user;
import entity.Login;
import mapper.Activity_user_Mapper;
import service.Activity_user_Service;
import utils.Ids;
import utils.SeachInfo;


@Service("Activity_user_ServiceImpl")
public class Activity_user_ServiceImpl extends basicServiceImpl<Activity_user> implements Activity_user_Service{
	
@Resource(name="Activity_user_Mapper")
Activity_user_Mapper mapper;

public List<Activity_college> getcollege(int id) {
	// TODO Auto-generated method stub
	return mapper.getcollege(id);
}
public List<Activity_user> teamperson(Ids ids) {
	// TODO Auto-generated method stub
	return mapper.teamperson(ids);
}
public Activity_user loginquesto(Login ll) {
	// TODO Auto-generated method stub
	return mapper.loginquesto(ll);
}
public Activity_user loginquestoo(Login ll) {
	// TODO Auto-generated method stub
	return mapper.loginquestoo(ll);
}
public List<Activity_user> selectuser(SeachInfo sea) {
	// TODO Auto-generated method stub
	return mapper.selectuser(sea);
}
public List<Activity_user> alluser() {
	return mapper.alluser();
}
public List<Activity_user> getIds(Ids ids) {
	// TODO Auto-generated method stub
	return mapper.getIds(ids);
}
public int justnow() {
	return mapper.justnow();
}
public Activity_user getByinfo(Activity_user uu) {
	// TODO Auto-generated method stub
	return mapper.getByinfo(uu);
}
public void updatepass(Activity_user t) {
 mapper.updatepass(t);	
}
}
