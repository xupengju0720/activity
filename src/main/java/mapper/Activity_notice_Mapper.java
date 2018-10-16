package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_notice;
import utils.SeachInfo;

@Repository("Activity_notice_Mapper")

public interface Activity_notice_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_notice")
    public List<Activity_notice> getAll();
    
    @Select("select Activity_notice.*,Activity_operator.name oname,Activity.name aname from Activity_notice inner join Activity_operator on Activity_notice.operator_id =Activity_operator.id inner join Activity on Activity_notice.activity_id=Activity.id  ${where} ${limit}")
    public List<Activity_notice> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_notice ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_notice(name) value(#{name})")
	public int insert(Activity_notice t);
    
	@Update("update Activity_notice set name=#{name} where id=#{id}")
	public int update(Activity_notice t);
    
	@Delete("delete from Activity_notice where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_notice where id=#{id}")
	public Activity_notice getByid(int id);
	
    @Select("select * from Activity_notice ${where}")
  	public List<Activity_notice> getWhereAll(String where);
  	

	
}
