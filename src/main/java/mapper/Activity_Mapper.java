package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity;
import entity.Activity_time;
import utils.SeachInfo;

@Repository("Activity_Mapper")

public interface Activity_Mapper extends BaicsMapper{
	
    @Select("select * from Activity")
    public List<Activity> getAll();
    
    @Select("select * from Activity ${where} ${limit}")
    public List<Activity> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity ${where}")
    public int getSize(SeachInfo where);
   
    @Insert("insert into Activity(ids,courseinfo,planinfo,date,school_id,college_id,name,count,classcount,options,charge_operator_id,instructor_user_id,attention,source_operator_id,type,createdate,status,comments,operator_id) values(#{ids},#{courseinfo},#{planinfo},#{date},#{school_id},#{college_id},#{name},#{count},#{classcount},#{options},#{charge_operator_id},#{instructor_user_id},#{attention},#{source_operator_id},#{type},#{createdate},#{status},#{comments},#{operator_id})")
   	public int insert(Activity t);
	
    @Update("update Activity set courseinfo=#{courseinfo},planinfo=#{planinfo}, date=#{date},school_id=#{school_id}, college_id=#{college_id}, name=#{name}, count=#{count}, classcount=#{classcount}, options=#{options}, charge_operator_id=#{charge_operator_id}, instructor_user_id=#{instructor_user_id}, type=#{type},attention=#{attention}, source_operator_id=#{source_operator_id}, type=#{type}, status=#{status}, comments=#{comments}, operator_id=#{operator_id} where id=#{id}")
	public int update(Activity t);
    
    
    @Update("update Activity set ids=#{ids} where Activity.id=#{id}")
    public void updateactivityids(Activity t);
    
	@Delete("delete from Activity where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity where id=#{id}")
	public Activity getByid(int id);
    @Select("select * from Activity ${where}")
  	public List<Activity> getWhereAll(String where);
  	@Select("select Activity_time.*,Activity.name aname,activity_operator.name oname from Activity_time inner join Activity on Activity.id=Activity_time.Activity_id inner join activity_operator on activity_time.operator_id=activity_operator.id where Activity_time.Activity_id=#{id}")
  	public List<Activity_time> datedetail(int id);
	@Select("select Activity.id,Activity.name from Activity")
  	public List<Activity> getidname();
}
