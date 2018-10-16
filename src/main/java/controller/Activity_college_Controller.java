package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_college;
import service.Activity_college_Service;
import service.Activity_school_Service;
import utils.JsonInfo;
import utils.SeachInfo;

@Controller
@RequestMapping("Activity_college")
public class Activity_college_Controller extends basicController<Activity_college>{
	
@Resource(name="Activity_college_ServiceImpl")
Activity_college_Service service;
@Resource(name="Activity_school_ServiceImpl")
Activity_school_Service sservice;
@RequestMapping("delete")
public @ResponseBody JsonInfo delete(int id){
	service.delete(id);
	return new JsonInfo(1,0);
}
@RequestMapping("selectcollege")
public String selectcollege(int school,ModelMap m) {
	m.put("slist",sservice.getAll());
	m.put("mm", school);
	m.put("list",service.selectcollege(school));
	return "Activity_college/index";
}

@Override
	public void add(ModelMap m, HttpServletRequest req) {
	   m.put("sublist", sservice.getAll());
		super.add(m, req);
	}
@Override
	public void index(SeachInfo where, ModelMap m, HttpServletRequest req) {
	m.put("slist",sservice.getAll());
	String p=req.getParameter("pageno");
	if(p!=null) where.setPageno(Integer.valueOf(p));
	where.setCanpage(true);
	this.where=where;
     m.put("list", service.selectcollege(1));
	m.put("result", this.where);
	}
@Override
	public void get(int id, ModelMap m, HttpServletRequest req) {
	  m.put("sublist",sservice.getAll());
		super.get(id, m, req);
	}
}
