package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.ChatroomBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.ChatService;
import kr.co.softsoldesk.service.ProUserService;

@Controller
public class QuestionsCotroller {
	
	@Autowired
	ProUserService proUserService;
	
	QuestionBean questionBean;
	
	@Autowired
    private UserBean loginUserBean;

    @Autowired
    private ProUserBean loginProuserBean;
    
    @Autowired
    private ChatService chatService;
	
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
	    List<String> cate1List = new ArrayList<>();
	    List<String> cate2List = new ArrayList<>();
	    List<String> cate3List = new ArrayList<>();

	    for (Long proId : proIds) {
	        String cate1 = proUserService.getCategory1(proId);
	        String cate2 = proUserService.getCategory2(proId);
	        String cate3 = proUserService.getCategory3(proId);
	        System.out.println("proId :"+proId);
	        System.out.println("cate1 : " + cate1);
	        System.out.println("cate2 : " + cate2);
	        System.out.println("cate3 : " + cate3);
	        
	        // 리스트에 카테고리 추가
	        cate1List.add(cate1);
	        cate2List.add(cate2);
	        cate3List.add(cate3);
	    } 
	 // 모델에 리스트 추가
	    model.addAttribute("cate1List", cate1List);
	    model.addAttribute("cate2List", cate2List);
	    model.addAttribute("cate3List", cate3List);
	    
	    return "received_quotation";
	}
	
	 @GetMapping("/ChattingList")
	    public String chattingList(Model model) { 
	        return "ChattingList";
	    }
	  
	
	
	 @GetMapping("/chatting")
	 public String chatting(
	         Model model,
	         @RequestParam("pro_id") int proId, // 프로의 ID를 요청 파라미터로 받음
	         @RequestParam("s") int serviceCategoryId) {
	     
	     int userId; // 사용자 ID 초기화
	     if (loginUserBean.isUserLogin()) {
	         userId = loginUserBean.getUser_id(); // 일반 사용자로 로그인한 경우
	     } else if (loginProuserBean.isProuserLogin()) {
	         userId = loginProuserBean.getPro_id(); // 전문가로 로그인한 경우
	     } else {
	         // 로그인하지 않은 경우, 로그인 페이지로 리다이렉트하거나 오류 메시지 표시
	         return "redirect:/login"; // 예시: 로그인 페이지 경로로 리다이렉트
	     }

	     // 채팅방 생성
	     ChatroomBean chatroom = new ChatroomBean();
	     chatroom.setPro_id(proId); // 프로의 ID 설정
	     chatroom.setUser_id(userId); // 사용자의 ID 설정
	     chatService.createChatroom(chatroom); // 채팅방 생성 서비스 호출
	     
	     
	      model.addAttribute("currentUserId", userId); 
	      model.addAttribute("1", questionBean.getCertifaction_exam()); //자격증시험
	      model.addAttribute("2", questionBean.getInterior());  //인테리어
	      model.addAttribute("3", questionBean.getAppliance()); //가전제품
	      model.addAttribute("4", questionBean.getCleaning());  //청소
	      model.addAttribute("5", questionBean.getTranslation());  //번역
	      model.addAttribute("6", questionBean.getDevelopment()); //문서
	      model.addAttribute("7", questionBean.getDocument()); //개발외주
	      model.addAttribute("8", questionBean.getPet()); //반려동

	     return "chatting";
	 }
	 
}
