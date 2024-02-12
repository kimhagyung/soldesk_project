package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.service.ProUserService;

@Controller
public class QuestionsCotroller {
	
	@Autowired
	ProUserService proUserService;
	
	@GetMapping("/received_quotation")
	public String received_quotation(@RequestParam("reco") String reco, Model model) {
	    List<String> recoProUsers = proUserService.getRecoProUserByName(reco);
	    System.out.println("recoProUsers: " + recoProUsers);
	    model.addAttribute("recoProUsers", recoProUsers);
	    
	    List<Long> proIds = new ArrayList<>();
	    for (String recoProUser : recoProUsers) {
	        ProUserBean proUser = proUserService.getDetailCategoriesByName(recoProUser);
	        proIds.add(Long.valueOf(proUser.getPro_id())); 
		    System.out.println("proUser:"+proUser.getPro_id());
		    
	    }
	    model.addAttribute("proIds", proIds);

	    // 각 proId에 대한 카테고리 조회 및 모델에 추가
	    for (Long proId : proIds) {
	        ProUserBean categories = proUserService.getCategoriesByProId(proId); // proId에 해당하는 카테고리 조회
	        //model.addAttribute("categories_" + proId, categories);
	        System.out.println("categories:"+categories.getActive_detailcategory1());
	        System.out.println("categories:"+categories.getActive_detailcategory2());
	        System.out.println("categories:"+categories.getActive_detailcategory3());
	    }

	    return "received_quotation";
	}
}
