package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_market;
import utils.SeachInfo;

@Repository("Activity_market_Mapper")

public interface Activity_market_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_market")
    public List<Activity_market> getAll();
    
    @Select("select Activity_market.*,Activity.name aname,Activity_operator.name oname from Activity_market inner join Activity on Activity_market.activity_id =activity.id inner join Activity_operator on Activity_operator.id =Activity_market.operator_id  ${where} ${limit}")
    public List<Activity_market> getWhere(SeachInfo where);
    
    @Select("select Activity_market.*,Activity.name aname,Activity_operator.name oname from Activity_market inner join Activity on Activity_market.activity_id =activity.id inner join Activity_operator on Activity_operator.id =Activity_market.operator_id where Activity_market.activity_id=#{activity_id} and Activity_market.date=#{date}")
    public Activity_market getByacid(Activity_market t);
    
    @Select("select count(id) from Activity_market ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_market(activity_id,operator_id,date,info,json,comments) values(#{activity_id},#{operator_id},#{date},#{info},#{json},#{comments})")
	public int insert(Activity_market t);
    
	@Update("update Activity_market set activity_id=#{activity_id},operator_id=#{operator_id},date=#{date},info=#{info},json=#{json},comments=#{comments} where id=#{id}")
	public int update(Activity_market t);
    
	@Delete("delete from Activity_market where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_market where id=#{id}")
	public Activity_market getByid(int id);
	
    @Select("select * from Activity_market ${where}")
  	public List<Activity_market> getWhereAll(String where);
  	

	
}
