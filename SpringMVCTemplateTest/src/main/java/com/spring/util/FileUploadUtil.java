package com.spring.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	public static String saveFile(MultipartFile file, String directory, Integer maxSizeMB, String[] allowedExts) 
			throws IOException {
		String originalName = file.getOriginalFilename();
		if (originalName == null) return null;
		
		//Sanitize filename
		String sanitized = originalName.replaceAll("[^a-zA-Z0-9\\.\\-_]", "_");
		
		//check allowed extensions
		boolean isAllowed = false;
		for (String ext : allowedExts) {
			if (sanitized.toLowerCase().endsWith(ext.toLowerCase())) {
				isAllowed = true;
				break;
			}
		}
		if (!isAllowed) return null;
		
		// Check file size
		if (maxSizeMB != null) {
			long fileSizeMB = file.getSize() / (1024 * 1024);
			if (fileSizeMB > maxSizeMB) return null;
		}
		
		// Ensure directory exists
		File dir = new File(directory);
		if (!dir.exists()) dir.mkdirs();
		
		// Check for duplicates
		File dest = new File(dir, sanitized);
		/* if (dest.exists()) return null; */
		
		// Save file
		file.transferTo(dest);
		return sanitized;
	}
}
