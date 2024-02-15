package kr.co.softsoldesk.controller;


import java.time.Year;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.beans.EducationBean;
import kr.co.softsoldesk.beans.ExpertBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.service.CareerService;
import kr.co.softsoldesk.service.EducationService;
import kr.co.softsoldesk.service.ProProfileService;
import kr.co.softsoldesk.service.ProUserService;

@Controller
@RequestMapping("/pro")
public class ProProfileController {
   
   @Autowired
   private CareerService careerService;
   
   @Resource(name = "loginProuserBean")
   private ProUserBean loginProuserBean;
   
   @Autowired
   private EducationService educationService;
   
   @Autowired
   private ProProfileService proProfileService;
   
   @Autowired
   private ProUserService proUserService;
   
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
   public String expert(Model model, @RequestParam("id") int id) {
      
      if(loginProuserBean.isProuserLogin() == true) {
         
         String pro_name=proUserService.getProUserName(id);
         System.out.println("pro_name"+pro_name);

         System.out.println("ppppppppppppppppppppppppp:"+pro_name);
         model.addAttribute("pro_name", pro_name);

           model.addAttribute("proUserId", loginProuserBean.getPro_id());
           
           //활동 지역 GetMapping
           String location = proUserService.getActive_location(loginProuserBean.getPro_id());
           
           model.addAttribute("location", location);
           
        // 진행도 가져오기!!!!!!!!!!!!!!!!!!!(실패)
           int progress = proProfileService.getProfile_completion(loginProuserBean.getPro_id());
           model.addAttribute("progress", progress);
   
      }

   
      return "pro/expert";
   }
   
   
   @PostMapping(value = "/expert_introductionModify", consumes = "application/json")
   @ResponseBody
   public String expert_introductionModify(@RequestBody ExpertBean expertBean) {
       int proIdFromClient = loginProuserBean.getPro_id();

       // 해당 pro_id에 대한 레코드가 이미 존재하는지 여부 확인
       boolean recordExists = proProfileService.expertIntroductionExists(proIdFromClient);
       
       System.out.println("exist: " + recordExists);

       // 이미 존재하는 경우 수정, 그렇지 않으면 삽입
       if (recordExists) {
           // 이미 레코드가 존재하면 업데이트 수행
           proProfileService.modifyIntroduction(expertBean.getPro_detailed_introduction(), loginProuserBean.getPro_id());
           
           
       } else {
           // 레코드가 없으면 삽입 수행
          
           if(loginProuserBean.isProuserLogin()==true) {
             
              expertBean.setPro_id(loginProuserBean.getPro_id());
          }
           proProfileService.addExpertInfo(expertBean);
           System.out.println("save");
       }
       
       return "updated successfully!";
   }
   
   //가격 수정
   @PostMapping(value = "/expert_modify", consumes = "application/json")
   @ResponseBody
   public String expert_modify(@RequestBody ExpertBean modifyPriceBean) {
      
      proProfileService.modifyPrice(modifyPriceBean.getPrice(), loginProuserBean.getPro_id());
      
      return "updated money successfully";
   }
   
   //활동 지역 수정
   @PostMapping(value = "/expert_modify2", consumes = "application/json")
   @ResponseBody
   public String expert_modify2(@RequestBody ProUserBean modifyActive_locationBean) {
      
      proUserService.modifyActive_location(modifyActive_locationBean.getActive_location(), loginProuserBean.getPro_id());
      
      return "updated location successfully";
   }
   
   
}