package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_college;
import entity.Activity_user;
import entity.Login;
import utils.Ids;
import utils.SeachInfo;

@Repository("Activity_user_Mapper")

public interface Activity_user_Mapper extends BaicsMapper{
	
    @Select("select Activity_user.*,Activity_school.name sname,activity_college.name cname from Activity_user  INNER JOIN Activity_school ON Activity_user.school_id=activity_school.id INNER JOIN activity_college ON Activity_user.college_id=activity_college.id")
    public List<Activity_user> getAll();
    
    @Select("select Activity_user.*,Activity_school.name sname,activity_college.name cname from Activity_user  INNER JOIN Activity_school ON Activity_user.school_id=activity_school.id INNER JOIN activity_college ON Activity_user.college_id=activity_college.id  ${where} ${limit}")
    public List<Activity_user> getWhere(SeachInfo where);
    
    @Select("select Activity_user.*,Activity_school.name sname,activity_college.name cname from Activity_user  INNER JOIN Activity_school ON Activity_user.school_id=activity_school.id INNER JOIN activity_college ON Activity_user.college_id=activity_college.id where Activity_user.id in (${ids}) and Activity_user.type='0' ")
    public List<Activity_user> getIds(Ids ids);
    
    @Select("select count(id) from Activity_user ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_user(niki,name,pass,tel,sex,type,qq,classinfo,school_id,college_id,ylevel,glevel,slevel,status,info,createdate,operator_id,comments) values(#{niki},#{name},#{md5},#{tel},#{sex},#{type},#{qq},#{classinfo},#{school_id},#{college_id},#{ylevel},#{glevel},#{slevel},#{status},#{info},#{createdate},#{operator_id},#{comments})")
	public int insert(Activity_user t);
    
	@Update("update Activity_user set niki=#{niki},name=#{name},tel=#{tel},sex=#{sex},type=#{type},qq=#{qq},classinfo=#{classinfo},school_id=#{school_id},college_id=#{college_id},ylevel=#{ylevel},glevel=#{glevel},slevel=#{slevel},info=#{info},operator_id=#{operator_id},comments=#{comments} where id=#{id}")
	public int update(Activity_user t);
    
	@Update("update Activity_user set pass=#{md5} where id=#{id}")
	public void updatepass(Activity_user t);
	
	@Delete("delete from Activity_user where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_user where id=#{id}")
	public Activity_user getByid(int id);
    @Select("select * from Activity_user where niki=#{niki} and name=#{name} and tel=#{tel} and type ='0'")
    public Activity_user getByinfo(Activity_user uu);
	@Select("select @@identity")
	public int justnow();
    @Select("select * from Activity_user ${where}")
  	public List<Activity_user> getWhereAll(String where);
  	@Select("select * from Activity_college where Activity_college.school_id=#{id}")
  	public List<Activity_college> getcollege(int id);
  	@Select("select Activity_user.id,Activity_user.name from Activity_user where Activity_user.type='0'")
	public List<Activity_user> alluser();
	@Select("select Activity_user.id,Activity_user.name from Activity_user where Activity_user.id in (${ids}) and Activity_user.type='0'")
	public List<Activity_user> teamperson(Ids ids); 
	@Select("select*from Activity_user where Activity_user.niki=#{niki} and Activity_user.pass=#{md5} and Activity_user.type='0'")
	public Activity_user loginquesto(Login ll); 
	@Select("select*from Activity_user where Activity_user.niki=#{niki} and Activity_user.pass=#{md5} and Activity_user.type='1'")
	public Activity_user loginquestoo(Login ll); 
	@Select("select Activity_user.*,Activity_school.name sname,activity_college.name cname from Activity_user  INNER JOIN Activity_school ON Activity_user.school_id=activity_school.id INNER JOIN activity_college ON Activity_user.college_id=activity_college.id  ${where}")
	public List<Activity_user>  selectuser(SeachInfo sea);
	
}
