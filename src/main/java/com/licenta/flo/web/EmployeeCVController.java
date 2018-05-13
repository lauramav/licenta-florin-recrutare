package com.licenta.flo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.licenta.flo.model.EmployeeCV;
import com.licenta.flo.model.User;
import com.licenta.flo.service.EmployeeCVService;
import com.licenta.flo.service.SecurityServiceImpl;
import com.licenta.flo.service.UserServiceImpl;

@Controller
public class EmployeeCVController {

	@Autowired
	private EmployeeCVService employeeCVService;

	@Autowired
	private UserServiceImpl userServiceImpl;

	@Autowired
	private SecurityServiceImpl securityServiceImpl;

	@RequestMapping(value = "employee/mycvemployee", method = RequestMethod.GET)
	public String createOrEditCV(Model model) {
		EmployeeCV employeeCV = employeeCVService.findByUser(getUser());

		if (employeeCV != null) {
			model.addAttribute("cvForm", employeeCV);
		} else {
			model.addAttribute("cvForm", new EmployeeCV());
		}

		return "/employee/mycvemployee";
	}

	@RequestMapping(value = "employee/mycvemployee", method = RequestMethod.POST)
	public String createOrEditCV(@ModelAttribute("cvForm") EmployeeCV cvForm, BindingResult bindingResult,
			Model model) {
		cvForm.setUser(getUser());
		employeeCVService.save(cvForm);

		return "redirect:/employee/welcome";
	}

	@ModelAttribute("cvForm")
	public EmployeeCV getCvForm() {
		return this.employeeCVService.findByUser(getUser());
	}

	private User getUser() {
		String username = securityServiceImpl.findLoggedInUsername();
		return userServiceImpl.findByUsername(username);
	}

}
