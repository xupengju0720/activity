package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_college;
import entity.Activity_operator;
import entity.Activity_school;
import entity.Activity_user;
import service.Activity_Service;
import service.Activity_college_Service;
import service.Activity_operator_Service;
import service.Activity_school_Service;
import service.Activity_user_Service;
import utils.JsonInfo;
import utils.SeachInfo;
import utils.serialnumber;

@Controller
@RequestMapping("Activity_user")
public class Activity_user_Controller extends basicController<Activity_user>{
	
@Resource(name="Activity_user_ServiceImpl")
Activity_user_Service service;
@Resource(name="Activity_school_ServiceImpl")
Activity_school_Service services;
@Resource(name="Activity_college_ServiceImpl")
Activity_college_Service servicec;
@Resource(name="Activity_ServiceImpl")
Activity_Service servicea;
@Resource(name="Activity_operator_ServiceImpl")
Activity_operator_Service serviceo;
@RequestMapping("delete")
public @ResponseBody JsonInfo delete(int id){
	service.delete(id);
	return new JsonInfo(1,0);
}
@Override
	public void add(ModelMap m, HttpServletRequest req) {
	   m.put("sexs", Activity_user.sexs);
	   m.put("statuss", Activity_user.statuss);
	   m.put("glevels",Activity_user.glevels);
	   m.put("slevels",Activity_user.slevels);
	   m.put("ylevels",Activity_user.ylevels);
	   m.put("slist", services.getAll());
		super.add(m, req);
	}
@RequestMapping(value="edit2",params="id")
public void getedit2(int id,ModelMap m,HttpServletRequest req) {
	m.put("info", service.getByid(id)) ;
	  m.put("sexs", Activity_user.sexs);
	   m.put("statuss", Activity_user.statuss);
	   m.put("alist",servicea.getAll());
	   m.put("slist", services.getAll());
}

@RequestMapping(value="edit2")
public void  addedit(ModelMap m, HttpServletRequest req) {
	  m.put("sexs", Activity_user.sexs);
	   m.put("statuss", Activity_user.statuss);
	   m.put("alist",servicea.getAll());
	   m.put("slist", services.getAll());
	   
}
@RequestMapping("getcollege")
public @ResponseBody List<Activity_college> getcollege(int id,ModelMap m){
	return service.getcollege(id);
}
@RequestMapping("getschool")
public @ResponseBody List<Activity_school> getschool(){
	return services.getAll();
}
@RequestMapping("getylevel")
public @ResponseBody String[] getylevel(){
	return Activity_user.ylevels ;
}
@RequestMapping("getglevel")
public @ResponseBody String[] getglevel(){
	return Activity_user.glevels ;
}
@RequestMapping("getslevel")
public @ResponseBody String[] getslevel(){
	return Activity_user.slevels ;
}
@RequestMapping("select")
public String select(int text ,ModelMap m,Activity_user aa){
	SeachInfo sea = new SeachInfo();
    int id = text;	
    switch (id) {
	case 0:
		m.put("statuscount",0);
		m.put("school_id", aa.getSchool_id());
		m.put("college_id", aa.getCollege_id());
		  sea.setWhere("where Activity_user.school_id='"+aa.getSchool_id()+"'and Activity_user.college_id='"+aa.getCollege_id()+"'");
		break;
	case 1:
		m.put("statuscount",1);
		m.put("name",aa.getName());
		  sea.setWhere("where Activity_user.name like '%"+aa.getName()+"%'");
		break;
	case 2:
		m.put("statuscount",2);
		m.put("tel", aa.getTel());
		sea.setWhere("where Activity_user.name like '%"+aa.getTel()+"%'");
		break;
	case 3:
		m.put("statuscount",3);
		m.put("ylevel",aa.getYlevel());
		sea.setWhere("where Activity_user.ylevel = '"+aa.getYlevel()+"'");
		break;
	case 4:
		m.put("statuscount",4);
		m.put("glevel", aa.getGlevel());
		sea.setWhere("where Activity_user.glevel = '"+aa.getGlevel()+"'");
		break;
	case 5:
		m.put("statuscount",5);
		m.put("slevel", aa.getSlevel());
		sea.setWhere("where Activity_user.slevel = '"+aa.getSlevel()+"'");
		break;
	default:
		m.put("statuscount",0);
		sea.setWhere("");
		break;
	}
    
	m.put("list",service.selectuser(sea));
	return "Activity_user/index";
}
@Override
	public JsonInfo insert(Activity_user t, ModelMap m, HttpServletRequest req) {
	      Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");
	      t.setOperator_id(opetator.getId());
	      t.setCreatedate(serialnumber.getStringDate());
		return super.insert(t, m, req);
	}
  @Override
	public void get(int id, ModelMap m, HttpServletRequest req) {
	   m.put("sexs", Activity_user.sexs);
	   m.put("statuss", Activity_user.statuss);
	   m.put("glevels",Activity_user.glevels);
	   m.put("slevels",Activity_user.slevels);
	   m.put("ylevels",Activity_user.ylevels);
	   m.put("slist", services.getAll());
		super.get(id, m, req);
	}
  @RequestMapping("operator")
  public @ResponseBody Activity_operator operator(int id) {
	  return serviceo.getByid(id);
  }
  
}
