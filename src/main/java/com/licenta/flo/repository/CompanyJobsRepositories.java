package com.licenta.flo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.licenta.flo.model.CompanyJobs;
import com.licenta.flo.model.User;

public interface CompanyJobsRepositories extends
		JpaRepository<CompanyJobs, Long> {
	CompanyJobs findByTitle(String title);

	List<CompanyJobs> findByUser(User user);

}
