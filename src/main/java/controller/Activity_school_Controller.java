package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_school;
import service.Activity_school_Service;
import utils.JsonInfo;

@Controller
@RequestMapping("Activity_school")
public class Activity_school_Controller extends basicController<Activity_school>{
	
@Resource(name="Activity_school_ServiceImpl")
Activity_school_Service service;

@RequestMapping("delete")
public @ResponseBody JsonInfo delete(int id){
	service.delete(id);
	return new JsonInfo(1,0);
}
}
