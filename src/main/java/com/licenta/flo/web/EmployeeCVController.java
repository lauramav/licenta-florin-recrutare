package com.licenta.flo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.licenta.flo.model.EmployeeCV;
import com.licenta.flo.service.EmployeeCVService;

@Controller
public class EmployeeCVController {
	
	@Autowired
	private EmployeeCVService employeeCVService;
	
    @RequestMapping(value = "employee/mycvemployee", method = RequestMethod.GET)
    public String createCV(Model model) {
        model.addAttribute("cvForm", new EmployeeCV());

        return "/employee/mycvemployee";
    }
    
    
    @RequestMapping(value = "employee/mycvemployee", method = RequestMethod.POST)
    public String createCV(@ModelAttribute("cvForm") EmployeeCV cvForm, BindingResult bindingResult, Model model) {
    	employeeCVService.save(cvForm);

        return "redirect:/employee/welcome";
    }
    
    @ModelAttribute("cvForm")
    public EmployeeCV getCvForm() {
    	return new EmployeeCV();
    }
    
}
