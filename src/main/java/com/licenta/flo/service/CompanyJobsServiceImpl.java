package com.licenta.flo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.licenta.flo.model.CompanyJobs;
import com.licenta.flo.model.User;
import com.licenta.flo.repository.CompanyJobsRepositories;

@Service
public class CompanyJobsServiceImpl implements CompanyJobsService {

	@Autowired
	private CompanyJobsRepositories companyJobsRepositories;
	
	
	@Override
	public void save(CompanyJobs companyJobs) {
		companyJobsRepositories.save(companyJobs);
	}
	
	@Override
	public CompanyJobs findById(Long id) {
		return companyJobsRepositories.findById(id);
	}

	@Override
	public CompanyJobs findByTitle(String title) {
		return companyJobsRepositories.findByTitle(title);
	}

	@Override
	public List<CompanyJobs> findByUser(User user) {
		return companyJobsRepositories.findByUser(user);
	}
	
	@Override
	public List<CompanyJobs> findAll() {
		return companyJobsRepositories.findAll();
	}
	
	@Override
	public void delete(Long id) {
		companyJobsRepositories.delete(findById(id));
	}

}
