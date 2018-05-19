package com.licenta.flo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.licenta.flo.model.CompanyJobs;
import com.licenta.flo.model.User;

public interface CompanyJobsRepositories extends
		JpaRepository<CompanyJobs, Long> {
	CompanyJobs findByTitle(String title);

	CompanyJobs findByUser(User user);

}
