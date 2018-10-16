package controller;
import java.lang.reflect.Field;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.basicService;
import utils.JsonInfo;
import utils.SeachInfo;
public class basicController<T> {
	
	 basicService<T> modelService;	
	SeachInfo where=new SeachInfo();

	public void init(){
		if(modelService!=null)return;
		try {
			Field f=this.getClass().getDeclaredField("service");
			f.setAccessible(true);
			modelService=(basicService<T>) f.get(this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping(value="index",method=RequestMethod.GET,params="id")
	public void delete(int id,ModelMap m,HttpServletRequest req){
		init();
		modelService.delete(id);		
		index(where,m,req);
	}
	
	@RequestMapping("index")
	public void index(SeachInfo where,ModelMap m,HttpServletRequest req){
		init();
		String p=req.getParameter("pageno");
		if(p!=null) where.setPageno(Integer.valueOf(p));
		where.setCanpage(true);
		this.where=where;
		if(modelService!=null) m.put("list", modelService.getWhere(this.where));
		m.put("result", this.where);
	}

	@RequestMapping(value="index",  params="insert")	
	public @ResponseBody JsonInfo insert(T t,ModelMap m,HttpServletRequest req){
		init();
		return new JsonInfo(modelService.insert(t));
	}
	
	@RequestMapping(value="index",params="update")
	public @ResponseBody JsonInfo update(T t,ModelMap m,HttpServletRequest req){
		init();
		return new JsonInfo(modelService.update(t));
	}
	@RequestMapping(value="edit",params="id")
	public void get(int id,ModelMap m,HttpServletRequest req){
		init();
		m.put("info", modelService.getByid(id)) ;
	}
	@RequestMapping("edit")
	public void add(ModelMap m,HttpServletRequest req){
		
	}
	
	
	@ExceptionHandler
	public ModelAndView basicException(Exception e){
		e.printStackTrace();
		ModelAndView m=new ModelAndView("err");
		m.addObject("err", e.getStackTrace());
		return m;
	} 
	
	
}
