package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_market;
import service.Activity_Service;
import service.Activity_market_Service;
import utils.JsonInfo;
import utils.SeachInfo;

@Controller
@RequestMapping("Activity_market")
public class Activity_market_Controller extends basicController<Activity_market>{
	
@Resource(name="Activity_market_ServiceImpl")
Activity_market_Service service;
@Resource(name="Activity_ServiceImpl")
Activity_Service servicea;

@RequestMapping("delete")
public @ResponseBody JsonInfo delete(int id){
	service.delete(id);
	return new JsonInfo(1,0);
}
@Override
public void index(SeachInfo where, ModelMap m, HttpServletRequest req) {
  String id =  req.getParameter("value");
  if(id==null) {
	  m.put("number",1);
  }else {
	  m.put("number",Integer.valueOf(id));
  }
  m.put("alist",servicea.getidname());
	super.index(where, m, req);
}
}
