package controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity;
import entity.Activity_operator;
import entity.Activity_usergroup;
import service.Activity_Service;
import service.Activity_user_Service;
import service.Activity_usergroup_Service;
import utils.Ids;
import utils.JsonInfo;
import utils.SeachInfo;
import utils.serialnumber;

@Controller
@RequestMapping("Activity_usergroup")
public class Activity_usergroup_Controller extends basicController<Activity_usergroup>{
	
@Resource(name="Activity_usergroup_ServiceImpl")
Activity_usergroup_Service service;
@Resource(name="Activity_ServiceImpl")
Activity_Service servicea;
@Resource(name="Activity_user_ServiceImpl")
Activity_user_Service serviceu;

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
@RequestMapping("addgroup")
public String addgroup(ModelMap m,int id){//group����  ��Ա��ʾ
	 m.put("activity_id",id);
	 Activity act=servicea.getByid(id);
	 
     ArrayList<String> pp = service.getAllids(id);  //�����ַ������Ƴ�
     String aa = pp.toString().replaceAll(" ","");
     String cc = aa.substring(1,aa.length()-1);
     String kk =act.getIds();
     String bb = remmove(kk,cc);
     Ids ids = new Ids();
     ids.setIds(bb);
     
     m.put("ulist",serviceu.getIds(ids));  //��ȡδ����Ļ��Ա
	return "Activity_usergroup/edit";
}
    @RequestMapping("openedit")
	public String openedit(int id,int activity_id,ModelMap m) {//�޸�group  ��Ա��ʾ
	  Activity_usergroup acu = service.getByid(id);//������Ա����ModelMap
	  Ids ids = new Ids();
	  ids.setIds(acu.getIds());
	  m.put("bulist",serviceu.getIds(ids));  
	  
	    Activity act=servicea.getByid(activity_id);  //��ȡδ�����user
	     ArrayList<String> pp = service.getAllids(activity_id);  //�����ַ������Ƴ�
	     String aa = pp.toString().replaceAll(" ","");
	     String cc = aa.substring(1,aa.length()-1);
	     String kk =act.getIds();
	     String bb = remmove(kk,cc);
	     Ids idd = new Ids();
	     idd.setIds(bb);
	     
	     m.put("ulist",serviceu.getIds(idd)); //δ������˷���ModelMap
	     m.put("info", service.getByid(id));  //�����������Ϣ����ModelMap
	return "Activity_usergroup/edit";
	}
@RequestMapping("persondetail")
public String persondetail(int id,ModelMap m) {
	
	 Activity_usergroup acu = service.getByid(id);//��ȡ������Ա����ModelMap
	  Ids ids = new Ids();
	  ids.setIds(acu.getIds());
	  m.put("list",serviceu.getIds(ids));
	  m.put("group_id",id);
	return "Activity_usergroup/edit2";
}
@RequestMapping("removethisid")
public @ResponseBody JsonInfo removethisid(int id,int group_id) {//�Ƴ���ӦС���user id
	String ids = service.getByid(group_id).getIds();
	String idd = String.valueOf(id);
	String ip = remmove(ids,idd);
	Activity_usergroup acu = new Activity_usergroup();
	acu.setId(group_id);
	acu.setIds(ip);
	service.removeidsid(acu);
	return new JsonInfo(1,"");
}
@RequestMapping("groupcount")//�ж��Ƿ����
public String groupcount(int id,ModelMap m) {
	 Activity_usergroup count = service.getByid(id);
	 if(count.getIscount()==1) {
		 m.put("group_name",count.getName());
		 m.put("group_id", id);
		  return "Activity_usergroup/edit32";
	  }else {
		 m.put("glist",count); 
	  }
	return "Activity_usergroup/edit3";
}
@RequestMapping("groupcountedit")//�����޸�
public String groupcountedit(int id,ModelMap m) {
	 m.put("info",service.getByid(id));
	 m.put("group_name",service.getByid(id).getName());
	return "Activity_usergroup/edit32";
}
@RequestMapping("updatecount")//�޸ķ���
public @ResponseBody JsonInfo updatecount(Activity_usergroup acu,HttpServletRequest req) {
	 Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");
	 acu.setOperator_id(opetator.getId());
     service.updatecount(acu);	
	return new JsonInfo(1,"");
}
@Override
	public JsonInfo insert(Activity_usergroup t, ModelMap m, HttpServletRequest req) {  //group����
	   Activity_operator opetator=(Activity_operator) req.getSession().getAttribute("sdetail");
	      t.setOperator_id(opetator.getId());
	      t.setCreatedate(serialnumber.getStringDatehh()); 
		return super.insert(t, m, req);
}

private String remmove(String str1, String str2) {  //�ַ���str1�Ƴ�str2
	   String str = "";
	   ArrayList<String> a = changelist(str1);
	   ArrayList<String> b = changelist(str2);
	   a.removeAll(b);
	   String bb= a.toString().replaceAll(" ","");
	    str=bb.substring(1,bb.toString().length()-1);
	   return str;
}
private ArrayList<String> changelist(String str) {  //�ַ���ת����
	ArrayList<String> aa = new ArrayList<String>();
	  String [] sst = str.split(",");
	  for (int i = 0; i < sst.length; i++) {
		aa.add(sst[i]);
	}
	return aa;
}
}
