package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_market;
import mapper.Activity_market_Mapper;
import service.Activity_market_Service;


@Service("Activity_market_ServiceImpl")
public class Activity_market_ServiceImpl extends basicServiceImpl<Activity_market> implements Activity_market_Service{
	
@Resource(name="Activity_market_Mapper")
Activity_market_Mapper mapper;

public Activity_market getByacid(Activity_market t) {
	// TODO Auto-generated method stub
	return mapper.getByacid(t);
}

}
