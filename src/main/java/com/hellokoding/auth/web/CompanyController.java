package com.hellokoding.auth.web;

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
@RequestMapping("company")
public class CompanyController {
	
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;    
    
    @RequestMapping(value = "registration", method = RequestMethod.GET)
    public String registrationCompany(Model model) {
        model.addAttribute("userForm", new User());

        return "/company/registration";
    }
    
    
    @RequestMapping(value = "registration", method = RequestMethod.POST)
    public String registrationCompany(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "/company/registration";
        }

        userService.save(userForm, Role.COMPANY);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/company/welcome";
    }
    
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginCompany(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "/company/login";
    }
    
    @RequestMapping(value = "welcome", method = RequestMethod.GET)
    public String welcomeCompany(Model model) {   	
        return "/company/welcome";
    } 
}
