package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.mapper.PortFolioMapper; 

@Repository
public class ProPortfolioDAO { 
	
	@Autowired
	PortFolioMapper portfoliMapper;
	 
	public void addProPortfolioInfo(PortFolioBean ProPortfolio){
		
		portfoliMapper.addProPortfolioInfo(ProPortfolio);
	}
}
