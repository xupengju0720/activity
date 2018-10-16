package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_college;
import utils.SeachInfo;

@Repository("Activity_college_Mapper")

public interface Activity_college_Mapper extends BaicsMapper{
	
    @Select("select Activity_college.*,Activity_school.name sname from Activity_college inner join Activity_school on Activity_college.school_id=Activity_school.id")
    public List<Activity_college> getAll();
    
    @Select("select Activity_college.*,Activity_school.name sname from Activity_college inner join Activity_school on Activity_college.school_id=Activity_school.id  ${where} ${limit}")
    public List<Activity_college> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_college ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_college(name,school_id) values(#{name},#{school_id})")
	public int insert(Activity_college t);
    
	@Update("update Activity_college set name=#{name} where id=#{id}")
	public int update(Activity_college t);
    
	@Delete("delete from Activity_college where id=#{id}")
	public int delete(int id); 
    
    @Select("select Activity_college.*,Activity_school.name sname from Activity_college inner join Activity_school on Activity_college.school_id=Activity_school.id where Activity_college.id=#{id}")
	public Activity_college getByid(int id);
	
    @Select("select Activity_college.*,Activity_school.name sname from Activity_college inner join Activity_school on Activity_college.school_id=Activity_school.id ${where}")
  	public List<Activity_college> getWhereAll(String where);
  	@Select("select * from Activity_college where Activity_college.school_id=#{id}")
  	public List<Activity_college> selectcollege(int id);

	
}
