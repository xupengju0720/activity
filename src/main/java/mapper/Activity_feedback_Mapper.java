package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import entity.Activity_feedback;
import utils.SeachInfo;

@Repository("Activity_feedback_Mapper")

public interface Activity_feedback_Mapper extends BaicsMapper{
	
    @Select("select * from Activity_feedback")
    public List<Activity_feedback> getAll();
    
    @Select("select Activity_feedback.*,Activity_user.name uname,Activity.name aname from Activity_feedback inner join Activity_user on Activity_feedback.user_id=Activity_user.id inner join Activity on Activity_feedback.activity_id =Activity.id  ${where} ${limit}")
    public List<Activity_feedback> getWhere(SeachInfo where);
    
    @Select("select count(id) from Activity_feedback ${where}")
    public int getSize(SeachInfo where);
    
    @Insert("insert into Activity_feedback(activity_id,user_id,status,result,opt1,opt2,opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,text1,text2,text3,text4,text5,text6,text7,text8,text9,text10) values(#{activity_id},#{user_id},#{status},#{result},#{opt1},#{opt2},#{opt3},#{opt4},#{opt5},#{opt6},#{opt7},#{opt8},#{opt9},#{opt10},#{text1},#{text2},#{text3},#{text4},#{text5},#{text6},#{text7},#{text8},#{text9},#{text10)")
	public int insert(Activity_feedback t);
    
	@Update("update Activity_feedback set activity_id=#{activity_id},user_id=#{user_id},status='1',result=#{result},opt1=#{opt1},opt2=#{opt2},opt3=#{opt3},opt4=#{opt4},opt5=#{opt5},opt6=#{opt6},opt7=#{opt7},opt8=#{opt8},opt9=#{opt9},opt10=#{opt10},text1=#{text1},text2=#{text2},text3=#{text3},text4=#{text4},text5=#{text5},text6=#{text6},text7=#{text7},text8=#{text8},text9=#{text9},text10=#{text10} where id=#{id}")
	public int update(Activity_feedback t);
	@Update("update Activity_feedback set result = #{result} where Activity_feedback.id = #{id}")
	public void resultupdate(Activity_feedback t);
	@Update("update Activity_feedback set status = #{status} where Activity_feedback.id = #{id}")
	public void statusupdate(Activity_feedback t);
	@Delete("delete from Activity_feedback where id=#{id}")
	public int delete(int id); 
    
    @Select("select * from Activity_feedback where id=#{id}")
	public Activity_feedback getByid(int id);
	
    @Select("select * from Activity_feedback ${where}")
  	public List<Activity_feedback> getWhereAll(String where);
  	
  	@Select("select Activity_feedback.*,Activity_user.name uname,Activity.name aname from Activity_feedback inner join Activity_user on Activity_feedback.user_id=Activity_user.id inner join Activity on Activity_feedback.activity_id =Activity.id where Activity_feedback.activity_id=#{id}")
  	public List<Activity_feedback> getByactid(int id);
  	
	
}
