package mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity;
import entity.Activity_usergroup;
import utils.SeachInfo;

@Repository("Activity_usergroup_Mapper")

public interface Activity_usergroup_Mapper extends BaicsMapper{
	
    @Select("select Activity_usergroup.*,activity.name aname from Activity_usergroup inner join activity on Activity_usergroup.activity_id=activity.id")
    public List<Activity_usergroup> getAll();
    @Select("select Activity_usergroup.*,activity.name aname,activity_operator.name oname from Activity_usergroup inner join activity on Activity_usergroup.activity_id=activity.id inner join activity_operator on activity_operator.id = Activity_usergroup.operator_id ${where} ${limit}")
    public List<Activity_usergroup> getWhere(SeachInfo where);
    @Select("select count(id) from Activity_usergroup ${where}")
    public int getSize(SeachInfo where);
    @Insert("insert into Activity_usergroup(activity_id,name,operator_id,path,ids,comments,project,createdate,point1,point2,point3,point4,point5,point6,point7,point8,point9,point10) value(#{activity_id},#{name},#{operator_id},#{path},#{ids},#{comments},#{project},#{createdate},#{point1},#{point2},#{point3},#{point4},#{point5},#{point6},#{point7},#{point8},#{point9},#{point10})")
	public int insert(Activity_usergroup t);
	@Update("update Activity_usergroup set name=#{name},path=#{path},comments=#{comments},project=#{project},ids=#{ids} where Activity_usergroup.id=#{id}")
	public int update(Activity_usergroup t);
	@Update("update Activity_usergroup set operator_id=#{operator_id},point1=#{point1},point2=#{point2},point3=#{point3},point4=#{point4},point5=#{point5},point6=#{point6},point7=#{point7},point8=#{point8},point9=#{point9},point10=#{point10} where Activity_usergroup.id=#{id}")
	public int updatecount(Activity_usergroup t);
	@Delete("delete from Activity_usergroup where id=#{id}")
	public int delete(int id); 
    @Select("select Activity_usergroup.*,activity.name aname,activity_operator.name oname from Activity_usergroup inner join activity on Activity_usergroup.activity_id=activity.id inner join activity_operator on activity_operator.id = Activity_usergroup.operator_id  where Activity_usergroup.id=#{id}")
	public Activity_usergroup getByid(int id);
    @Select("select * from Activity_usergroup ${where}")
  	public List<Activity_usergroup> getWhereAll(String where);
  	@Select("select Activity_usergroup.ids from Activity_usergroup where Activity_usergroup.activity_id=#{id}")
    public  ArrayList<String>  getAllids(int id);
  	@Update("update Activity_usergroup set ids=#{ids} where Activity_usergroup.id=#{id}")
	public void removeidsid(Activity_usergroup t);
}
