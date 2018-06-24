package com.licenta.flo.service;

import java.util.List;

import com.licenta.flo.model.EmployeeCV;
import com.licenta.flo.model.User;

public interface EmployeeCVService {
	
	EmployeeCV findById(Long id);
	
	void save(EmployeeCV employeeCV);
	
	EmployeeCV findByName(String name);
	
	EmployeeCV findByUser(User user);
	
	List<EmployeeCV> findAll();

}
