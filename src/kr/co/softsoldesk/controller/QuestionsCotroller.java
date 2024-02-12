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
	    String[] proNamesArray = proUserService.getRecoProUserByName(reco).toArray(new String[0]);
	    String proNames = "'" + String.join("','", proNamesArray) + "'";
	    
	    List<ProUserBean> detailCategories = proUserService.getDetailCategoriesByName(proNames);
	    
	    model.addAttribute("detailCategories", detailCategories);
	    
	    return "/received_quotation";
	}


}
