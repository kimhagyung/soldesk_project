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

import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;

	@GetMapping("/ReviewWrite")
	public String reviewWrite(@ModelAttribute("writeReviewBean") ReviewBean writeReviewBean, Model model) {
		
		//@RequestParam(name="pro_id") int pro_id 추가
		
		//(프로_프로필)서비스 서비스 = new (프로_프로필)서비스;
		//(프로_프로필)빈 빈 = 서비스.getPro_id(pro_id);
		//model.addAttribute("빈", 빈);
		//jsp에서 ${빈.필요한 데이터} 형태
		
		model.addAttribute("writeReviewBean", writeReviewBean);
		
		return "review/ReviewWrite";
	}
	
	@PostMapping("/ReviewWrite_pro")
	public String reviewWrite_pro(@Valid @ModelAttribute("writeReviewBean") ReviewBean writeReviewBean, BindingResult result,
			@RequestParam("uploadFiles") List<MultipartFile> uploadFiles) {
		
		if(result.hasErrors()) {
			return "review/ReviewWrite";
		}
		
		reviewService.addReviewInfo(writeReviewBean, uploadFiles);
		
		return "review/ReviewWrite_success";
	}
	
	@GetMapping("/Review")
	public String Review(@RequestParam("pro_id") int pro_id, Model model) {
		
		List<ReviewBean> reviewList = reviewService.getAllReviewList(pro_id);
		
		int reviewCnt = reviewService.getReviewCnt(pro_id);
		
		float reviewAvg = reviewService.getAvgReview(pro_id);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewCnt", reviewCnt);
		model.addAttribute("reviewAvg", reviewAvg);
		model.addAttribute("loginUserBean", loginUserBean);
		
		return "review/Review";
	}
}