package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.service.PortfolioService;

@Controller
@RequestMapping("/pro")
public class ProController {

	@Autowired
	private PortfolioService portfolioService;
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;
	
    @GetMapping("/expert")
    public String expert(@RequestParam("id") int id,Model model) {
    
    	List<PortFolioBean> portfoliList=portfolioService.getPortfolioList(id);
    	model.addAttribute("portfoliList",portfoliList);
    
    	for(PortFolioBean  port:portfoliList) {
    		System.out.println("포트폴리오 사진:"+port.getDetailed_images());
    	}
    	return "pro/expert";
    }

    @GetMapping("/career")
    public String career() {
        return "pro/career";
    }

    @GetMapping("/Education")
    public String Education() {
        return "pro/Education";
    }

    @GetMapping("/Portfolio")
    public String Portfolio(@ModelAttribute("Proportfolio_pro") PortFolioBean Proportfolio_pro, 
    										Model model) {
    	//model.addAttribute("ProPortpolio_pro",ProPortpolio_pro);
    	
    	 
    	model.addAttribute("Proportfolio_pro", Proportfolio_pro);
    	
        //return "pro/Portfolio";
    	return "pro/Portfolio";
    } 
    
    
    @PostMapping("/ProPortfolio")
    public String ProPortfolio(@ModelAttribute("Proportfolio_pro") PortFolioBean Proportfolio_pro, Model model
    		,@RequestParam("uploadFiles") List<MultipartFile> uploadFiles) {
     
    	  	portfolioService.addProPortfolioInfo(Proportfolio_pro, uploadFiles);
		   model.addAttribute("Proportfolio_pro", Proportfolio_pro);
    	
    	return "pro/portfolio_success";
    }
    
    
    @GetMapping("/Portfolio_modify")
	public String Portfolio_modify(@RequestParam("portfolio_id") int portfolio_id, @ModelAttribute("ProportfolioModify") PortFolioBean ProportfolioModify,
							Model model) {
		
    	PortFolioBean PortfolioIdList = portfolioService.getPortfolioIdList(portfolio_id);

    	System.out.println("PortfolioIdList.getDetailed_introduction: "+PortfolioIdList.getDetailed_introduction() );
    	System.out.println("PortfolioIdList.getDetailed_images: "+PortfolioIdList.getDetailed_images() );
    	System.out.println("PortfolioIdList.getLocation_info: "+PortfolioIdList.getLocation_info() );
    	
		model.addAttribute("PortfolioIdList",PortfolioIdList);
		
		return "pro/Portfolio_modify";
		
	}
    
	@PostMapping("/ModifyProPortfolio")
	public String ModifyProPortfolio(@Valid @ModelAttribute("ProportfolioModify") PortFolioBean ProportfolioModify,
								@RequestParam("uploadFiles") List<MultipartFile> uploadFiles,
								 BindingResult result) {
		
		if(result.hasErrors()) {
			return "pro/Portfolio_modify";
		}
		
		try { 
			portfolioService.modifyPortfolioInfo(ProportfolioModify, uploadFiles);
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return "pro/ModifyProPortfolio_success";
	}
    
 } 
