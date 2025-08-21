package com.spring.model;

public class FileMetadata {

    private int id;          // corresponds to id column (primary key)
    private String filename; // corresponds to filename column
    private String fileId;   // corresponds to file_id column (Google Drive file ID)

    // Default constructor
    public FileMetadata() {
    }

    // Constructor with fields (optional)
    public FileMetadata(int id, String filename, String fileId) {
        this.id = id;
        this.filename = filename;
        this.fileId = fileId;
    }

    // Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }
}
