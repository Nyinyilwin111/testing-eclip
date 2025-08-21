package com.spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.springframework.stereotype.Repository;

import com.spring.model.Payment;

@Repository
public class PaymentRepository {

    public void insertPayment(Payment payment) {
        String sql = "INSERT INTO payment (user_id, package_id, payment_method_id, payment_date, screenshot_path, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = JDBCConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, payment.getUserId());
            ps.setInt(2, payment.getPackageId());
            ps.setInt(3, payment.getPaymentMethodId());
            ps.setDate(4, new java.sql.Date(payment.getPaymentDate().getTime()));
            ps.setString(5, payment.getScreenshot_path());
            ps.setString(6, payment.getStatus());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
