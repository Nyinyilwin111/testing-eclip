package com.spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.model.Package;
@Repository
public class PackageRepo {
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
	 
	 public Package getPackageById(int id) {
		    Package pkg = null;
		    String sql = "SELECT * FROM subscription_packages WHERE id = ?";
		    try (Connection con = JDBCConnection.getConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {
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
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return pkg;
		}

	 
 }

