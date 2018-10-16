package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_report;
import utils.SeachInfo;

@Repository("Activity_report_Mapper")

public interface Activity_report_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_report")
    public List<Activity_report> getAll();
    
    @Select("select Activity_report.*,Activity.name aname,Activity_operator.name oname from Activity_report inner join Activity on Activity_report.activity_id=Activity.id inner join Activity_operator on Activity_report.operator_id =Activity_operator.id ${where} ${limit}")
    public List<Activity_report> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_report ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_report(activity_id,operator_id,date,tprogress,sprogress,cprogress,json,comments) values(#{activity_id},#{operator_id},#{date},#{tprogress},#{sprogress},#{cprogress},#{json},#{comments})")
	public int insert(Activity_report t);
    
	@Update("update Activity_report set activity_id=#{activity_id},operator_id=#{operator_id},date=#{date},tprogress=#{tprogress},sprogress=#{sprogress},cprogress=#{cprogress},json=#{json},comments=#{comments} where id=#{id}")
	public int update(Activity_report t);
    
	@Delete("delete from Activity_report where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_report where id=#{id}")
	public Activity_report getByid(int id);
	
    @Select("select * from Activity_report ${where}")
  	public List<Activity_report> getWhereAll(String where);
  	
  	@Select("select Activity_report.*,Activity.name aname,Activity_operator.name oname from Activity_report inner join Activity on Activity_report.activity_id=Activity.id inner join Activity_operator on Activity_operator.id =Activity_report.operator_id where Activity_report.activity_id=#{activity_id} and Activity_report.date = #{date}")
  	public Activity_report getByactid(Activity_report acr);

	
}
