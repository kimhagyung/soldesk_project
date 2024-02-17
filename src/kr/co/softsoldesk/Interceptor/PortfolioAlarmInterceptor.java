package kr.co.softsoldesk.Interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.service.AdminService; 

public class PortfolioAlarmInterceptor implements HandlerInterceptor{
 
	 
	private PortFolioBean AdminAlarm;
	private AdminService adminservice;
	
	public PortfolioAlarmInterceptor(PortFolioBean AdminAlarm,AdminService adminservice) {
		this.AdminAlarm = AdminAlarm;
		this.adminservice=adminservice;
	} 

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		List<PortFolioBean> inspecportfolio =adminservice.getInspectionPortfolio();
		int CntPortfolio=adminservice.getCntInspectionPortfolio();
		
			for(PortFolioBean insepecport:inspecportfolio) {
			AdminAlarm.setPortfolio_id(insepecport.getPortfolio_id());
			AdminAlarm.setPortfolio_title(insepecport.getPortfolio_title()); 
			AdminAlarm.setInspectionNY(insepecport.getInspectionNY());
		}	
		AdminAlarm.setPortfolioCnt(CntPortfolio);
		request.setAttribute("AdminAlarm", AdminAlarm); 
		request.setAttribute("adminservice", adminservice); 
		
		request.setAttribute("inspecportfolio", inspecportfolio);
		request.setAttribute("CntPortfolio", CntPortfolio);
		return true;
	}
	
	
}
