package com.service;

import com.model.Employee;

public interface CredentialService {

	public String generatePassword();
	public String generateEmailAddress(String firstName, 
			String lastName, String department);
	public void showCredentials(Employee employee, 
			String email, String password);
	
}
