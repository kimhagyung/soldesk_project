package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;

import kr.co.softsoldesk.beans.PortFolioBean;
 
public interface PortFolioMapper {


@Insert("INSERT INTO portfolio (portfolio_id, pro_id, service_type, portfolio_title, detailed_images, location_info, final_amount, work_year, work_period, detailed_introduction)\r\n"
		+ "VALUES (portfolio_seq.nextval, #{pro_id}, #{service_type, jdbcType=VARCHAR}, #{portfolio_title, jdbcType=VARCHAR}, #{detailed_images, jdbcType=VARCHAR}, #{location_info, jdbcType=VARCHAR}, #{final_amount}, #{work_year, jdbcType=VARCHAR}, #{work_period, jdbcType=VARCHAR}, #{detailed_introduction, jdbcType=VARCHAR})")
void addProPortfolioInfo(PortFolioBean ProPortfolio);
}
