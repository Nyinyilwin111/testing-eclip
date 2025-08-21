package com.spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.springframework.stereotype.Repository;

import com.spring.model.Subscription;

@Repository
public class SubscriptionRepo {

    public void insertSubscription(Subscription sub) {
        String sql = "INSERT INTO subscription (user_id, package_id, start_date, end_date) VALUES (?, ?, ?, ?)";
        try (Connection con = JDBCConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, sub.getUserId());
            ps.setInt(2, sub.getPackageId());
            ps.setDate(3, new java.sql.Date(sub.getStartDate().getTime()));
            ps.setDate(4, new java.sql.Date(sub.getEndDate().getTime()));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
