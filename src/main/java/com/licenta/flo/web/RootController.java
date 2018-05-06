package com.licenta.flo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.licenta.flo.model.Role;
import com.licenta.flo.model.User;
import com.licenta.flo.service.SecurityService;
import com.licenta.flo.service.UserService;

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
