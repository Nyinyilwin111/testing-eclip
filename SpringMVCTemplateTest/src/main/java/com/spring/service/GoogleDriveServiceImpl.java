package com.spring.service;



import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;

@Service
public class GoogleDriveServiceImpl {
	
	@Autowired
	private Drive drive;
	
	private static final Map<String, String> folderMap = new HashMap<>();
	
	static {
		folderMap.put("image", "1u_tveU3vGz-qK3zyvw1jAHA_CEX6L3VB"); // replace with real folder ID
        folderMap.put("video", "1kdnm253h2h18BE47xCxaiyKESEGXqkdQ");
        folderMap.put("trailer", "1SrLT7hPFkdb3wlg5mXBhtBMbhdws-s17");
	}
	public String uploadFileToFolder(MultipartFile file, String type) {
		
		if (file.isEmpty()) {
	        throw new IllegalArgumentException("File is empty");
	    }
		
		String folderId = folderMap.get(type);
		System.out.println("Uploading to folder ID: " + folderId);
		
		if (folderId == null) {
            throw new IllegalArgumentException("Invalid folder type: " + type);
        }
		
		try {
            File fileMetadata = new File();
            fileMetadata.setName(file.getOriginalFilename());
            fileMetadata.setParents(java.util.Collections.singletonList(folderId));

            InputStream fileStream = file.getInputStream();
            String originalFileName = file.getOriginalFilename();
            String contentType = file.getContentType();
            
            if (contentType == null || contentType.isBlank()) {
                if (originalFileName != null) {
                    String lower = originalFileName.toLowerCase();
                    if (lower.endsWith(".mkv")) {
                        contentType = "video/x-matroska";
                    } else if (lower.endsWith(".mp4")) {
                        contentType = "video/mp4";
                    } else if (lower.endsWith(".jpg") || lower.endsWith(".jpeg")) {
                        contentType = "image/jpeg";
                    } else if (lower.endsWith(".png")) {
                        contentType = "image/png";
                    } else {
                        contentType = "application/octet-stream"; // generic fallback
                    }
                } else {
                    contentType = "application/octet-stream";
                }
            }
            
            System.out.println("File name: " + file.getOriginalFilename());
            System.out.println("File type: " + file.getContentType());
            
            com.google.api.client.http.AbstractInputStreamContent uploadStream =
                    new com.google.api.client.http.InputStreamContent(
                            file.getContentType(), fileStream);

            File uploadedFile = drive.files().create(fileMetadata, uploadStream)
                    .setFields("id")
                    .execute();

            // Make the file public (optional)
            Permission permission = new Permission()
                    .setType("anyone")
                    .setRole("reader");

            drive.permissions().create(uploadedFile.getId(), permission)
                    .setFields("id")
                    .execute();

            // Return sharable link
			/*
			 * return "https://drive.google.com/uc?id=" + uploadedFile.getId() +
			 * "&export=download";
			 */
            
            // return id of the file
            return uploadedFile.getId();

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
	}
	
}
