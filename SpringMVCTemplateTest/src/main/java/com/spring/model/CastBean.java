package com.spring.model;





import java.sql.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;



import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CastBean {

	    private int id;
	    
	    @NotEmpty
	    private String name;
	    
	    @NotNull
	   
	    private Date dateOfBirth;
	    
	    @NotEmpty
	    private String nationality;

	
	
}
