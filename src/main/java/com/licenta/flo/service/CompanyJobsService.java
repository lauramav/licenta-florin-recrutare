package com.licenta.flo.service;

import java.util.List;

import com.licenta.flo.model.CompanyJobs;
import com.licenta.flo.model.User;

public interface CompanyJobsService {
	void save(CompanyJobs companyJobs);
	
	CompanyJobs findById(Long id);

	CompanyJobs findByTitle(String title);

	List<CompanyJobs> findByUser(User user);
	
	List<CompanyJobs> findAll();

	void delete(Long id);
}
