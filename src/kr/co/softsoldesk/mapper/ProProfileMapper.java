package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.ReviewBean;

public interface ProProfileMapper {

	@Insert("INSERT INTO pro_profile (pro_profile_id, pro_id, pro_profile_image, profile_completion, review_rating, certification_documents_images, pro_detailed_introduction, price)\r\n"
	        + "VALUES (pro_profile_seq.nextval, #{pro_id}, #{pro_profile_image, jdbcType=VARCHAR}, #{profile_completion, jdbcType=INTEGER}, #{review_rating, jdbcType=INTEGER}, #{certification_documents_images, jdbcType=VARCHAR}, #{pro_detailed_introduction, jdbcType=VARCHAR}, #{price, jdbcType=VARCHAR})")
	void addExpertInfo(ExpertBean writeExpertInfo);
	
	@Select("SELECT COUNT(*) FROM pro_profile WHERE pro_id = #{proId}")
    int countExpertIntroductionByProId(@Param("proId") int proId);
	
	@Update("UPDATE pro_profile\r\n"
			+ "SET pro_detailed_introduction = #{pro_detailed_introduction}\r\n"
			+ "WHERE pro_id = #{pro_id}")
	void modifyIntroduction(@Param("pro_detailed_introduction") String pro_detailed_introduction, @Param("pro_id") int pro_id);

	@Select("select pro_profile_id, pro_id, pro_profile_image, profile_completion, review_rating, certification_documents_images, pro_detailed_introduction, price\r\n"
			+ "from pro_profile\r\n"
			+ "where pro_id = #{pro_id}")
	List<ExpertBean> getExpertInfoList(int pro_id);
	
	@Update("UPDATE pro_profile\r\n"
			+ "SET price = #{price}\r\n"
			+ "WHERE pro_id = #{pro_id}")
	void modifyPrice(@Param("price") String price, @Param("pro_id") int pro_id);
	
	//자격증 이미지
	@Update("update pro_profile "
         + "set pro_profile_image = #{pro_profile_image} "
         + "where pro_id = #{pro_id}")
   void modifyImg(@Param("pro_profile_image") String pro_profile_image, @Param("pro_id") Integer pro_id);
   
   @Select("select pro_profile_image from pro_profile "
         + "where pro_id = #{pro_id}")
   String getImageInfo(int pro_id);
   
   //프로필 이미지
   @Select("select * from pro_profile "
	         + "where pro_id = #{pro_id}")
   ExpertBean getProfileInfo(int pro_id);
   
   @Update("update pro_profile "
         + "set certification_documents_images = #{certification_documents_images, jdbcType=VARCHAR} "
         + "where pro_id = #{pro_id}")
   void modifyProfileImg(ExpertBean profileImgExpertBean);
   
   @Select("select certification_documents_images from pro_profile "
         + "where pro_id = #{pro_id}")
   String getProfileImgInfo(int pro_id);
   
 //일류프로필 정보 조회 
 	@Select("select pro_detailed_introduction,pro_profile_image,pro_id from pro_profile")
 	List<ExpertBean> getProProfileInfo();
 	
 	//경력 정보 조회
 	@Select("SELECT SUM(total_experience_period) AS total_experience_period\r\n"
 			+ "FROM career\r\n"
 			+ "GROUP BY pro_id order by pro_id asc")
 	List<CareerBean> getCareerInfo();
 	
 	//리뷰 조회 

 	@Select("select * from review")
 	List<ReviewBean> getAllReview();
	
}