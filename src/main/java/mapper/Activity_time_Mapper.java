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

@Repository("Activity_time_Mapper")

public interface Activity_time_Mapper extends BaicsMapper{
	
    @Select("select Activity_time.*,activity.name aname from Activity_time inner join activity on Activity_time.activity_id=Activity.id")
    public List<Activity_time> getAll();
    
    @Select("select Activity_time.*,activity.name aname,activity_operator.name oname from Activity_time inner join activity on Activity_time.activity_id=Activity.id inner join activity_operator on activity_operator.id=activity_time.operator_id ${where} ${limit}")
    public List<Activity_time> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_time ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_time(activity_id,date,roominfo,operator_id,status,comments,time1,time2,time3,time4,time5,time6) value(#{activity_id},#{date},#{roominfo},#{operator_id},#{status},#{comments},#{time1},#{time2},#{time3},#{time4},#{time5},#{time6})")
	public int insert(Activity_time t);
    
	@Update("update Activity_time set activity_id=#{activity_id},date=#{date},roominfo=#{roominfo},operator_id=#{operator_id},status=#{status},comments=#{comments},time1=#{time1},time2=#{time2},time3=#{time3},time4=#{time4},time5=#{time5},time6=#{time6} where id=#{id}")
	public int update(Activity_time t);
    
	@Delete("delete from Activity_time where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_time where id=#{id}")
	public Activity_time getByid(int id);
	
    @Select("select * from Activity_time ${where}")
  	public List<Activity_time> getWhereAll(String where);

	
}
