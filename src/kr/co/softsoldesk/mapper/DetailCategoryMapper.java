package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.DetailCategoryBean;

public interface DetailCategoryMapper {

	
	
	@Select("select service_category_name\r\n"
			+ "from servicectg\r\n"
			+ "where service_category_id  = #{service_category_id}")
	String getServiceCategoryName(int service_category_id);
	
	@Select("select s.service_category_id, d.detail_category_name, d.file_name, s.service_category_name \r\n"
			+ "from servicectg s, detailctg d\r\n"
			+ "where s.service_category_id = d.service_category_id\r\n"
			+ "and s.service_category_id = #{service_category_id}")
	List<DetailCategoryBean> getDetailCategoryList(int service_category_id);
	
	
	
}
