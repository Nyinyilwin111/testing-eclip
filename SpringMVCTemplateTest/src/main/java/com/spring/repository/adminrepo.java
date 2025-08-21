package com.spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.model.Movie;
import com.spring.model.MovieLogin;
import com.spring.model.MovieUser;
import com.spring.model.adminbean;
import com.spring.util.PasswordUtil;

@Repository
public class adminrepo {

    public int insertadmin(adminbean emp) {
        int i = 0;
        Connection con = JDBCConnection.getConnection();
        String sql = "INSERT INTO projectmoviedb1.admin(name, email, password) VALUES (?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getPassword());

            i = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insert into admin error: " + e.getMessage());
        }

        return i;
    }
    

    public int save(Movie movie) {
        // static မဟုတ်တော့ဘူး
        int i = 0;
        Connection con = JDBCConnection.getConnection();
        String sql = "INSERT INTO projectmoviedb1.movies1 (title, filename, file_size, upload_time) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, movie.getTitle());
            ps.setString(2, movie.getFilename());
            ps.setLong(3, movie.getFileSize());
            ps.setTimestamp(4, new java.sql.Timestamp(movie.getUploadTime().getTime()));
            i = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("insert into movies error: " + e.getMessage());
        }

        return i;
    }
    public List<Movie> findAll() {
        List<Movie> movieList = new ArrayList<>();
        Connection con = JDBCConnection.getConnection();
        String sql = "SELECT * FROM projectmoviedb1.movies1";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Movie movie = new Movie();
                movie.setId(rs.getInt("id"));
                movie.setTitle(rs.getString("title"));
                movie.setFilename(rs.getString("filename"));
                movie.setFileSize(rs.getLong("file_size"));
                movie.setUploadTime(rs.getTimestamp("upload_time"));
                movieList.add(movie);
            }

        } catch (SQLException e) {
            System.out.println("findAll movies error: " + e.getMessage());
        }

        return movieList;
    }
    public boolean checkLogin(String email, String password) {
        boolean isValid = false;
        try {
            Connection con = JDBCConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
    
    

    
}

