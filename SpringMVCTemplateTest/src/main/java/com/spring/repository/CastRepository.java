package com.spring.repository;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.spring.model.CastBean;

@Repository
public class CastRepository {

	
	 public int save(CastBean cast) {
		 int i=0;
	        String sql = "INSERT INTO cast (name, dateOfBirth,nationality) VALUES (?, ?,?)";

	        try (Connection conn = JDBCConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            stmt.setString(1, cast.getName());
	         
	            stmt.setDate(2, cast.getDateOfBirth());
	            
	            stmt.setString(3, cast.getNationality());

	            i= stmt.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return i;
	    }
	 
	 public List<CastBean> findAll() {
		    List<CastBean> list = new ArrayList<CastBean>();
		    String sql = "SELECT * FROM cast ";

		    try (Connection conn = JDBCConnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql);
		         ResultSet rs = stmt.executeQuery()) {

		        while (rs.next()) {
		            CastBean cast = new CastBean();
		            cast.setId(rs.getInt("id"));
		            cast.setName(rs.getString("name"));
		            cast.setDateOfBirth(rs.getDate("dateOfBirth"));
		            cast.setNationality(rs.getString("nationality"));
		            list.add(cast);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return list;
		}

		public CastBean findById(int id) {
		    CastBean cast =null;
		    String sql = "SELECT * FROM cast WHERE id = ?";

		    try (Connection conn = JDBCConnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql)) {

		        stmt.setInt(1, id);
		        ResultSet rs = stmt.executeQuery();

		        if (rs.next()) {
		        	cast=new CastBean();
		            cast.setId(rs.getInt("id"));
		            cast.setName(rs.getString("name"));
		            cast.setDateOfBirth(rs.getDate("dateOfBirth"));
		            cast.setNationality(rs.getString("nationality"));
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return cast;
		}

		public int update(CastBean cast) {
			int i=0;
		    String sql = "UPDATE cast SET name = ?, dateOfBirth = ?, nationality = ? WHERE id = ?";

		    try (Connection conn = JDBCConnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql)) {

		    	stmt.setString(1, cast.getName());
		    	stmt.setDate(2, cast.getDateOfBirth());
		    	stmt.setString(3, cast.getNationality());
		    	stmt.setInt(4, cast.getId());
		        i= stmt.executeUpdate();

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return i;
		}

		public int delete(int id) {
			int i=0;
		     String sql = "DELETE FROM cast WHERE id = ?";

		    try (Connection conn = JDBCConnection.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql)) {

		        stmt.setInt(1, id);
		        i= stmt.executeUpdate();

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return i;
		}
	
}
