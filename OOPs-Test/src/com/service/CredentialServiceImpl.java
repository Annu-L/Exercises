package com.service;

import java.util.Random;

import com.model.Employee;

public class CredentialServiceImpl implements CredentialService {

	@Override
	public String generatePassword() {
		Random random = new Random();
		String number = "0123456789";
		String capitalLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String smallLetters = "abcdefghijklmnopqrstuvwxyz";
		String specialCharacters = "!@#$%^&*_";
		char number1;
		char capitals;
		char smalls;
		char specialChars = '!';
		String generatedPassword = "";
		for (int i = 0; i < 2; i++) {
			number1 = number.charAt(random.nextInt(number.length()));
			generatedPassword += number1;
		}
		for (int i = 0; i < 3; i++) {
			capitals = capitalLetters.charAt(random.nextInt(capitalLetters.length()));
			generatedPassword += capitals;
		}
		for (int i = 0; i < 2; i++) {
			smalls = smallLetters.charAt(random.nextInt(smallLetters.length()));
			generatedPassword += smalls;
		}
		for (int i = 0; i < 2; i++) {
			specialChars = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
			generatedPassword += specialChars;
		}
		
		return generatedPassword;
	}

	@Override
	public String generateEmailAddress(String firstName, String lastName, String department) {
		
		return firstName+lastName+"@"+department+".gl.com";
	}

	@Override
	public void showCredentials(Employee employee, String email, String password) {
		
		System.out.println("Dear "+ employee.getFirstName()+" your generated credentials are as follows ");
		System.out.println("Email ---> " + email);
		System.out.println("Password ---> " + password);
	}
	
	

}
