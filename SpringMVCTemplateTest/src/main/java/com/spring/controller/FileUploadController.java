package com.spring.controller;

import com.spring.Res.Res;
import com.spring.model.FileMetadata;
import com.spring.repository.FileMetadataRepository;
import com.spring.service.DriveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;

@Controller
public class FileUploadController {

    @Autowired
    private DriveService driveService;

    @Autowired
    private FileMetadataRepository fileMetadataRepository;

    // Show upload form page
    @GetMapping("/upload1")
    public String showUploadForm() {
        return "upload";  // Your JSP or HTML upload form name
    }

    // Handle file upload POST request
    @PostMapping("/upload")
    @ResponseBody
    public Res uploadFile(@RequestParam("file") MultipartFile multipartFile) {
        Res res = new Res();

        File tempFile = null;
        try {
            // Convert MultipartFile to java.io.File in temp directory
            tempFile = convertMultiPartToFile(multipartFile);

            // Upload file to Google Drive via DriveService
            Res driveRes = driveService.uploadFileToDrive(tempFile);

            if (driveRes.getStatus() == 200) {
                // Save file metadata in DB
                FileMetadata metadata = new FileMetadata();
                metadata.setFilename(multipartFile.getOriginalFilename());

                // Correctly extract fileId from preview URL
                String fileId = null;
                String url = driveRes.getUrl();
                if (url != null && url.contains("/d/") && url.contains("/preview")) {
                    int start = url.indexOf("/d/") + 3;
                    int end = url.indexOf("/preview");
                    fileId = url.substring(start, end);
                }
                metadata.setFileId(fileId);

                // Save to DB
                fileMetadataRepository.save(metadata);
            }


            return driveRes;

        } catch (Exception e) {
            e.printStackTrace();
            res.setStatus(500);
            res.setMessage("Failed to upload file: " + e.getMessage());
            res.setUrl(null);
            return res;
        } finally {
            // Clean up temp file if exists
            if (tempFile != null && tempFile.exists()) {
                tempFile.delete();
            }
        }
    }

    // Helper method to convert MultipartFile to java.io.File
    private File convertMultiPartToFile(MultipartFile file) throws Exception {
        // Create temp file in the OS temp directory
        File convFile = File.createTempFile("upload-", "-" + file.getOriginalFilename());
        try (FileOutputStream fos = new FileOutputStream(convFile)) {
            fos.write(file.getBytes());
        }
        return convFile;
    }
}
