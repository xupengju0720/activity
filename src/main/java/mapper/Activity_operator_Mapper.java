package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_operator;
import entity.Activity_user;
import entity.Login;
import utils.MD5;
import utils.SeachInfo;

@Repository("Activity_operator_Mapper")

public interface Activity_operator_Mapper extends BaicsMapper{
    @Select("select * from Activity_operator")
    public List<Activity_operator> getAll();
    
    @Select("select * from Activity_operator ${where} ${limit}")
    public List<Activity_operator> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_operator ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_operator(niki,pass,name,type,tel,power,status,comments) values(#{niki},#{md5},#{name},#{type},#{tel},#{power},#{status},#{comments})")
	public int insert(Activity_operator t);
    
	@Update("update Activity_operator set niki=#{niki},name=#{name},type=#{type},tel=#{tel},power=#{power},status=#{status},comments=#{comments} where id=#{id}")
	public int update(Activity_operator t);
	@Update("update Activity_operator set pass =#{md5} where id=#{id}")
	public void updatepass(Activity_operator t);
    
	@Delete("delete from Activity_operator where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_operator where id=#{id}")
	public Activity_operator getByid(int id);
	
    @Select("select * from Activity_operator ${where}")
  	public List<Activity_operator> getWhereAll(String where);
  	@Select("select*from Activity_operator where Activity_operator.niki=#{niki} and Activity_operator.pass=#{md5} and Activity_operator.power='1'")
	public Activity_operator loginquesto(Login ll); 
	
  	@Select("select*from Activity_operator where Activity_operator.niki=#{niki} and Activity_operator.pass=#{md5} and Activity_operator.power='0'")
  	public Activity_operator loginquestoo(Login ll); 
  	

	
}
