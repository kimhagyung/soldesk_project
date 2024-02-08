package kr.co.softsoldesk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.dao.ExpertDAO;

@Service
public class ExpertService {
	
	@Autowired
	ExpertDAO expertDAO;
	
	public void addExpert(ExpertBean expertBean) {
		
		expertDAO.addExpertInfo(expertBean);
	}

}
