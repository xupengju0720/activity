package controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_notice;
import service.Activity_notice_Service;
import utils.JsonInfo;

@Controller
@RequestMapping("Activity_notice")
public class Activity_notice_Controller extends basicController<Activity_notice>{
	
@Resource(name="Activity_notice_ServiceImpl")
Activity_notice_Service service;

@RequestMapping("delete")
public @ResponseBody JsonInfo delete(int id){
	service.delete(id);
	return new JsonInfo(1,0);
}
}
