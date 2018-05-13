package com.licenta.flo.service;

import com.licenta.flo.model.EmployeeCV;
import com.licenta.flo.model.User;

public interface EmployeeCVService {
	
	void save(EmployeeCV employeeCV);
	
	EmployeeCV findByName(String name);
	
	EmployeeCV findByUser(User user);

}
