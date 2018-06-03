package com.licenta.flo.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "company/newjob", method = RequestMethod.GET)
	public String createJob(Model model) {
		model.addAttribute("jobForm", new CompanyJobs());

		return "/company/newjob";
	}

	@RequestMapping(value = "company/newjob", method = RequestMethod.POST)
	public String createJob(CompanyJobs jobForm, BindingResult bindingResult,
			Model model) {
		jobForm.setUser(getUser());
		companyJobsService.save(jobForm);

		return "redirect:/company/newjob";
	}
	
	
	@RequestMapping(value = "company/editjob/{id}", method = RequestMethod.GET)
	public @ResponseBody CompanyJobs editJob(@PathVariable("id") Long id) {
		CompanyJobs companyJob = this.companyJobsService.findById(id);
		companyJob.setUser(null); //to prevent cyclic errors during json marshalling
		return companyJob;
	}

	@RequestMapping(value = "company/editjob", method = RequestMethod.POST)
	public String editJob(CompanyJobs jobForm) {
		jobForm.setUser(getUser());
		companyJobsService.save(jobForm);

		return "redirect:/company/myjobs";
	}
	
	@RequestMapping(value = "company/deletejob", method = RequestMethod.POST)
	public String deleteJob(@RequestParam("id") Long id) {
		companyJobsService.delete(id);

		return "redirect:/company/myjobs";
	}
	
	
	@RequestMapping(value = "company/myjobs", method = RequestMethod.GET)
	public String listJobs(Model model) {
		 List<CompanyJobs> listOfJobs = companyJobsService.findByUser(getUser());
		 
		 List<Map<String, Object>> jobs = new ArrayList<>();
		 
		 for (CompanyJobs companyJob : listOfJobs) {
			 Map<String, Object> job = new HashMap<>();
			 job.put("jobId", companyJob.getId());
			 job.put("jobTitle", companyJob.getTitle());
			 job.put("jobDescription", companyJob.getDescription());
			 jobs.add(job);
		}
		 
		 model.addAttribute("listOfJobs", jobs);
		 
		 return "/company/myjobs";
	}
	
	private User getUser() {
		String username = securityServiceImpl.findLoggedInUsername();
		return userServiceImpl.findByUsername(username);
	}

}
