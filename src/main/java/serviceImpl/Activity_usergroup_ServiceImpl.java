package serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity;
import entity.Activity_usergroup;
import mapper.Activity_usergroup_Mapper;
import service.Activity_usergroup_Service;


@Service("Activity_usergroup_ServiceImpl")
public class Activity_usergroup_ServiceImpl extends basicServiceImpl<Activity_usergroup> implements Activity_usergroup_Service{
	
@Resource(name="Activity_usergroup_Mapper")
Activity_usergroup_Mapper mapper;

public ArrayList<String> getAllids(int id) {
	// TODO Auto-generated method stub
	return mapper.getAllids(id);
}

public void removeidsid(Activity_usergroup t) {
       mapper.removeidsid(t);	
}

public int updatecount(Activity_usergroup t) {
	// TODO Auto-generated method stub
	return mapper.updatecount(t);
}

}
