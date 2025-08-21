package com.spring.service;

import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.FileContent;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;
import com.spring.Res.Res;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.util.Collections;

@Service
public class DriveService {

    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
    public Res uploadFileToDrive(java.io.File file) {
        Res res = new Res();
        String folderId = "1cxe4OM1NEXHxN8SQlcgGQv_90rI-SNMe";

        try {
            Drive drive = createDriveService();

            // Auto detect MIME type
            String mimeType = java.nio.file.Files.probeContentType(file.toPath());

            File fileMetadata = new File();
            fileMetadata.setName(file.getName());
            fileMetadata.setParents(Collections.singletonList(folderId));

            FileContent mediaContent = new FileContent(mimeType, file);

            // Upload file
            File uploadedFile = drive.files().create(fileMetadata, mediaContent)
                    .setFields("id")
                    .execute();

            // Set file to public
            Permission publicPermission = new Permission();
            publicPermission.setType("anyone");
            publicPermission.setRole("reader");
            

            drive.permissions().create(uploadedFile.getId(), publicPermission)
                    .setFields("id")
                    .execute();

            // Generate preview/stream URL
            String previewUrl = "https://drive.google.com/file/d/" + uploadedFile.getId() + "/preview";

            // Cleanup
            file.delete();

            res.setStatus(200);
            res.setMessage("File uploaded and shared publicly");
            res.setUrl(previewUrl);

        } catch (IOException | GeneralSecurityException e) {
            e.printStackTrace();
            res.setStatus(500);
            res.setMessage("Upload failed: " + e.getMessage());
        }

        return res;
    }


    private Drive createDriveService() throws IOException, GeneralSecurityException {
        // Load credentials from classpath resource
        InputStream credentialsStream = getClass().getResourceAsStream("/cred.json");
        if (credentialsStream == null) {
            throw new IOException("Resource not found: /cred.json");
        }

        GoogleCredentials credentials = GoogleCredentials.fromStream(credentialsStream)
                .createScoped(Collections.singleton(DriveScopes.DRIVE_FILE));

        return new Drive.Builder(
                GoogleNetHttpTransport.newTrustedTransport(),
                JSON_FACTORY,
                new HttpCredentialsAdapter(credentials))
                .setApplicationName("SpringGoogleDriveUploader")
                .build();
    }
    
    
    public Res deleteFile(String fileId) {
        Res res = new Res();
        
        try {
            Drive drive = createDriveService();
            
            // Delete the file
            drive.files().delete(fileId).execute();
            
            res.setStatus(200);
            res.setMessage("File deleted successfully");
        } catch (IOException | GeneralSecurityException e) {
            e.printStackTrace();
            res.setStatus(500);
            res.setMessage("Delete failed: " + e.getMessage());
        }
        
        return res;
    }
}














