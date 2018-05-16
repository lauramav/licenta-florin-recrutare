package com.licenta.flo.service;

import com.licenta.flo.model.CompanyJobs;
import com.licenta.flo.model.User;

public interface CompanyJobsService {
	void save(CompanyJobs companyJobs);

	CompanyJobs findByTitle(String title);

	CompanyJobs findByUser(User user);
}
