package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_school;
import mapper.Activity_school_Mapper;
import service.Activity_school_Service;


@Service("Activity_school_ServiceImpl")
public class Activity_school_ServiceImpl extends basicServiceImpl<Activity_school> implements Activity_school_Service{
	
@Resource(name="Activity_school_Mapper")
Activity_school_Mapper mapper;

}
