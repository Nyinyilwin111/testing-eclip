package com.spring.model;

import java.time.LocalDateTime;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Review {

	 private int id;
	 
	 @Min(value = 0, message = "Rating must be at least 0")
	    @Max(value = 5, message = "Rating cannot exceed 5")
	    private double rating;
	 @NotBlank(message = "Comment cannot be empty")
	    private String comment;
	    private LocalDateTime reviewDate;
	    private int userId;
	    private int moviesId;
	   // private int tvshowId;
	    
	    private MovieUser user;
	
}
