package com.licenta.flo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.licenta.flo.model.CompanyJobs;
import com.licenta.flo.model.User;
import com.licenta.flo.service.CompanyJobsService;
import com.licenta.flo.service.SecurityServiceImpl;
import com.licenta.flo.service.UserServiceImpl;

@Controller
public class CompanyJobsController {
	
	@Autowired
	private CompanyJobsService companyJobsService;

	@Autowired
	private UserServiceImpl userServiceImpl;

	@Autowired
	private SecurityServiceImpl securityServiceImpl;

	@RequestMapping(value = "company/myjobscompany", method = RequestMethod.GET)
	public String createOrEditJob(Model model) {
		CompanyJobs companyJobs = companyJobsService.findByUser(getUser());

		if (companyJobs != null) {
			model.addAttribute("jobForm", companyJobs);
		} else {
			model.addAttribute("jobForm", new CompanyJobs());
		}

		return "/company/myjobscompany";
	}

	@RequestMapping(value = "company/myjobscompany", method = RequestMethod.POST)
	public String createOrEditCV(@ModelAttribute("cvForm") CompanyJobs jobForm, BindingResult bindingResult,
			Model model) {
		jobForm.setUser(getUser());
		companyJobsService.save(jobForm);
		
		return "redirect:/company/myjobscompany";
	}

	@ModelAttribute("JobForm")
	public CompanyJobs getJobForm() {
		return this.companyJobsService.findByUser(getUser());
	}

	private User getUser() {
		String username = securityServiceImpl.findLoggedInUsername();
		return userServiceImpl.findByUsername(username);
	}

}
