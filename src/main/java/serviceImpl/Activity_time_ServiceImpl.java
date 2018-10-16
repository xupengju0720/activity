package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity;
import entity.Activity_time;
import mapper.Activity_time_Mapper;
import service.Activity_time_Service;


@Service("Activity_time_ServiceImpl")
public class Activity_time_ServiceImpl extends basicServiceImpl<Activity_time> implements Activity_time_Service{
	
@Resource(name="Activity_time_Mapper")
Activity_time_Mapper mapper;
}
