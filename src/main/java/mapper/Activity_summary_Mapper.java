package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_summary;
import utils.SeachInfo;

@Repository("Activity_summary_Mapper")

public interface Activity_summary_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_summary")
    public List<Activity_summary> getAll();
    
    @Select("select Activity_summary.*,Activity.name aname,Activity_operator.name oname from Activity_summary inner join Activity on Activity_summary.activity_id=Activity.id inner join Activity_operator on Activity_summary.operator_id=Activity_operator.id  ${where} ${limit}")
    public List<Activity_summary> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_summary ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_summary(activity_id,operator_id,createdate,options,summary,proposal,sstatus,tstatus,cstatus,xstatus) values(#{activity_id},#{operator_id},#{createdate},#{options},#{summary},#{proposal},#{sstatus},#{tstatus},#{cstatus},#{xstatus})")
	public int insert(Activity_summary t);
    
	@Update("update Activity_summary set activity_id=#{activity_id},operator_id=#{operator_id},createdate=#{createdate},options=#{options},summary=#{summary},proposal=#{proposal},sstatus=#{sstatus},tstatus=#{tstatus},cstatus=#{cstatus},xstatus=#{xstatus} where id=#{id}")
	public int update(Activity_summary t);
    
	@Delete("delete from Activity_summary where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_summary where id=#{id}")
	public Activity_summary getByid(int id);
	
    @Select("select * from Activity_summary ${where}")
  	public List<Activity_summary> getWhereAll(String where);
  	@Select("select Activity_summary.*,Activity.name aname,Activity_operator.name oname from Activity_summary inner join Activity on Activity_summary.Activity_id = Activity.id inner join Activity_operator on Activity_summary.operator_id=Activity_operator.id where Activity_summary.activity_id=#{activity_id} and Activity_summary.createdate=#{createdate}")
  	public Activity_summary getByiddate(Activity_summary as);
}
