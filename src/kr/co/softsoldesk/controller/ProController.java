package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/pro")
public class ProController {

    @GetMapping("/expert")
    public String redirectToExpertPage() {
        return "pro/expert";
    }

    @GetMapping("/career")
    public String redirectToCareerPage() {
        return "pro/career";
    }

    @GetMapping("/Education")
    public String redirectToEducationPage() {
        return "pro/Education";
    }

    @GetMapping("/Portfolio")
    public String redirectToPortfolioPage() {
        return "pro/Portfolio";
    }
}
