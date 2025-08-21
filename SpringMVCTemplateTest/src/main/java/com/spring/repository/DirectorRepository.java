package com.spring.repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.model.Director;
 
@Service
public class DirectorRepository {
    
    public int addDirector(Director director) {
        int i = 0;
        Connection con = JDBCConnection.getConnection();
        String sql = "INSERT INTO directors (name, date_of_birth, nationality) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, director.getName());
            ps.setDate(2, director.getDateOfBirth());
            ps.setString(3, director.getNationality());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addDirector :" + e.getMessage());
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return i;
    }

    // Get all directors
    public List<Director> getAllDirectors() {
        List<Director> directors = new ArrayList<>();
        Connection con = JDBCConnection.getConnection();
        String sql = "SELECT * FROM directors";
        
        try {
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            
            while (resultSet.next()) {
                Director director = new Director();
                director.setId(resultSet.getInt("id"));
                director.setName(resultSet.getString("name"));
                director.setDateOfBirth(resultSet.getDate("date_of_birth"));
                director.setNationality(resultSet.getString("nationality"));
                directors.add(director);
            }
        } catch (SQLException e) {
            System.out.println("getAllDirectors: " + e.getMessage());
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return directors;
    }

    // Get director by ID
    public Director getDirectorById(int id) {
        Director director = null;
        Connection con = JDBCConnection.getConnection();
        String sql = "SELECT * FROM directors WHERE id = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                director = new Director();
                director.setId(rs.getInt("id"));
                director.setName(rs.getString("name"));
                director.setDateOfBirth(rs.getDate("date_of_birth"));
                director.setNationality(rs.getString("nationality"));
            }
        } catch (SQLException e) {
            System.out.println("getDirectorById: " + e.getMessage());
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
        return director;
    }
}