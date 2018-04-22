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
@RequestMapping("employee")
public class EmployeeController {
	
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "/employee/registration";
    }

    @RequestMapping(value = "registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm, Role.EMPLOYEE);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/employee/welcome";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
        	return "redirect:/resources/index.html";

        return "/employee/login";
    }
    
  
    @RequestMapping(value = {"welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {   	
        return "/employee/welcome";
    }
    
}