package com.licenta.flo.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.licenta.flo.model.EmployeeCV;

@Controller
public class EmployeeCVController {
	
    @RequestMapping(value = "employee/ui", method = RequestMethod.GET)
    public String createCV(Model model) {
        model.addAttribute("cvForm", new EmployeeCV());

        return "/employee/ui";
    }
    
    
    @RequestMapping(value = "employee/ui", method = RequestMethod.POST)
    public String createCV(@ModelAttribute("cvForm") EmployeeCV cvForm, BindingResult bindingResult, Model model) {
      //  userService.save(userForm, Role.COMPANY);O

        return "redirect:/company/welcome";
    }
    
    @ModelAttribute("cvForm")
    public EmployeeCV getCvForm() {
    	return new EmployeeCV();
    }
    
}
