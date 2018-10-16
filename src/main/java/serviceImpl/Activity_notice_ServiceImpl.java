package serviceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_notice;
import mapper.Activity_notice_Mapper;
import service.Activity_notice_Service;


@Service("Activity_notice_ServiceImpl")
public class Activity_notice_ServiceImpl extends basicServiceImpl<Activity_notice> implements Activity_notice_Service{
	
@Resource(name="Activity_notice_Mapper")
Activity_notice_Mapper mapper;

}
