package com.hellokoding.auth.web;

import com.hellokoding.auth.model.EmployeeCV;
import com.hellokoding.auth.model.Role;
import com.hellokoding.auth.model.User;
import com.hellokoding.auth.service.SecurityService;
import com.hellokoding.auth.service.UserService;
import com.hellokoding.auth.validator.UserValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("employee")
public class EmployeeCVController {
	
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;    
    
    @RequestMapping(value = "ui", method = RequestMethod.GET)
    public String createCV(Model model) {
        model.addAttribute("cvForm", new EmployeeCV());

        return "/employee/ui";
    }
    
    
    @RequestMapping(value = "ui", method = RequestMethod.POST)
    public String registrationCompany(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
      //  userService.save(userForm, Role.COMPANY);

        return "redirect:/company/welcome";
    }
    
}
