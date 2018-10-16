package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_operator;
import service.Activity_operator_Service;
import utils.JsonInfo;

@Controller
@RequestMapping("Activity_operator")
public class Activity_operator_Controller extends basicController<Activity_operator>{
	
@Resource(name="Activity_operator_ServiceImpl")
Activity_operator_Service service;

@RequestMapping("delete")
public @ResponseBody JsonInfo delete(int id){
	service.delete(id);
	return new JsonInfo(1,0);
}
@Override
	public void add(ModelMap m, HttpServletRequest req) {
	    m.put("statuss",Activity_operator.statuss);
        m.put("types",Activity_operator.types);
        m.put("powers", Activity_operator.powers);
	super.add(m, req);
	}
@Override
	public void get(int id, ModelMap m, HttpServletRequest req) {
	  m.put("statuss",Activity_operator.statuss);
      m.put("types",Activity_operator.types);
      m.put("powers", Activity_operator.powers);
		super.get(id, m, req);
	}
}
