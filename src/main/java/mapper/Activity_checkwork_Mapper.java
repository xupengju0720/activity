package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_checkwork;
import utils.SeachInfo;

@Repository("Activity_checkwork_Mapper")

public interface Activity_checkwork_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_checkwork")
    public List<Activity_checkwork> getAll();
    
    @Select("select Activity_checkwork.*,activity.name aname,activity_user.name uname,Activity_operator.name oname from Activity_checkwork inner join activity on Activity_checkwork.activity_id=activity.id inner join Activity_user on Activity_checkwork.user_id=Activity_user.id inner join Activity_operator on Activity_operator.id = Activity_checkwork.operator_id ${where} ${limit}")
    public List<Activity_checkwork> getWhere(SeachInfo where);
    
    @Select("select Activity_checkwork.*,activity.name aname,activity_user.name uname,Activity_operator.name oname from Activity_checkwork inner join activity on Activity_checkwork.activity_id=activity.id inner join Activity_user on Activity_checkwork.user_id=Activity_user.id inner join Activity_operator on Activity_operator.id = Activity_checkwork.operator_id where Activity_checkwork.activity_id=#{id} and Activity_checkwork.date=#{date}")
    public List<Activity_checkwork> getByactid(Activity_checkwork che);
    
    @Select("select count(id) from Activity_checkwork ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_checkwork(activity_id,user_id,date,check1,check2,check3,lastdate,operator_id,comments) values(#{activity_id},#{user_id},#{date},#{check1},#{check2},#{check3},#{lastdate},#{operator_id},#{comments})")
	public int insert(Activity_checkwork t);
    @Update("update Activity_checkwork set activity_id=#{activity_id},user_id=#{user_id},date=#{date},check1=#{check1},check2=#{check2},check3=#{check3},lastdate=#{lastdate},operator_id=#{operator_id},comments=#{comments} where id=#{id}")
    public void fbupdate(Activity_checkwork t);
    
    @Update("update Activity_checkwork set check1=#{check1},check2=#{check2},check3=#{check3},lastdate=#{lastdate},operator_id=#{operator_id},comments=#{comments} where id=#{id}")
    public void allupdate(Activity_checkwork t);
    
	@Update("update Activity_checkwork set name=#{name} where id=#{id}")
	public int update(Activity_checkwork t);
    
	
	@Delete("delete from Activity_checkwork where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_checkwork where id=#{id}")
	public Activity_checkwork getByid(int id);
	
    @Select("select * from Activity_checkwork ${where}")
  	public List<Activity_checkwork> getWhereAll(String where);
  	

	
}
