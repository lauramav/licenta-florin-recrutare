package com.licenta.flo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.licenta.flo.model.EmployeeCV;
import com.licenta.flo.repository.EmployeeCVRepositories;

@Service
public class EmployeeCVServiceImpl implements EmployeeCVService{
	
	@Autowired
	private EmployeeCVRepositories employeeCVRepositories;

	@Override
	public void save(EmployeeCV employeeCV) {
		employeeCVRepositories.save(employeeCV);
	}

	@Override
	public EmployeeCV findByName(String name) {
		return employeeCVRepositories.findByName(name);
	}

}
