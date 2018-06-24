package com.licenta.flo.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin")
public class AdminController {
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginAdmin(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
        	return "redirect:/resources/index.html";

        return "/admin/login";
    }
    
    @RequestMapping(value = "welcome", method = RequestMethod.GET)
    public String welcomeAdmin(Model model) {   	
        return "/admin/welcome";
    } 
}
