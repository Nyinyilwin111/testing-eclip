package com.spring.repository;

import com.spring.model.Payment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public class AdminPaymentRepo {
	
	public List<Payment> getAllPayments() {
	    List<Payment> list = new ArrayList<>();
	    String sql = "SELECT * FROM payment";

	    try (Connection con = JDBCConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Payment p = new Payment();
	            p.setId(rs.getInt("id"));
	            p.setUserId(rs.getInt("user_id"));
	            p.setPackageId(rs.getInt("package_id"));
	            p.setPaymentMethodId(rs.getInt("payment_method_id"));
	            p.setPaymentDate(rs.getDate("payment_date"));
	            p.setScreenshot_path(rs.getString("screenshot_path"));
	            p.setStatus(rs.getString("status"));
	            list.add(p);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	public void updatePaymentStatus(int paymentId, String status) {
	    String sql = "UPDATE payment SET status = ? WHERE id = ?";
	    try (Connection con = JDBCConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setString(1, status);
	        ps.setInt(2, paymentId);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public Payment getPaymentById(int id) {
	    String sql = "SELECT * FROM payment WHERE id = ?";
	    try (Connection con = JDBCConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            Payment p = new Payment();
	            p.setId(rs.getInt("id"));
	            p.setUserId(rs.getInt("user_id"));
	            p.setPackageId(rs.getInt("package_id"));
	            p.setPaymentMethodId(rs.getInt("payment_method_id"));
	            p.setPaymentDate(rs.getDate("payment_date"));
	            p.setScreenshot_path(rs.getString("screenshot_path"));
	            p.setStatus(rs.getString("status"));
	            return p;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	public void updatePayment(Payment payment) {
	    String sql = "UPDATE payment SET user_id=?, package_id=?, payment_method_id=?, payment_date=?, screenshot_path=?, status=? WHERE id=?";
	    try (Connection con = JDBCConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, payment.getUserId());
	        ps.setInt(2, payment.getPackageId());
	        ps.setInt(3, payment.getPaymentMethodId());
	        ps.setDate(4, new java.sql.Date(payment.getPaymentDate().getTime()));
	        ps.setString(5, payment.getScreenshot_path());
	        ps.setString(6, payment.getStatus());
	        ps.setInt(7, payment.getId());
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	public void deletePayment(int id) {
	    String sql = "DELETE FROM payment WHERE id = ?";
	    try (Connection con = JDBCConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, id);
	        ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}



}
