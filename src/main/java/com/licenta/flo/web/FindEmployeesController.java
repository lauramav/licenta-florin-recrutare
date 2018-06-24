package com.licenta.flo.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.licenta.flo.model.CompanyJobs;
import com.licenta.flo.model.EmployeeCV;
import com.licenta.flo.service.EmployeeCVService;

@Controller
public class FindEmployeesController {

	@Autowired
	private EmployeeCVService employeeCVService;
	
	@RequestMapping(value = "company/hireemployee", method = RequestMethod.GET)
	public String listEmployees(Model model) {
		 List<EmployeeCV> listOfEmployees = employeeCVService.findAll();
		 
		 List<Map<String, Object>> employees = new ArrayList<>();
		 
		 for (EmployeeCV employeeCV : listOfEmployees) {
			 Map<String, Object> employee = new HashMap<>();
			 
			 employee.put("id", employeeCV.getId());
			 employee.put("name", employeeCV.getName());
			 employee.put("surname", employeeCV.getSurname());
			 employee.put("age", employeeCV.getAge());
			 employee.put("experience", employeeCV.getExperience());
			 employee.put("wanted", employeeCV.getWanted());
			 employee.put("education", employeeCV.getEducation());
			 employee.put("current", employeeCV.getCurrent());
			 employee.put("email", employeeCV.getEmail());
			 
			 employees.add(employee);
		}
		 
		 model.addAttribute("employees", employees);
		 
		 return "/company/hireemployee";
	}
	
	@RequestMapping(value = "company/viewemployee/{id}", method = RequestMethod.GET)
	public @ResponseBody EmployeeCV viewEmployee(@PathVariable("id") Long id) {
		EmployeeCV employeeCV = this.employeeCVService.findById(id);
		employeeCV.setUser(null); //to prevent cyclic errors during json marshalling
		return employeeCV;
	}
	
	@RequestMapping(value = "company/contactemployee", method = RequestMethod.POST)
	public String contactEmployee(CompanyJobs jobForm) {
		return "redirect:/company/welcome";
	}
	
	
}
