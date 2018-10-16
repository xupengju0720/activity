package controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_checkwork;
import entity.Activity_feedback;
import entity.Activity_market;
import entity.Activity_market_json;
import entity.Activity_operator;
import entity.Activity_report;
import entity.Activity_time;
import entity.Activity_user;
import service.Activity_Service;
import service.Activity_checkwork_Service;
import service.Activity_feedback_Service;
import service.Activity_market_Service;
import service.Activity_operator_Service;
import service.Activity_report_Service;
import service.Activity_time_Service;
import service.Activity_user_Service;
import utils.Ids;
import utils.JsonInfo;
import utils.JsonUtil;
import utils.SeachInfo;
import utils.serialnumber;

@Controller
@RequestMapping("Activity_time")
public class Activity_time_Controller extends basicController<Activity_time>{
	
@Resource(name="Activity_time_ServiceImpl")
Activity_time_Service service;
@Resource(name="Activity_ServiceImpl")
Activity_Service servicea;
@Resource(name="Activity_operator_ServiceImpl")
Activity_operator_Service serviceo;
@Resource(name="Activity_feedback_ServiceImpl")
Activity_feedback_Service serviceb;
@Resource(name="Activity_checkwork_ServiceImpl")
Activity_checkwork_Service servicec;
@Resource(name="Activity_user_ServiceImpl")
Activity_user_Service serviceu;
@Resource(name="Activity_market_ServiceImpl")
Activity_market_Service servicem;
@Resource(name="Activity_report_ServiceImpl")
Activity_report_Service servicer;

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
   
@RequestMapping("addatime")
public String addatime(int id,ModelMap m) {
	m.put("activity_id",id);
	 m.put("statuss", Activity_time.statuss);
	return "Activity_time/edit";
}

@Override
	public JsonInfo insert(Activity_time t, ModelMap m, HttpServletRequest req) {
	  Activity_operator operator= (Activity_operator) req.getSession().getAttribute("sdetail");
	  t.setOperator_id(operator.getId());
		return super.insert(t, m, req);
	}
@Override
	public JsonInfo update(Activity_time t, ModelMap m, HttpServletRequest req) {
	  Activity_operator operator= (Activity_operator) req.getSession().getAttribute("sdetail");
	  t.setOperator_id(operator.getId());
	  return super.update(t, m, req);
	}

@Override
	public void get(int id, ModelMap m, HttpServletRequest req) {
	 m.put("statuss", Activity_time.statuss);
		super.get(id, m, req);
	}
@RequestMapping("feedback")
public String feedback(int id,ModelMap m) {
	m.put("list",serviceb.getByactid(id));
	return "Activity_time/edit2";
}
@RequestMapping("view")
public String view(int id,ModelMap m) {
	m.put("info",serviceb.getByid(id));
	return "Activity_time/edit22";
}
@RequestMapping("result")
public String result(int id,ModelMap m) {
	m.put("info",serviceb.getByid(id));
	return "Activity_time/edit23";
}
@RequestMapping("opupdatefeedbook")//反馈修改
public @ResponseBody JsonInfo opupdatefeedbook(String optk,Activity_feedback acf,ModelMap m) {
	String [] aa =optk.split(",");
	acf.setOpt1(Integer.valueOf(aa[0]));
	acf.setOpt2(Integer.valueOf(aa[1]));
	acf.setOpt3(Integer.valueOf(aa[2]));
	acf.setOpt4(Integer.valueOf(aa[3]));
	acf.setOpt5(Integer.valueOf(aa[4]));
	acf.setOpt6(Integer.valueOf(aa[5]));
	acf.setOpt7(Integer.valueOf(aa[6]));
	acf.setOpt8(Integer.valueOf(aa[7]));
	acf.setOpt9(Integer.valueOf(aa[8]));
	acf.setOpt10(Integer.valueOf(aa[9]));
	serviceb.update(acf);
	return new JsonInfo(1,"") ;
}
@RequestMapping("resultupdate")//反馈回应修改
public @ResponseBody JsonInfo resultupdate(Activity_feedback acf) {
	serviceb.resultupdate(acf);
	return new JsonInfo(1,"") ;
}
@RequestMapping("statusupdate")//反馈切换状态
public @ResponseBody JsonInfo statusupdate(Activity_feedback acf) {
	serviceb.statusupdate(acf);
	return new JsonInfo(1,"") ;
}
@RequestMapping("market")//市场显示
public String  market(int id,ModelMap m) {
	Activity_market actm = new Activity_market();
	actm.setActivity_id(id);
	actm.setDate(serialnumber.getStringDatehh());
	Activity_market ctm = servicem.getByacid(actm);
	if(ctm!=null) {
		m.put("info",ctm);
		String json=ctm.getJson();
		List<Activity_market_json> jsons=JsonUtil.toObjct(json, List.class);
		m.put("jsons", jsons);
		return "Activity_time/edit32";
	}
	m.put("number",id);
	return "Activity_time/edit3";
}
@RequestMapping("marketadd")
public @ResponseBody JsonInfo market(Activity_market acm,HttpServletRequest req) {
	Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");//获取当前登录人员
	acm.setOperator_id(opetator.getId());
	acm.setDate(serialnumber.getStringDatehh());
	servicem.insert(acm);
	return new JsonInfo(1,"");
}
@RequestMapping("marketupdate")
public @ResponseBody JsonInfo marketupdate(Activity_market acm,HttpServletRequest req) {
	Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");//获取当前登录人员
	acm.setOperator_id(opetator.getId());
	acm.setDate(serialnumber.getStringDatehh());
	servicem.update(acm);
	return new JsonInfo(1,"");
}


@RequestMapping("checkwork")//考勤显示当前活动当天    
public String  checkwork(int id,ModelMap m,HttpServletRequest req) {
	 Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");//获取当前登录人员
	  m.put("number",Integer.valueOf(id));
	  m.put("alist",servicea.getidname());  //所有活动的下拉框  
	  String ids = servicea.getByid(id).getIds();  //获取本活动的所有人
	  Activity_checkwork che = new Activity_checkwork();
	  che.setId(id);
	  che.setDate(serialnumber.getStringDatehh());
	
	List<Activity_checkwork> ache=servicec.getByactid(che);   //获取当天已经考勤的人
	ArrayList<String> sche = new ArrayList<String>();
	for (int i = 0; i < ache.size(); i++) {
		sche.add(String.valueOf(ache.get(i).getUser_id()));
	}
	 String aa = sche.toString().replaceAll(" ","");   
	 String cc = aa.substring(1,aa.length()-1);        //将所有已经考勤的当天的本活动的人的id组成字符串
	 String bb = remmove(ids,cc);                    
	 Ids idd = new Ids();
	 if(bb.length()==0) {
		idd.setIds("'"+"'"); 
	 }else {
      idd.setIds(bb);                                    
	  }                                               
	 List<Activity_user> acu =  serviceu.getIds(idd);   
	 Activity_checkwork acs = new Activity_checkwork();
	 for (int i = 0; i < acu.size(); i++) {
		 acs.setActivity_id(id);
		 acs.setUser_id(acu.get(i).getId());
		 acs.setCheck1(5);
		 acs.setCheck2(5);
		 acs.setCheck3(5);
		 acs.setComments("");
		 acs.setDate(serialnumber.getStringDatehh());
		 acs.setLastdate(serialnumber.getStringDatehh());
		 acs.setOperator_id(opetator.getId());
		 servicec.insert(acs);
	 }                                 //新增所有当天未考勤的人
	  m.put("list",servicec.getByactid(che));
	return "Activity_time/edit4";
}

@RequestMapping("uponecheck")//考勤修改显示
public String  uponecheck(int id,ModelMap m){
	 m.put("info",servicec.getByid(id));
	 m.put("checks",Activity_checkwork.checks);
	return "Activity_time/edit42";
}
@RequestMapping("updateone")//考勤单个修改
public @ResponseBody JsonInfo  updateone(Activity_checkwork che,HttpServletRequest req) {
    Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");//获取当前登录人员
    che.setOperator_id(opetator.getId());
	che.setLastdate(serialnumber.getStringDatehh());
	servicec.fbupdate(che);
 return new JsonInfo(1,"");
}
@RequestMapping("updateallview")//批量考勤考勤显示
public String  updateallview(String ids,ModelMap m) {
	m.put("ids", ids);
	m.put("checks",Activity_checkwork.checks);
	return "Activity_time/edit43";
}
@RequestMapping("updateall")//批量修改
public @ResponseBody JsonInfo  updateall(Activity_checkwork che,HttpServletRequest req,String ids) {
	Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail"); 
	Activity_checkwork nche = new  Activity_checkwork();
	String idd[] = ids.split(",");
	for (int i = 0; i < idd.length; i++) {
		  nche.setId(Integer.valueOf(idd[i]));
		  nche.setCheck1(che.getCheck1());
		  nche.setCheck2(che.getCheck2());
		  nche.setCheck3(che.getCheck3());
		  nche.setComments(che.getComments());
		  nche.setLastdate(serialnumber.getStringDatehh());
		  nche.setOperator_id(opetator.getId());
		  servicec.allupdate(nche);
	}
	return new JsonInfo(1,"");
}
@RequestMapping("report")//日报跳转
public String  report(int id,ModelMap m){
	Activity_report acr = new Activity_report();
	acr.setActivity_id(id);
	acr.setDate(serialnumber.getStringDatehh());
	Activity_report ract = servicer.getByactid(acr);
	if(ract!=null) {
		m.put("info",ract);
		String json=ract.getJson();
		List<Activity_market_json> jsons=JsonUtil.toObjct(json, List.class);
		m.put("jsons", jsons);
		return "Activity_time/edit52";
	}
	m.put("number",id);
	return "Activity_time/edit5";
}
@RequestMapping("reportadd")
public @ResponseBody JsonInfo reportadd(Activity_report acr,HttpServletRequest req) {
	Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");//获取当前登录人员
	acr.setOperator_id(opetator.getId());
	acr.setDate(serialnumber.getStringDatehh());
	servicer.insert(acr);
	return new JsonInfo(1,"");
}
@RequestMapping("reportupdate")
public @ResponseBody JsonInfo reportupdate(Activity_report acr,HttpServletRequest req) {
	Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");//获取当前登录人员
	acr.setOperator_id(opetator.getId());
	acr.setDate(serialnumber.getStringDatehh());
	servicer.update(acr);
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
