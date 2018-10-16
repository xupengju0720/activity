package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_school;
import utils.SeachInfo;

@Repository("Activity_school_Mapper")

public interface Activity_school_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_school")
    public List<Activity_school> getAll();
    
    @Select("select * from Activity_school ${where} ${limit}")
    public List<Activity_school> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_school ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_school(name) value(#{name})")
	public int insert(Activity_school t);
    
	@Update("update Activity_school set name=#{name} where id=#{id}")
	public int update(Activity_school t);
    
	@Delete("delete from Activity_school where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_school where id=#{id}")
	public Activity_school getByid(int id);
	
    @Select("select * from Activity_school ${where}")
  	public List<Activity_school> getWhereAll(String where);
  	

	
}
