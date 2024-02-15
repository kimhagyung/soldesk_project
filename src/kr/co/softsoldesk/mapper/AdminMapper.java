package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.beans.UserBean;

public interface AdminMapper {
	
	@Select("select * from admin where admin_id=#{admin_id} and admin_pwd=#{admin_pwd}")
	AdminBean getLoginadminInfo(AdminBean adminTempLoginBean);
	
	//user
	@Select("select * from users order by user_id asc")
	List<UserBean> getAllUsers();
	
	@Delete("delete from users where user_id=#{user_id}")
	void deleteUser(int user_id);
	
	//pro
	@Select("select * from pro_user order by pro_id asc")
	List<ProUserBean> getAllUProUsers();
	
	@Delete("delete from pro_user where pro_id=#{pro_id}")
	void deleteProUser(int pro_id);
	
	//커뮤니티 조회 
	@Select("select * from board order by board_id asc")
	List<PostBean> getAllUBoard();
	
	//게시글 올린 사람 이름 조회 
	@Select("select user_name from users, board where users.user_id=board.user_id and board_id=${board_id}")
	String getPostUserName(int board_id);
	
	@Select("select pro_name from pro_user, board where pro_user.pro_id=board.pro_id and board_id=${board_id}")
	String getPostProUserName(int board_id); 
	
	//포트폴리오 조회 
	@Select("select *from portfolio")
	List<PortFolioBean> getAllPortfolio();
	
	//포폴 작성자 이름 
	@Select("select pro_name from pro_user, portfolio where pro_user.pro_id=portfolio.pro_id and portfolio_id=${portfolio_id}")
	String getPortfolioName(int portfolio_id);
	
	//포폴 검수 완료  
	@Update("update portfolio set inspectionNY=1 where portfolio_id=#{portfolio_id}")
	void CompPort(int portfolio_id);

	//포폴 삭제
	@Delete("delete from portfolio where portfolio_id=#{portfolio_id}")
	void DelPortfolio(int portfolio_id);
	
	//게시글 삭제 
	@Delete("delete from board where board_id=#{board_id}")
	void deletePost(int board_id);
	
	//카테고리 조회...
		@Select("SELECT servicectg.service_category_name, detailctg.detail_category_name, detailctg.detail_category_id, detailctg.service_category_id \r\n"
				+ "FROM  detailctg\r\n"
				+ "JOIN  servicectg\r\n"
				+ "ON servicectg.service_category_id = detailctg.service_category_id\r\n"
				+ "order by detailctg.detail_category_id ")
		List<DetailCategoryBean> getDetailList();
		
		//서비스 카테고리 이름 조회.....옵션...
		@Select("select service_category_name from servicectg")
		List<ServiceCategoryBean> getServiceCategoryName();
		
		//카테고리 추가..
		@SelectKey(statement = "select detailctg_seq.nextval from dual", keyProperty = "detail_category_id", 
				before = true, resultType = int.class)
		@Insert("INSERT INTO detailctg (detail_category_id, service_category_id, detail_category_name, file_name)\r\n"
				+ "VALUES (detailctg_seq.nextval, (SELECT service_category_id FROM servicectg WHERE service_category_name = #{service_category_name}), #{detail_category_name}, #{file_name})")
		void addCategory(DetailCategoryBean addCategoryBean);
		//내가 쓴 게시글 갯수
		@Select("SELECT COUNT(*)\r\n"
				+ "FROM board\r\n"
				+ "WHERE (user_id = #{user_id, jdbcType=INTEGER})")
		int getUserPostCnt(@Param("user_id") Integer user_id);
		
		@Select("SELECT COUNT(*)\r\n"
				+ "FROM board\r\n"
				+ "WHERE (pro_id = #{pro_id, jdbcType=INTEGER})")
		int getProPostCnt(@Param("pro_id") Integer pro_id);
		
}
