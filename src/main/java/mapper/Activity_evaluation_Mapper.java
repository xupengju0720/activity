package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity;
import entity.Activity_evaluation;
import entity.Activity_evaluation;
import utils.Ids;
import utils.SeachInfo;

@Repository("Activity_evaluation_Mapper")

public interface Activity_evaluation_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_evaluation")
    public List<Activity_evaluation> getAll();
    @Select("select * from Activity_evaluation where activity_id =#{id} ")
    public List<Activity_evaluation> getAllactid(int id);
    @Select("select Activity_evaluation.*,Activity.name aname,Activity_user.name uname from Activity_evaluation inner join Activity on Activity_evaluation.activity_id =Activity.id inner join Activity_user on Activity_evaluation.user_id =Activity_user.id ${where} ${limit}")
    public List<Activity_evaluation> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_evaluation ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_evaluation(point,comments,status,user_id,activity_id) values(#{point},#{comments},#{status},#{user_id},#{activity_id})")
	public int insert(Activity_evaluation t);
    
	@Update("update Activity_evaluation set point=#{point},comments=#{comments},status=#{status} where id=#{id}")
	public int update(Activity_evaluation t);
    
	@Delete("delete from Activity_evaluation where id=#{id}")
	public int delete(int id); 
    
    @Select("select Activity_evaluation.*,Activity.name aname,Activity_user.name uname from Activity_evaluation inner join Activity on Activity.id=Activity_evaluation.Activity_id inner join Activity_user on Activity_evaluation.user_id = Activity_user.id where activity_evaluation.id=#{id}")
	public Activity_evaluation getByid(int id);
    @Select("select * from Activity_evaluation ${where}")
  	public List<Activity_evaluation> getWhereAll(String where);
  	@Select("select Activity_evaluation.*,Activity.name aname,Activity_user.name uname from Activity_evaluation inner join Activity on Activity.id=Activity_evaluation.Activity_id inner join Activity_user on Activity_evaluation.user_id = Activity_user.id where Activity_evaluation.user_id in (${ids}) and Activity_evaluation.activity_id=#{id}")
    public List<Activity_evaluation> getIds(Activity acc);

	
}
