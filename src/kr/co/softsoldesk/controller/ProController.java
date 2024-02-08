package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String expert() {
      	
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
    	
    	
    	String aaa = "aaaaaa";
    	Proportfolio_pro.setTest("ddddd");
    	model.addAttribute("aaa", aaa);
    	model.addAttribute("Proportfolio_pro", Proportfolio_pro);
    	
        //return "pro/Portfolio";
    	return "pro/Portfolio";
    }
    /*
    @PostMapping("/ProPortfolio1")
    public String ProPortfolio(@ModelAttribute("Proportfolio_pro") PortFolioBean Proportfolio_pro,
    								@RequestParam("uploadFiles") List<MultipartFile> uploadFiles,
    								Model model) {
    
    	 System.out.println("11111: "+Proportfolio_pro.getTest());
    	
			portfolioService.addProPortfolioInfo(Proportfolio_pro, uploadFiles);
		   
		    System.out.println("프로: " + loginProuserBean.getPro_id()); 
		    System.out.println("이미지: " + Proportfolio_pro.getDetailed_images()); 
		    System.out.println("상세소개: " + Proportfolio_pro.getDetailed_introduction()); 
		    System.out.println("지역" + Proportfolio_pro.getLocation_info()); 
		    System.out.println("작업기간: " + Proportfolio_pro.getWork_period());  
		 
		   model.addAttribute("Proportfolio_pro", Proportfolio_pro);
    	
    	return "pro/portfolio_success";
    }
 */
    @PostMapping("/ProPortfolio")
    public String ProPortfolio(@ModelAttribute("Proportfolio_pro") PortFolioBean Proportfolio_pro, Model model
    		,@RequestParam("uploadFiles") List<MultipartFile> uploadFiles) {
    
    	 System.out.println("11111: "+Proportfolio_pro.getTest());
    	
			//portfolioService.addProPortfolioInfo(Proportfolio_pro, uploadFiles);
    	  	portfolioService.addProPortfolioInfo(Proportfolio_pro, uploadFiles);
		   
		    System.out.println("프로: " + loginProuserBean.getPro_id()); 
		    System.out.println("이미지: " + Proportfolio_pro.getDetailed_images()); 
		    System.out.println("상세소개: " + Proportfolio_pro.getDetailed_introduction()); 
		    System.out.println("지역" + Proportfolio_pro.getLocation_info()); 
		    System.out.println("작업기간: " + Proportfolio_pro.getWork_period());  
		    System.out.println("서비스기간: " + Proportfolio_pro.getService_type());  
		 
		   model.addAttribute("Proportfolio_pro", Proportfolio_pro);
    	
    	return "pro/portfolio_success";
    }
 } 
