package com.spring.model;

import java.sql.Date;
import java.time.Year;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Movies {
	
	private int movie_id;
	private String title;
	private Year release_year;
	private String overview;
	
	// for poster
	private String poster_url;
	private MultipartFile poster;// This will be used for file upload (not stored in DB)   
	
	// for movie file
	private String movie_file_url;
	private MultipartFile movieFile;
	
	
	private Date upload_date;
	private Integer duration_minutes = 0; // default at 0
	private Integer restriced_age;
	
	private Integer director_id;
	private Integer admin_id;
	
	
	// for trailer
	private String trailer_url;
	private MultipartFile trailerFile;
	
	private Double rating;
	private String type;
}

