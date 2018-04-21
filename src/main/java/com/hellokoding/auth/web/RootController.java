package com.hellokoding.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hellokoding.auth.model.Role;
import com.hellokoding.auth.model.User;
import com.hellokoding.auth.service.SecurityService;
import com.hellokoding.auth.service.UserService;

@Controller
public class RootController {
	
	@Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;
	 
    
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String landing(Model model) {
		String username = securityService.findLoggedInUsername();
		if (username == null) {
			return "redirect:/resources/index.html";
		}

		User loggedUser = userService.findByUsername(username);

		if (loggedUser.getRole().getName().equalsIgnoreCase(Role.EMPLOYEE)) {
			return "redirect:/employee/welcome";
		} else {
			return "redirect:/company/welcome";
		}

	}
    
  
    
}
