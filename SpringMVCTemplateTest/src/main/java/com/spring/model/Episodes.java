package com.spring.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Episodes {
	private int episode_id;
	private int duration;
	private String episode_file_url;
	private MultipartFile episodeFile; 
	private String episode_name;
	private int tv_id;
	
	private Tvshow tvshow;
}




