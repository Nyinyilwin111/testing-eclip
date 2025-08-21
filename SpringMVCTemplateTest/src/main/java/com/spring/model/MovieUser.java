package com.spring.model;

import java.sql.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class MovieUser {
	private int id;
	@NotBlank
	private String username;
	@NotBlank
	private String email;
	
	// Note: Storing password hashes is good practice, not plain passwords.
	@NotBlank
	private String passwordHash;
	
	// For profile image upload
    private MultipartFile profilePic; // This will be used for file upload (not stored in DB)
    
    
	// Stores the URL or path to the profile picture file
	private String profilePicUrl;
	private String gender;

@NotNull
@Min(13)
@Max(120)
private Integer age;

	private Date createAt;
	
	

}







