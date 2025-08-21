package com.spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.model.Package;

@Repository
public class AdminRepoPackage {
	
	public int insertnewPackage(Package pkg) {
	    int i = 0;
	    Connection con = JDBCConnection.getConnection();

	    String sql = "INSERT INTO subscription_packages(name, description, price, duration_in_days) VALUES (?, ?, ?, ?)";

	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, pkg.getName());
	        ps.setString(2, pkg.getDescription());
	        ps.setDouble(3, pkg.getPrice());
	        ps.setInt(4, pkg.getDuration_in_days());

	        i = ps.executeUpdate();

	    } catch (SQLException e) {
	        System.out.println("insert package error: " + e.getMessage());
	    }

	    return i;
	}

	 public List<Package> getAllPackages() {
         List<Package> packages = new ArrayList<>();
         String sql = "SELECT * FROM subscription_packages";
         Connection con = JDBCConnection.getConnection();
         try {
            
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery();

             while (rs.next()) {
                 Package sp = new Package();
                 sp.setId(rs.getInt("id"));
                 sp.setName(rs.getString("name"));
                 sp.setDescription(rs.getString("description"));
                 sp.setPrice(rs.getDouble("price"));
                 sp.setDuration_in_days(rs.getInt("duration_in_days"));
                 packages.add(sp);
             }
         } catch (Exception e) {
         	 System.out.println("getallpackages error: " + e.getMessage());
         }

         return packages;
     }
	 
	 public int updatePackage(Package pkg) {
		    int i = 0;
		    String sql = "UPDATE subscription_packages SET name = ?, description = ?, price = ?, duration_in_days = ? WHERE id = ?";
		    Connection con = JDBCConnection.getConnection();

		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setString(1, pkg.getName());
		        ps.setString(2, pkg.getDescription());
		        ps.setDouble(3, pkg.getPrice());
		        ps.setInt(4, pkg.getDuration_in_days());
		        ps.setInt(5, pkg.getId());

		        i = ps.executeUpdate();
		    } catch (SQLException e) {
		        System.out.println("update package error: " + e.getMessage());
		    }

		    return i;
		}
	 
	 public Package getPackageById(int id) {
		    Package pkg = null;
		    String sql = "SELECT * FROM subscription_packages WHERE id = ?";
		    Connection con = JDBCConnection.getConnection();

		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            pkg = new Package();
		            pkg.setId(rs.getInt("id"));
		            pkg.setName(rs.getString("name"));
		            pkg.setDescription(rs.getString("description"));
		            pkg.setPrice(rs.getDouble("price"));
		            pkg.setDuration_in_days(rs.getInt("duration_in_days"));
		        }
		    } catch (SQLException e) {
		        System.out.println("get package by id error: " + e.getMessage());
		    }

		    return pkg;
		}
	 
	 public int deletePackageById(int id) {
		    int i = 0;
		    String sql = "DELETE FROM subscription_packages WHERE id = ?";
		    Connection con = JDBCConnection.getConnection();

		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, id);
		        i = ps.executeUpdate();
		    } catch (SQLException e) {
		        System.out.println("delete package error: " + e.getMessage());
		    }

		    return i;
		}

}
