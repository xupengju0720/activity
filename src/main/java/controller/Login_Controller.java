package controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Activity_operator;
import entity.Activity_user;
import entity.Login;
import service.Activity_operator_Service;
import service.Activity_user_Service;
import utils.JsonInfo;
import utils.MD5;

@Controller
public class Login_Controller{
@Resource(name="Activity_user_ServiceImpl")
Activity_user_Service service;
@Resource(name="Activity_operator_ServiceImpl")
Activity_operator_Service serviceo;
@Resource(name="Activity_user_ServiceImpl")
Activity_user_Service serviceu;
	@RequestMapping("login")
	public @ResponseBody JsonInfo login(Login ll,HttpSession session) {
		session.removeAttribute("statecount");
		session.removeAttribute("sdetail");
		session.removeAttribute("qufen");
		 String a=(String) session.getAttribute("randomCode").toString();
		 if (a.equalsIgnoreCase(ll.getRecomend())) {
		switch (ll.getId()) {
		case 1:
			Activity_user oo= service.loginquesto(ll);
			if (oo==null) {
				 session.setAttribute("statecount", "µÇÂ½Ê§°Ü!");
			}else {
				session.setAttribute("qufen",1);
				session.setAttribute("sdetail",oo);
				return new JsonInfo(2,"");
			}
			
			break;
		case 2:
			Activity_user pp= service.loginquestoo(ll);
			if (pp==null) {
				 session.setAttribute("statecount", "µÇÂ½Ê§°Ü!");
			}else {
				session.setAttribute("qufen",2);
				session.setAttribute("sdetail",pp);
				return new JsonInfo(2,"");
			}
			break;
		case 3:
			Activity_operator aa = serviceo.loginquesto(ll);
			if (aa==null) {
				 session.setAttribute("statecount", "µÇÂ½Ê§°Ü!");
			}else {
				session.setAttribute("qufen",3);
				session.setAttribute("sdetail",aa);
				return new JsonInfo(2,"");
			}
			break;
		case 4:
			Activity_operator bb = serviceo.loginquestoo(ll);
			if (bb==null) {
				 session.setAttribute("statecount", "µÇÂ½Ê§°Ü!");
				 
			}else {
				session.setAttribute("qufen",4);
				session.setAttribute("sdetail",bb);
				return new JsonInfo(2,"");
			}
			break;

		default:
			session.setAttribute("statecount", "µÇÂ½Ê§°Ü!");
			break;
		}
			
		 }else {
				session.setAttribute("statecount", "ÑéÖ¤Âë´íÎó!");
				return new JsonInfo(1,"");
			}
		 return new JsonInfo(1,"");
	}
	@RequestMapping("password")//ÃÜÂëÐÞ¸Ä
	public @ResponseBody JsonInfo password(String password,String password1,String password2,HttpSession session) {
		   if(password1.equals(password2)) {
			   Integer qufen= (Integer) session.getAttribute("qufen");
			   if(qufen==3||qufen==4) {
				   Activity_operator aop = (Activity_operator) session.getAttribute("sdetail");
				   if(aop.getPass().equals(MD5.MD5(password))) {
					   aop.setPass(password1);
					   serviceo.updatepass(aop);
					   
				   }else {
						return new JsonInfo(3,""); 
				   }
			   }
			   else if(qufen==1||qufen==2) {
				   Activity_user aus =	(Activity_user) session.getAttribute("sdetail");
				   if(aus.getPass().equals(MD5.MD5(password))) {
					   aus.setPass(password1);
					   serviceu.updatepass(aus);
					   
				   }else {
						return new JsonInfo(3,""); 
				   }
			   }
		   }else {
		return new JsonInfo(2,"");
		   }
		return new JsonInfo(1,"");
	}
	
	
	
}
