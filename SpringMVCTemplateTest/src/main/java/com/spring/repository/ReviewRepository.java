package com.spring.repository;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.model.MovieUser;
import com.spring.model.Review;

@Repository
public class ReviewRepository {

    public void saveReview(Review review) {
    	String sql = "INSERT INTO review (rating, comment, review_date, user_id, movies_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = JDBCConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setDouble(1, review.getRating());
            stmt.setString(2, review.getComment());
            stmt.setTimestamp(3, Timestamp.valueOf(review.getReviewDate()));
            stmt.setInt(4, review.getUserId());
            stmt.setInt(5, review.getMoviesId());
           // stmt.setInt(6, review.getTvshowId());

            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Review> getAllReviews() {
        List<Review> list = new ArrayList<>();
        String sql = """
            SELECT r.*, u.username, u.profilePicUrl 
            FROM review r 
            JOIN user u ON r.user_id = u.id
        """;

        try (Connection conn = JDBCConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Review r = new Review();
                r.setId(rs.getInt("id"));
                r.setRating(rs.getDouble("rating"));
                r.setComment(rs.getString("comment"));
                r.setReviewDate(rs.getTimestamp("review_date").toLocalDateTime());
                r.setUserId(rs.getInt("user_id"));
                r.setMoviesId(rs.getInt("movies_id"));

                MovieUser user = new MovieUser();
                user.setUsername(rs.getString("username"));
                user.setProfilePicUrl(rs.getString("profilePicUrl"));
                r.setUser(user);

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public void deleteReviewById(int id) {
        String sql = "DELETE FROM review WHERE id = ?";

        try (Connection conn = JDBCConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
   
    
    public Review getReviewById(int id) {
        Review review = null;
        try (Connection conn = JDBCConnection.getConnection()) {
            String sql = "SELECT * FROM review WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                review = new Review();
                review.setId(rs.getInt("id"));
                review.setRating(rs.getDouble("rating"));
                review.setComment(rs.getString("comment"));
                review.setReviewDate(rs.getTimestamp("review_date").toLocalDateTime());
                review.setMoviesId(rs.getInt("movies_id"));
                review.setUserId(rs.getInt("user_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return review;
    }
    
    public List<Review> getReviewsByMovieId(int movieId) {
        List<Review> reviewList = new ArrayList<>();
        String sql = """
            SELECT r.*, u.username, u.profilePicUrl 
            FROM review r 
            JOIN user u ON r.user_id = u.id
            WHERE r.movies_id = ?
            ORDER BY r.review_date DESC
        """;

        try (Connection conn = JDBCConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, movieId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setId(rs.getInt("id"));
                review.setRating(rs.getDouble("rating"));
                review.setComment(rs.getString("comment"));
                review.setReviewDate(rs.getTimestamp("review_date").toLocalDateTime());
                review.setMoviesId(rs.getInt("movies_id"));
                review.setUserId(rs.getInt("user_id"));

                MovieUser user = new MovieUser();
                user.setId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setProfilePicUrl(rs.getString("profilePicUrl"));
                review.setUser(user);

                reviewList.add(review);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviewList;
    }
    
}
