package serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import entity.Activity_report;
import mapper.Activity_report_Mapper;
import service.Activity_report_Service;


@Service("Activity_report_ServiceImpl")
public class Activity_report_ServiceImpl extends basicServiceImpl<Activity_report> implements Activity_report_Service{
	
@Resource(name="Activity_report_Mapper")
Activity_report_Mapper mapper;

public Activity_report getByactid(Activity_report acr) {
	// TODO Auto-generated method stub
	return mapper.getByactid(acr);
}

}
