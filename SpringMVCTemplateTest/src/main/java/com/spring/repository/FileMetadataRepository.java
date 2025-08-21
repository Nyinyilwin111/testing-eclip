package com.spring.repository;

import com.spring.model.FileMetadata;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class FileMetadataRepository {

    // Reuse your existing JDBCConnection.getConnection() method or embed it here if you want
    private Connection getConnection() {
        return JDBCConnection.getConnection();
    }

    // Save metadata (insert)
    public int save(FileMetadata meta) {
        int rowsAffected = 0;
        String sql = "INSERT INTO file_metadata (filename, file_id) VALUES (?, ?)";

        Connection con = getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, meta.getFilename());
            ps.setString(2, meta.getFileId());
            rowsAffected = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("save: " + e.getMessage());
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection in save: " + e.getMessage());
            }
        }
        return rowsAffected;
    }

    // Get all file metadata records
    public List<FileMetadata> findAll() {
        List<FileMetadata> list = new ArrayList<>();
        String sql = "SELECT * FROM file_metadata";

        Connection con = getConnection();
        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                FileMetadata meta = new FileMetadata();
                meta.setId(rs.getInt("id"));
                meta.setFilename(rs.getString("filename"));
                meta.setFileId(rs.getString("file_id"));
                list.add(meta);
            }
        } catch (SQLException e) {
            System.out.println("findAll: " + e.getMessage());  
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection in findAll: " + e.getMessage());
            }
        }

        return list;      
    }

    // Optionally, get by ID (similar to DirectorRepository)
    public FileMetadata findById(int id) {
        FileMetadata meta = null;
        String sql = "SELECT * FROM file_metadata WHERE id = ?";

        Connection con = getConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                meta = new FileMetadata();
                meta.setId(rs.getInt("id"));
                meta.setFilename(rs.getString("filename"));
                meta.setFileId(rs.getString("file_id"));
            }
        } catch (SQLException e) {
            System.out.println("findById: " + e.getMessage());
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection in findById: " + e.getMessage());
            }
        }
        return meta;
    }
}
