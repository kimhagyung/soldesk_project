package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.mapper.ExpertMapper; 

@Repository
public class ExpertDAO {
	
	@Autowired
	ExpertMapper expertMapper;
	
	public void addExpertInfo(ExpertBean expertBean) {
		
		expertMapper.addExpertInfo(expertBean);
	}
	
	

}
