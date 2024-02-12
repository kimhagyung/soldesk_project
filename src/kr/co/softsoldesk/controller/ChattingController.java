package kr.co.softsoldesk.controller;

import javax.annotation.Resource; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;

@Controller
public class ChattingController {

    @Autowired
    private UserBean loginUserBean;

    @Autowired
    private ProUserBean loginProuserBean;
      
    @GetMapping("/ChattingList")
    public String chattingList(Model model) { 
        return "ChattingList";
    }

    @GetMapping("/chatting")
    public String chat(Model model) {
        if(loginUserBean.isUserLogin()) {
            model.addAttribute("currentUserId", loginUserBean.getUser_id());
        } else if(loginProuserBean.isProuserLogin()) {
            model.addAttribute("currentUserId", loginProuserBean.getPro_id());
        } else {
            model.addAttribute("currentUserId", null);
        }
        
        return "chatting";
    }
}