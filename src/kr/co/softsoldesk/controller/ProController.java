package kr.co.softsoldesk.controller;

import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
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

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.beans.EducationBean;
import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.service.CareerService;
import kr.co.softsoldesk.service.EducationService;
import kr.co.softsoldesk.service.PortfolioService;

@Controller
@RequestMapping("/pro")
public class ProController {

	@Autowired
	private PortfolioService portfolioService;
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;
	
	@Autowired
	private CareerService careerService;
	
	@Autowired
	private EducationService educationService;
	
	@ModelAttribute("totalPeriodOptions")
	public List<Integer> getTotalPeriodOptions() {
	    List<Integer> totalPeriodOptions = new ArrayList<>();
	    for (int i = 1; i <= 30; i++) {
	        totalPeriodOptions.add(i);
	    }
	    return totalPeriodOptions;
	}
	
	@ModelAttribute("yearOptions")
	public List<Integer> getYearOptions() {
	    int currentYear = Year.now().getValue();
	    List<Integer> yearOptions = new ArrayList<>();
	    for (int year = 1980; year <= currentYear; year++) {
	        yearOptions.add(year);
	    }
	    return yearOptions;
	}

	@ModelAttribute("monthOptions")
	public List<Integer> getMonthOptions() {
	    List<Integer> monthOptions = new ArrayList<>();
	    for (int i = 1; i <= 12; i++) {
	        monthOptions.add(i);
	    }
	    return monthOptions;
	}

	
    @GetMapping("/expert")
    public String expert(@RequestParam("id") int id,Model model) {
    	
    	if(loginProuserBean.isProuserLogin() == true) {
			
			List<CareerBean> careerList = careerService.getCareerList(loginProuserBean.getPro_id());
			List<EducationBean> educationList = educationService.getEducationList(loginProuserBean.getPro_id());
			List<PortFolioBean> portfoliList=portfolioService.getPortfolioList(id);
			
			careerList.forEach(this::extractYearAndMonth);
			educationList.forEach(this::extractYearAndMonth2);
			
	        model.addAttribute("careerList", careerList);
	        model.addAttribute("proUserId", loginProuserBean.getPro_id());
	        
	        model.addAttribute("educationList", educationList);
	        //model.addAttribute("proUserId", loginProuserBean.getPro_id());
	        
	        model.addAttribute("portfoliList",portfoliList);
			
			
	        	for (EducationBean education : educationList) 
	        	{ 
	        		System.out.println("학교: " + education.getSchool_name()); 
	        		System.out.println("학과: " + education.getMajor_name()); 
	        		System.out.println("시작 날짜: " + education.getAdmissionYear() + "년" + education.getAdmissionMonth()+ "월"); 
	        		System.out.println("종료 날짜: " + education.getGraduationYear() + "년" + education.getGraduationMonth() + "월"); 
	        		System.out.println("설명: " + education.getEvidence_image()); 
	        		System.out.println("login: " + education.getPro_id()); 
	        		System.out.println("----------"); 
	        		
	        	}
	        	
	        	for(PortFolioBean  port:portfoliList) {
	        		System.out.println("포트폴리오 사진:"+port.getDetailed_images());
	        	}
		}

    	
    	
    	return "pro/expert";
    }
    
    private void extractYearAndMonth(CareerBean career) {
	    // 시작 날짜 정보 가공
	    if (career.getStart_date() != null) {
	        Calendar startCal = Calendar.getInstance();
	        startCal.setTime(career.getStart_date());
	        career.setStartYear(startCal.get(Calendar.YEAR));
	        career.setStartMonth(startCal.get(Calendar.MONTH) + 1); // Calendar의 월은 0부터 시작하므로 +1 처리
	    }

	    // 종료 날짜 정보 가공
	    if (career.getEnd_date() != null) {
	        Calendar endCal = Calendar.getInstance();
	        endCal.setTime(career.getEnd_date());
	        career.setEndYear(endCal.get(Calendar.YEAR));
	        career.setEndMonth(endCal.get(Calendar.MONTH) + 1); // Calendar의 월은 0부터 시작하므로 +1 처리
	    }
	}
	
	private void extractYearAndMonth2(EducationBean education) {
	    // 시작 날짜 정보 가공
	    if (education.getAdmission_date() != null) {
	        Calendar startCal = Calendar.getInstance();
	        startCal.setTime(education.getAdmission_date());
	        education.setAdmissionYear(startCal.get(Calendar.YEAR));
	        education.setAdmissionMonth(startCal.get(Calendar.MONTH) + 1); // Calendar의 월은 0부터 시작하므로 +1 처리
	    }

	    // 종료 날짜 정보 가공
	    if (education.getGraduation_date() != null) {
	        Calendar endCal = Calendar.getInstance();
	        endCal.setTime(education.getGraduation_date());
	        education.setGraduationYear(endCal.get(Calendar.YEAR));
	        education.setGraduationMonth(endCal.get(Calendar.MONTH) + 1); // Calendar의 월은 0부터 시작하므로 +1 처리
	    }
	}

	@GetMapping("/career")
	public String career(Model model, @ModelAttribute("careerForm")CareerBean careerBean) {
		
	
		
		return "pro/career";
	}
    
    @PostMapping("/career_pro") 
	public String career_pro(@ModelAttribute("careerForm")CareerBean careerBean) {
		
		 if(loginProuserBean.isProuserLogin()==true) {

			  careerBean.setPro_id(loginProuserBean.getPro_id());
			  
		  } 
		// updateStartDate 메서드 호출
		    careerBean.updateStartDate();
		    careerBean.updateEndDate();

		
		careerService.addCareerInfo(careerBean);
		
		
		return "/pro/career_success";
	}
    
    @GetMapping("/career_modify")
	public String career_modify(@RequestParam("career_id") int career_id, @ModelAttribute("careerContentModifyBean") CareerBean careerContentModifyBean, Model model) {
		
		model.addAttribute("career_id", career_id);
		
		CareerBean tempCareerBean = careerService.getCareerInfo(career_id);
		
		careerContentModifyBean.setCareer_title(tempCareerBean.getCareer_title());
		careerContentModifyBean.setDetailed_introduction(tempCareerBean.getDetailed_introduction());
		careerContentModifyBean.setTotal_experience_period(tempCareerBean.getTotal_experience_period());
		//careerModifyBean.setStart_date(tempCareerBean.getStart_date());
		careerContentModifyBean.setCareer_id(career_id);
		
		
		return "/pro/career_modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("careerContentModifyBean") CareerBean careerContentModifyBean, Model model) {
		
		// updateStartDate 메서드 호출
		careerContentModifyBean.updateStartDate();
		careerContentModifyBean.updateEndDate();
		careerService.modifyCareer(careerContentModifyBean);
		
		return "/pro/modify_success";
	}
	
	@GetMapping("/career_delete")
	public String career_delete(@RequestParam("career_id") int career_id) {
		
		careerService.deleteCareer(career_id);
		
		return "/pro/career_delete";
	}

	//-----------------------------------------------------------------------학력
	
		@GetMapping("/Education")
		public String Education(@ModelAttribute("educationForm") EducationBean educationBean) {
			
			return "pro/Education";
		}
		
		@PostMapping("/Education_pro")
		public String Education_pro(@ModelAttribute("educationForm") EducationBean postEducationBean, Model model, @RequestParam("eduUpload") List<MultipartFile> eduUpload) {
			
			if(loginProuserBean.isProuserLogin()==true) {

				postEducationBean.setPro_id(loginProuserBean.getPro_id());
				  
			  } 
			postEducationBean.updateAdmissionDate();
			postEducationBean.updateGraduationDate();
			
			educationService.addEducationInfo(postEducationBean, eduUpload);
			
			return "pro/career_success";
		}
		
		@GetMapping("/education_modify")
		public String education_modify(@RequestParam("education_id") int education_id, Model model, @ModelAttribute("educationContentModifyBean") EducationBean educationContentModifyBean) {
			
			model.addAttribute("education_id", education_id);
			List<EducationBean> educationList = educationService.getEducationList(loginProuserBean.getPro_id());
			
			EducationBean tempEducation = educationService.getEducationInfo(education_id);
			
			educationContentModifyBean.setSchool_name(tempEducation.getSchool_name());
			educationContentModifyBean.setMajor_name(tempEducation.getMajor_name());
			educationContentModifyBean.setAdmissionYear(tempEducation.getAdmissionYear());
			educationContentModifyBean.setAdmissionMonth(tempEducation.getAdmissionMonth());
			educationContentModifyBean.setEvidence_image(tempEducation.getEvidence_image());
			educationContentModifyBean.setEducation_id(education_id);
			
			 // 연도 및 월을 모델에 추가
		    model.addAttribute("yearOptions", getYearOptions());
		    model.addAttribute("monthOptions", getMonthOptions());
		    model.addAttribute("educationList", educationList);
			
			return "/pro/education_modify";
		}
		
		@PostMapping("/education_modify_pro")
		public String education_modify_pro(@RequestParam("education_id") int education_id, 
											Model model, @ModelAttribute("educationContentModifyBean") EducationBean educationContentModifyBean, 
											@RequestParam("eduUpload") List<MultipartFile> eduUpload) {
			
			educationContentModifyBean.updateAdmissionDate();
			educationContentModifyBean.updateGraduationDate();
			educationService.modifyEducationInfo(educationContentModifyBean, eduUpload);
			
			
			return "pro/modify_success";
		}
		
		@GetMapping("/education_delete")
		public String education_delete(@RequestParam("education_id") int education_id) {
			
			educationService.deleteEducation(education_id);
			
			return "/pro/career_delete";
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
