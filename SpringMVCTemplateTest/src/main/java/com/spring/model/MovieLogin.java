package com.spring.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MovieLogin {
	private String email;
	private String password;
	private String newPassword;
    private String confirmPassword;
    private String otp;
    private String role; // with getter and setter

}
