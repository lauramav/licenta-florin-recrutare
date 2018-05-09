package com.licenta.flo.service;

import com.licenta.flo.model.EmployeeCV;

public interface EmployeeCVService {
	
	void save(EmployeeCV employeeCV);
	
	EmployeeCV findByName(String name);

}
