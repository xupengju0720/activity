package controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity;
import entity.Activity_evaluation;
import entity.Activity_operator;
import entity.Activity_summary;
import entity.Activity_user;
import service.Activity_Service;
import service.Activity_college_Service;
import service.Activity_evaluation_Service;
import service.Activity_school_Service;
import service.Activity_summary_Service;
import service.Activity_user_Service;
import utils.Ids;
import utils.JsonInfo;
import utils.SeachInfo;
import utils.serialnumber;

@Controller
@RequestMapping("Activity")
public class Activity_Controller extends basicController<Activity>{
	
@Resource(name="Activity_ServiceImpl")
Activity_Service service;
@Resource(name="Activity_school_ServiceImpl")
Activity_school_Service services;
@Resource(name="Activity_user_ServiceImpl")
Activity_user_Service serviceu;
@Resource(name="Activity_summary_ServiceImpl")
Activity_summary_Service servicem;
@Resource(name="Activity_evaluation_ServiceImpl")
Activity_evaluation_Service servicee;

@RequestMapping("delete")
public @ResponseBody JsonInfo delete(int id){
	service.delete(id);
	return new JsonInfo(1,0);
}
@Override
	public void add(ModelMap m, HttpServletRequest req) {
	m.put("statuss",Activity.statuss);
	m.put("types",Activity.types);
	m.put("optionss",Activity.optionss);
	m.put("ulist",serviceu.alluser());
		super.add(m, req);
	}
@Override
	public JsonInfo insert(Activity t, ModelMap m, HttpServletRequest req) {
	  Activity_operator operator= (Activity_operator) req.getSession().getAttribute("sdetail");
	  t.setOperator_id(operator.getId());
	  t.setCreatedate(serialnumber.getStringDate());
	  
		return super.insert(t, m, req);
	}
@Override
	public void get(int id, ModelMap m, HttpServletRequest req) {
	m.put("statuss",Activity.statuss);
	m.put("types",Activity.types);
	m.put("optionss",Activity.optionss);
		super.get(id, m, req);
	}
@RequestMapping("datedetail")//显示时间详情
public String datedetail(int id, ModelMap m) {
    m.put("list",service.datedetail(id));	
	return "Activity/edit4";
}
  @Override
	public void index(SeachInfo where, ModelMap m, HttpServletRequest req) {
	  m.put("tlist", Activity.types);
		super.index(where, m, req);
	}

  @RequestMapping("persondetail")//edit2页罗列活动人员
public String  persondetail(int id,ModelMap m,HttpServletRequest req) {
	  req.getSession().removeAttribute("activityname");
	  String idss = service.getByid(id).getIds();
	  if(idss.length()==0) {
		  return "Activity/edit2";
	  }else {
		  Ids ids = new Ids();
		  ids.setIds(idss);
		  m.put("ulist",serviceu.getIds(ids));
		  req.getSession().setAttribute("activityname",service.getByid(id));//把当前活动放入session
	  }
    return "Activity/edit2";	  
  }
  @RequestMapping("personadd")//活动新增人员页面
  public String  personadd(ModelMap m,int activity_id) {
	   m.put("sexs", Activity_user.sexs);
	   m.put("statuss", Activity_user.statuss);
	   m.put("glevels",Activity_user.glevels);
	   m.put("slevels",Activity_user.slevels);
	   m.put("ylevels",Activity_user.ylevels);
	   m.put("slist", services.getAll());
	   return "Activity/edit22";
}
  @RequestMapping("personinsert")//活动新增人员
  public @ResponseBody JsonInfo personinsert(Activity_user t,ModelMap m, HttpServletRequest req) {
	      Activity act= (Activity) req.getSession().getAttribute("activityname");
	      int activity_id=act.getId();//获取活动id
	      
	      Activity_user uu =  new Activity_user();
	      String niki = t.getNiki();
	      String tel = t.getTel();
	      String name = t.getName();
	      uu.setNiki(niki);
	      uu.setTel(tel);
	      uu.setName(name);
	      Activity_user bb = serviceu.getByinfo(uu);
	      Activity pp = new Activity();
	      String idss = service.getByid(activity_id).getIds();
	      if(bb==null) {  //判读新增的是否已经存在
	    	  Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");
	   	      t.setOperator_id(opetator.getId());
	   	      t.setType(0);
	   	      t.setCreatedate(serialnumber.getStringDate());
	   	      serviceu.insert(t);  //user新增
		      String id =String.valueOf(serviceu.justnow());
		      if(idss.length()==0) {
		    	  pp.setIds(id);
		      }else {
		    	  pp.setIds(idss+","+id);
		      }
	      }else {
	    	  String id =String .valueOf(bb.getId());
		      if(idss.length()==0) {
		    	  pp.setIds(id);
		      }else {
		    	  pp.setIds(idss+","+id);
		      }
	      }
	      pp.setId(activity_id);
	      service.updateactivityids(pp);//活动修改人员
		return new JsonInfo(1,"");
  }
  @RequestMapping("removeuser")//移除人员
  public @ResponseBody JsonInfo removeuser(int id,HttpServletRequest req) {
	   Activity act= (Activity) req.getSession().getAttribute("activityname");
	   int activity_id=act.getId();//获取活动id  变为String
	   Activity activity= service.getByid(activity_id);
	   String ids = activity.getIds();
	   String id1 = String.valueOf(id);
	   String  idd = "";
	   int count  = ids.indexOf(id1);
	   if(count==0) {
		   idd = ids.substring(id1.length()+1,ids.length());
	   }
	   if(count==ids.length()-id1.length()+1) {
		   idd = ids.substring(0,ids.length()-id1.length()-1);
	   }
	   if(count>0&&count<ids.length()-id1.length()+1) {
		   idd = ids.substring(0,count-1)+ids.substring(count+id1.length(),ids.length()); 
	   }
	   act.setIds(idd);
	   service.updateactivityids(act);
	  return new JsonInfo(1,"");
  }
  @RequestMapping("sheshidetail")//显示设施
  public String  sheshidetail(int id,ModelMap m,HttpServletRequest req) {
	  m.put("sslist",service.getByid(id));
	  m.put("sheshi",Activity.optionss);
	  return "Activity/edit3";
  }
  @RequestMapping("activityzongjie") //判断是否有总结 有显示  没有添加
  public String  activityzongjie(int id,ModelMap m,HttpServletRequest req) {
	  req.getSession().removeAttribute("activity");
	  req.getSession().setAttribute("activity",service.getByid(id));
	  Activity_summary as = new Activity_summary();
	  String date=serialnumber.getStringDatehh();
	  as.setActivity_id(id);
	  as.setCreatedate(date);
	  Activity_summary now = servicem.getByiddate(as);
	  if(now==null) {
		  return "Activity/edit52";
	  }else {
		 m.put("amlist",now); 
	  }
	  
	  return "Activity/edit5";
  }
  @RequestMapping(value="insertsummary",  params="insert") //新增总结
  public @ResponseBody JsonInfo  insertsummary(Activity_summary asm,ModelMap m,HttpServletRequest req) {
	  Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");
	  Activity act = (Activity) req.getSession().getAttribute("activity");  
	  int activity_id = act.getId();
	  asm.setOperator_id(opetator.getId());
	  asm.setActivity_id(activity_id);
	  asm.setCreatedate(serialnumber.getStringDatehh());
	  servicem.insert(asm);
	  return new JsonInfo(1,"");
  }
  @RequestMapping("zongjiexiugai")//修改总结之前获取总结
  public String  zongjiexiugai(int id,String date,ModelMap m,HttpServletRequest req) {
	  Activity_summary asm = new Activity_summary();
	  asm.setActivity_id(id);
	  asm.setCreatedate(date);
	  m.put("info",servicem.getByiddate(asm));
	return  "Activity/edit52";
  }
  @RequestMapping(value="updatesummary",  params="update") //修改总结
  public @ResponseBody JsonInfo updatesummary(Activity_summary asm,ModelMap m,HttpServletRequest req) {
	  Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");
	  asm.setOperator_id(opetator.getId());
	  servicem.update(asm);
	  return new JsonInfo(1,"");
  }
  @RequestMapping("evaluation") //测评显示
  public String evaluation(int id,ModelMap m) {
	  Activity act = service.getByid(id);//获取活动所有人员
	  List<Activity_evaluation> ace = servicee.getAllactid(id);//获取对应活动的已存在的所有人员
	  if(ace.size()==0) {
		  Activity_evaluation acte = new Activity_evaluation();
		  String[] ids3 = act.getIds().split(",");
		  int iid [] = new int[ids3.length]; 
	      for (int i = 0; i < ids3.length; i++) {
		        iid[i]=Integer.valueOf(ids3[i]);
		   }
			for (int i = 0; i < iid.length; i++) {
				acte.setUser_id(iid[i]);
				acte.setActivity_id(id);
				acte.setComments("");
				acte.setPoint(0);
				acte.setStatus(0);
				servicee.insert(acte);
		}
	  }
		  m.put("activity",act);
		  m.put("list",servicee.getIds(act)); 
	  return "Activity/edit6";
  }
  @RequestMapping("countall")//批量修改获取
  public String  countall(Activity act,ModelMap m) {
	 m.put("list",servicee.getIds(act));
	return "Activity/edit62";
  }
  @RequestMapping("countallupdate")//批量修改测评
  public @ResponseBody JsonInfo countallupdate(String ids,String comments,int point) {
	  Activity_evaluation ace = new Activity_evaluation();
	  String[] a1 = ids.split(",");
	  for(int i = 0;i<a1.length;i++) {
		  ace.setStatus(1);
		  ace.setId(Integer.valueOf(a1[i]));
		  ace.setComments(comments);
		  ace.setPoint(point);
		  servicee.update(ace);
	  }
	   
     return	new JsonInfo(1,""); 
  }
  @RequestMapping("countone")//打分查询
  public String  countone(int id,ModelMap m) {
	  m.put("info",servicee.getByid(id));
	return "Activity/edit62";
  }
  @RequestMapping("countoneupdate")//打分xiugai
  public @ResponseBody JsonInfo  countoneupdate(Activity_evaluation ace ,ModelMap m) {
	  ace.setStatus(1);
	  servicee.update(ace);
	return new JsonInfo(1,"");
  }
  private String remmove(String str1, String str2) {  //字符串str1移除str2
	   String str = "";
	   ArrayList<String> a = changelist(str1);
	   ArrayList<String> b = changelist(str2);
	   a.removeAll(b);
	   String bb= a.toString().replaceAll(" ","");
	    str=bb.substring(1,bb.toString().length()-1);
	   return str;
}
private ArrayList<String> changelist(String str) {  //字符串转集合
	ArrayList<String> aa = new ArrayList<String>();
	  String [] sst = str.split(",");
	  for (int i = 0; i < sst.length; i++) {
		aa.add(sst[i]);
	}
	return aa;
}
}
