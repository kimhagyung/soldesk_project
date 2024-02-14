package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.InterestBean;

public interface InterestMapper {

	@Insert("insert into interests(interest_id, user_id, pro_id) " +
	        "values(interests_seq.nextval, #{user_id}, #{pro_id})")
	void insertInterest(InterestBean interestBean);

	@Delete("delete from interests where user_id = #{user_id} and pro_id = #{pro_id}")
	void deleteInterest(@Param("user_id") int user_id, @Param("pro_id") int pro_id);
	
	@Select("select * from interests where user_id = #{user_id} and "
			+ "pro_id = #{pro_id}")
	InterestBean findInterest(@Param("user_id") int user_id, @Param("pro_id") int pro_id);
	
	
}