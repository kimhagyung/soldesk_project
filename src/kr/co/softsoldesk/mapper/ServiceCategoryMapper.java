package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ServiceCategoryBean;

public interface ServiceCategoryMapper {

	@Select("select service_category_id\r\n"
			+ "from servicectg")
	List<ServiceCategoryBean> getCategoryList();
	
	
	
} //mapper 등록하세요
