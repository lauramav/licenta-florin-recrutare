package com.licenta.flo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.licenta.flo.model.EmployeeCV;
import com.licenta.flo.model.User;

public interface EmployeeCVRepositories extends JpaRepository<EmployeeCV, Long> {
	EmployeeCV findById(Long id);
	
	EmployeeCV findByName(String name);
	
	EmployeeCV findByUser(User user);
	
	List<EmployeeCV> findAll();
}
