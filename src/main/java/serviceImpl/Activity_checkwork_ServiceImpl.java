package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_checkwork;
import mapper.Activity_checkwork_Mapper;
import service.Activity_checkwork_Service;


@Service("Activity_checkwork_ServiceImpl")
public class Activity_checkwork_ServiceImpl extends basicServiceImpl<Activity_checkwork> implements Activity_checkwork_Service{
	
@Resource(name="Activity_checkwork_Mapper")
Activity_checkwork_Mapper mapper;

public List<Activity_checkwork> getByactid(Activity_checkwork che) {
	// TODO Auto-generated method stub
	return mapper.getByactid(che);
}

public void fbupdate(Activity_checkwork t) {
mapper.fbupdate(t);	
}

public void allupdate(Activity_checkwork t) {
 mapper.allupdate(t);	
}


}
