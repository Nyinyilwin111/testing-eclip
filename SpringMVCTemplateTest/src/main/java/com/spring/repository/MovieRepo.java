package com.spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Year;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;

import com.spring.model.Cast;
import com.spring.model.Episodes;
import com.spring.model.Genre;
import com.spring.model.GenreType;
import com.spring.model.Movie;
import com.spring.model.MovieLogin;
import com.spring.model.MovieUser;
import com.spring.model.Movies;
import com.spring.model.Tvshow;
import com.spring.model.adminbean;
import com.spring.util.PasswordUtil;


@Repository
public class MovieRepo {
	public int insertUser(MovieUser user) {
		int i = 0;
	
		Connection con = JDBCConnection.getConnection();
		String sql = "INSERT INTO user (username, email, password_hash, profilePicUrl, gender, age, createAt) VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPasswordHash());
			ps.setString(4, user.getProfilePicUrl());
			ps.setString(5, user.getGender());
			ps.setInt(6, user.getAge());
			  ps.setDate(7, new java.sql.Date(user.getCreateAt().getTime()));
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insert user: " + e.getMessage());
		}
		
		return i;
	}
	

public MovieUser checkLogin(MovieLogin loginUser) {
		
		MovieUser user = null;
		
		Connection con = JDBCConnection.getConnection();
		String sql = "select * from user where email = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginUser.getEmail());
			   
			ResultSet rs =  ps.executeQuery();
			if(rs.next()) {
				
				String storedHashedPassword = rs.getString("password_hash");
				
				//Check password using BCrypt
				if (PasswordUtil.checkPassword(loginUser.getPassword(), storedHashedPassword)) {
					user = new MovieUser();
					user.setId(rs.getInt("id"));
		            user.setEmail(rs.getString("email"));
		            user.setUsername(rs.getString("username"));
		            user.setPasswordHash(storedHashedPassword);
		            user.setGender(rs.getString("gender"));
		            user.setProfilePicUrl(rs.getString("profilePicUrl"));
		            user.setCreateAt(rs.getDate("createAt"));
		            user.setAge(rs.getInt("age"));
				}
					
			}
			
		} catch (SQLException e) {
			System.out.println("Login error: " + e.getMessage());
		}
		
		return user;	
	}

	//Find user by email
	public MovieUser findUserByEmail(String email) {
	 MovieUser user = null;
	 Connection con = JDBCConnection.getConnection();
	 String sql = "SELECT * FROM user WHERE email = ?";
	 try {
	     PreparedStatement ps = con.prepareStatement(sql);
	     ps.setString(1, email);
	     ResultSet rs = ps.executeQuery();
	     if (rs.next()) {
	         user = new MovieUser();
	         user.setId(rs.getInt("id"));
	         user.setEmail(rs.getString("email"));
	         user.setUsername(rs.getString("username"));
	         user.setPasswordHash(rs.getString("password_hash"));
	         user.setGender(rs.getString("gender"));
	         user.setAge(rs.getInt("age"));
	         user.setCreateAt(rs.getDate("createAt"));
	         user.setProfilePicUrl(rs.getString("profilePicUrl"));
	     }
	 } catch (SQLException e) {
	     System.out.println("Find user error: " + e.getMessage());
	 }
	 return user;
	}
	
	public boolean updatePssword(String email, String newHashedPassword) {
		Connection con = JDBCConnection.getConnection();
	    String sql = "UPDATE user SET password_hash = ? WHERE email = ?";
	    
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, newHashedPassword);
	        ps.setString(2, email);
	        int rowsUpdated = ps.executeUpdate();
	        return rowsUpdated > 0;
	    } catch (SQLException e) {
	        System.out.println("Update password error: " + e.getMessage());
	    }
	    return false;
	}
	
	
	public boolean isEmailExists1(String email) {
		boolean exists = false;
	    Connection con = JDBCConnection.getConnection();
	    String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
	    
	    try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				exists = count > 0;
			}
		} catch (SQLException e) {
			System.out.println("Check email exists error: " + e.getMessage());
		}
	    return exists;
	}
	public int updateUser(MovieUser user) {
	    int i = 0;
	    Connection con = JDBCConnection.getConnection();

	    // ✅ Correct SQL syntax — no semicolon after table name
	    String sql = "UPDATE user SET username = ?, email = ?, gender = ?, age = ?, profilePicUrl = ? WHERE id = ?";

	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, user.getUsername());
	        ps.setString(2, user.getEmail());
	        ps.setString(3, user.getGender());
	        ps.setInt(4, user.getAge());
	        ps.setString(5, user.getProfilePicUrl());
	        ps.setInt(6, user.getId());

	        i = ps.executeUpdate();

	    } catch (SQLException e) {
	        System.out.println("update employee: " + e.getMessage());
	    }

	    return i;
	}

	
	public MovieUser getUserById(int id) {
	    String sql = "SELECT * FROM user WHERE id = ?";
	    try (Connection conn = JDBCConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            MovieUser user = new MovieUser();
	            user.setId(rs.getInt("id"));
	            user.setUsername(rs.getString("username"));
	            user.setEmail(rs.getString("email"));
	            user.setGender(rs.getString("gender"));
	            user.setAge(rs.getInt("age"));
	            user.setProfilePicUrl(rs.getString("profilePicUrl"));
	            user.setCreateAt(rs.getDate("createAt"));
	            // Do not set passwordHash unless needed
	            return user;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	
	
	
	
	public boolean updatePassword(String email, String newHashedPassword) {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = JDBCConnection.getConnection();
            String sql = "UPDATE user SET password_hash = ? WHERE email = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, newHashedPassword);
            ps.setString(2, email);
            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("Update password error: " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public boolean isEmailExists(String email) {
        boolean exists = false;
        Connection con = JDBCConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM user WHERE email = ?";
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                exists = count > 0;
            }
        } catch (SQLException e) {
            System.out.println("Check email exists error: " + e.getMessage());
        }
        return exists;
    }
    public adminbean checkAdminLogin(String email, String rawPassword) {
        try (Connection con = JDBCConnection.getConnection()) {
            String sql = "SELECT * FROM admin WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");

                // Compare using BCrypt
                if (BCrypt.checkpw(rawPassword, storedHashedPassword)) {
                    adminbean admin = new adminbean();
                    admin.setId(rs.getInt("id"));
                    admin.setName(rs.getString("name"));
                    admin.setEmail(rs.getString("email"));
                    admin.setPassword(storedHashedPassword); // store hashed password
                    return admin;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public adminbean findAdminByEmail(String email) {
        try (Connection con = JDBCConnection.getConnection()) {
            String sql = "SELECT * FROM admin WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                adminbean admin = new adminbean();
                admin.setId(rs.getInt("id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password")); // hashed
                return admin;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    
	
	

	// Injected instance
		

		
		public int insertMovie(Movies movie) {
			int i = 0;
		
			Connection con = JDBCConnection.getConnection();
			String sql = "INSERT INTO movies (title, release_year, overview, poster_url, movie_file_url, upload_date, duration_minutes, restriced_age, director_id, admin_id, trailer_url, rating, type) " +
		             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, movie.getTitle());
				ps.setInt(2, movie.getRelease_year().getValue());
				ps.setString(3, movie.getOverview());
				ps.setString(4, movie.getPoster_url());
				ps.setString(5, movie.getMovie_file_url());
				ps.setDate(6, movie.getUpload_date());
				ps.setInt(7, movie.getDuration_minutes());
				ps.setInt(8, movie.getRestriced_age());
				ps.setInt(9, movie.getDirector_id());
				ps.setInt(10, movie.getAdmin_id());
				ps.setString(11, movie.getTrailer_url());
				ps.setDouble(12, movie.getRating());
				ps.setString(13, movie.getType());
				i = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("insert movie: " + e.getMessage());
			}
			
			return i;
		}
		
		//for tvshow
		public int insertTv(Tvshow tv) {
			int i = 0;
		
			Connection con = JDBCConnection.getConnection();
			String sql = "INSERT INTO tvshow (title, release_year, overview, poster_url, upload_date, restricted_age, trailer_url,rating, type, director_id, admin_id)" +
		             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, tv.getTitle());
				ps.setInt(2, tv.getRelease_year().getValue());
				ps.setString(3, tv.getOverview());
				ps.setString(4, tv.getPoster_url());
				ps.setDate(5, tv.getUpload_date());
				ps.setInt(6, tv.getRestricted_age());
				ps.setString(7, tv.getTrailer_url());
				ps.setDouble(8, tv.getRating());
				ps.setString(9, tv.getType());
				ps.setInt(10, tv.getDirector_id());
				ps.setInt(11, tv.getAdmin_id());
				i = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("insert Tvshow: " + e.getMessage());
			}
			
			return i;
		}
		
		//for episode 
		public int insertEpisode(Episodes episodes) {
			int i = 0;
		
			Connection con = JDBCConnection.getConnection();
			String sql = "INSERT INTO episodes (duration, episode_file_url, episode_name, tv_id)" +
		             "VALUES (?, ?, ?, ?)";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, episodes.getDuration());
				ps.setString(2, episodes.getEpisode_file_url());
				ps.setString(3, episodes.getEpisode_name());
				ps.setInt(4, episodes.getTv_id());
				i = ps.executeUpdate();
				
			} catch (SQLException e) {
				System.out.println("insert episodes: " + e.getMessage());
			}
			
			return i;
		}
		
		public List<Movies> getAllMovies() {
			List<Movies> list = new ArrayList<>();
			Connection con = JDBCConnection.getConnection();
			String sql = "SELECT * FROM movies;";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Movies movie = new Movies();
					movie.setMovie_id(rs.getInt("id"));
		            movie.setTitle(rs.getString("title"));
		            movie.setRelease_year(Year.of(rs.getInt("release_year")));
		            movie.setOverview(rs.getString("overview"));
		            movie.setPoster_url(rs.getString("poster_url"));
		            movie.setMovie_file_url(rs.getString("movie_file_url"));
		            movie.setUpload_date(rs.getDate("upload_date"));
		            movie.setDuration_minutes(rs.getInt("duration_minutes"));
		            movie.setRestriced_age(rs.getInt("restriced_age"));
		            movie.setDirector_id(rs.getInt("director_id"));
		            movie.setAdmin_id(rs.getInt("admin_id"));
		            movie.setTrailer_url(rs.getString("trailer_url"));
		            movie.setRating(rs.getDouble("rating"));
		            movie.setType(rs.getString("type"));
		            list.add(movie);
				}
			} catch (SQLException e) {
				System.out.println("getAllMovies error: " + e.getMessage());
			}
			
			return list;
		}
		
		public List<Tvshow> getTvshows() {
			List<Tvshow> list = new ArrayList<>();
			Connection con = JDBCConnection.getConnection();
			String sql = "SELECT * FROM tvshow";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Tvshow tv = new Tvshow();
					tv.setTv_id(rs.getInt("tv_id"));
	                tv.setTitle(rs.getString("title"));
	                tv.setRelease_year(Year.of(rs.getInt("release_year")));
	                tv.setOverview(rs.getString("overview"));
	                tv.setPoster_url(rs.getString("poster_url"));
	                tv.setUpload_date(rs.getDate("upload_date"));
	                tv.setRestricted_age(rs.getInt("restricted_age"));
	                tv.setTrailer_url(rs.getString("trailer_url"));
	                tv.setRating(rs.getDouble("rating"));
	                tv.setType(rs.getString("type"));
	                tv.setDirector_id(rs.getInt("director_id"));
	                tv.setAdmin_id(rs.getInt("admin_id"));
		            list.add(tv);
				}
			} catch (SQLException e) {
				System.out.println("get all tv error: " + e.getMessage());
			}
			
			return list;
		}
		
		
		public Movies getMovieById(int id) {
		    Movies movie = null;
		    Connection con = JDBCConnection.getConnection();
		    String sql = "SELECT * FROM movies WHERE id = ?";

		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            movie = new Movies();
		            movie.setMovie_id(rs.getInt("id"));
		            movie.setTitle(rs.getString("title"));
		            movie.setRelease_year(Year.of(rs.getInt("release_year")));
		            movie.setOverview(rs.getString("overview"));
		            movie.setPoster_url(rs.getString("poster_url"));
		            movie.setMovie_file_url(rs.getString("movie_file_url"));
		            movie.setUpload_date(rs.getDate("upload_date"));
		            movie.setDuration_minutes(rs.getInt("duration_minutes"));
		            movie.setRestriced_age(rs.getInt("restriced_age"));
		            movie.setDirector_id(rs.getInt("director_id"));
		            movie.setAdmin_id(rs.getInt("admin_id"));
		            movie.setTrailer_url(rs.getString("trailer_url"));
		            movie.setRating(rs.getDouble("rating"));
		            movie.setType(rs.getString("type"));
		            // Optional: Add cast or description if your table includes those
		        }

		    } catch (SQLException e) {
		        System.out.println("getMovieById error: " + e.getMessage());
		    }

		    return movie;
		}
		
		// for editing tv shows with episdes
		public Tvshow getTvShowByIdforEditing(int id) {
			Tvshow tvshow = null;
		    Connection con = JDBCConnection.getConnection();

		    String sql = "select * from tvshow WHERE tv_id = ?";

		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
	                tvshow = new Tvshow();
	                tvshow.setTv_id(rs.getInt("tv_id"));
	                tvshow.setTitle(rs.getString("title"));
	                tvshow.setRelease_year(Year.of(rs.getInt("release_year")));
	                tvshow.setOverview(rs.getString("overview"));
	                tvshow.setPoster_url(rs.getString("poster_url"));
	                tvshow.setUpload_date(rs.getDate("upload_date"));
	                tvshow.setRestricted_age(rs.getInt("restricted_age"));
	                tvshow.setTrailer_url(rs.getString("trailer_url"));
	                tvshow.setRating(rs.getDouble("rating"));
	                tvshow.setType(rs.getString("type"));
	                tvshow.setDirector_id(rs.getInt("director_id"));
	                tvshow.setAdmin_id(rs.getInt("admin_id"));
	            }

		    } catch (SQLException e) {
		        System.out.println("getMovieById for editing error: " + e.getMessage());
		    }

		    return tvshow;
		}
		
		// for updating tvshows
		public int updateTvShows(Tvshow tv) {
			int i = 0;
			
			Connection con = JDBCConnection.getConnection();
		    String sql = "UPDATE tvshow SET title = ?, release_year = ?, overview = ?, poster_url = ?, " +
	                "upload_date = ?, restricted_age = ?, trailer_url = ?, rating = ?, type = ?, " +
	                "director_id = ?, admin_id = ? WHERE tv_id = ?";
		    
		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setString(1, tv.getTitle());
				ps.setInt(2, tv.getRelease_year().getValue());
				ps.setString(3, tv.getOverview());
				ps.setString(4, tv.getPoster_url());
				ps.setDate(5, tv.getUpload_date());
				ps.setInt(6, tv.getRestricted_age());
				ps.setString(7, tv.getTrailer_url());
				ps.setDouble(8, tv.getRating());
				ps.setString(9, tv.getType());
				ps.setInt(10, tv.getDirector_id());
				ps.setInt(11, tv.getAdmin_id());
				ps.setInt(12, tv.getTv_id());
				i = ps.executeUpdate();
		        
		    } catch (SQLException e) {
		        System.out.println("updating tvshows error: " + e.getMessage());
		    }
		    
		    return i;
		}
		
		
		//for tv episodes
		public Tvshow getTvShowById(int id) {
			Tvshow tvshow = null;
		    Connection con = JDBCConnection.getConnection();

		    String sql = "SELECT " +
		            "tv.tv_id, tv.title, tv.release_year, tv.overview, tv.poster_url, tv.upload_date, " +
		            "tv.restricted_age, tv.trailer_url, tv.rating, tv.type, tv.director_id, tv.admin_id, " +
		            "ep.episode_id, ep.episode_name, ep.duration, ep.episode_file_url " +
		            "FROM tvshow tv " +
		            "LEFT JOIN episodes ep ON tv.tv_id = ep.tv_id " +
		            "WHERE tv.tv_id = ? " +
		            "ORDER BY ep.episode_id;";

		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
	                if (tvshow == null) {
	                    tvshow = new Tvshow();
	                    tvshow.setTv_id(rs.getInt("tv_id"));
	                    tvshow.setTitle(rs.getString("title"));
	                    tvshow.setRelease_year(Year.of(rs.getInt("release_year")));
	                    tvshow.setOverview(rs.getString("overview"));
	                    tvshow.setPoster_url(rs.getString("poster_url"));
	                    tvshow.setUpload_date(rs.getDate("upload_date"));
	                    tvshow.setRestricted_age(rs.getInt("restricted_age"));
	                    tvshow.setTrailer_url(rs.getString("trailer_url"));
	                    tvshow.setRating(rs.getDouble("rating"));
	                    tvshow.setType(rs.getString("type"));
	                    tvshow.setDirector_id(rs.getInt("director_id"));
	                    tvshow.setAdmin_id(rs.getInt("admin_id"));
	                    tvshow.setEpisodes(new ArrayList<>());
	                }
	                
	                Episodes ep = new Episodes();
	                ep.setEpisode_id(rs.getInt("episode_id"));
	                ep.setEpisode_name(rs.getString("episode_name"));
	                ep.setDuration(rs.getInt("duration"));
	                ep.setEpisode_file_url(rs.getString("episode_file_url"));
	                ep.setTv_id(id);

	                tvshow.getEpisodes().add(ep);
		        }

		    } catch (SQLException e) {
		        System.out.println("getMovieById error: " + e.getMessage());
		    }

		    return tvshow;
		}
		
		// for each episode
		public Episodes getEpisodeById(int episodeId) {
		    Episodes episode = null;
		    try (Connection con = JDBCConnection.getConnection()) {
		        // 1. Get episode and its associated TV show
		        String sql = "SELECT ep.episode_id, ep.episode_name, ep.duration, ep.episode_file_url, ep.tv_id, " +
		                     "tv.tv_id, tv.title, tv.release_year, tv.overview, tv.poster_url, tv.upload_date, " +
		                     "tv.restricted_age, tv.trailer_url, tv.rating, tv.type, tv.director_id, tv.admin_id " +
		                     "FROM episodes ep " +
		                     "JOIN tvshow tv ON ep.tv_id = tv.tv_id " +
		                     "WHERE ep.episode_id = ?";

		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, episodeId);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            // Build the Episode object
		            episode = new Episodes();
		            episode.setEpisode_id(rs.getInt("episode_id"));
		            episode.setEpisode_name(rs.getString("episode_name"));
		            episode.setDuration(rs.getInt("duration"));
		            episode.setEpisode_file_url(rs.getString("episode_file_url"));
		            episode.setTv_id(rs.getInt("tv_id"));

		            // Build the Tvshow object
		            Tvshow tv = new Tvshow();
		            tv.setTv_id(rs.getInt("tv_id"));
		            tv.setTitle(rs.getString("title"));
		            tv.setRelease_year(java.time.Year.of(rs.getInt("release_year")));
		            tv.setOverview(rs.getString("overview"));
		            tv.setPoster_url(rs.getString("poster_url"));
		            tv.setUpload_date(rs.getDate("upload_date"));
		            tv.setRestricted_age(rs.getInt("restricted_age"));
		            tv.setTrailer_url(rs.getString("trailer_url"));
		            tv.setRating(rs.getDouble("rating"));
		            tv.setType(rs.getString("type"));
		            tv.setDirector_id(rs.getInt("director_id"));
		            tv.setAdmin_id(rs.getInt("admin_id"));

		            // Load all episodes for the same TV show
		            String episodesSql = "SELECT * FROM episodes WHERE tv_id = ?";
		            PreparedStatement epsStmt = con.prepareStatement(episodesSql);
		            epsStmt.setInt(1, tv.getTv_id());
		            ResultSet epsRs = epsStmt.executeQuery();

		            List<Episodes> episodeList = new ArrayList<>();
		            while (epsRs.next()) {
		                Episodes ep = new Episodes();
		                ep.setEpisode_id(epsRs.getInt("episode_id"));
		                ep.setEpisode_name(epsRs.getString("episode_name"));
		                ep.setDuration(epsRs.getInt("duration"));
		                ep.setEpisode_file_url(epsRs.getString("episode_file_url"));
		                ep.setTv_id(epsRs.getInt("tv_id"));
		                episodeList.add(ep);
		            }

		            // Set episode list in Tvshow and Tvshow in episode
		            tv.setEpisodes(episodeList);
		            episode.setTvshow(tv);
		        }
		    } catch (SQLException e) {
		        System.out.println("getEpisodeById error: " + e.getMessage());
		    }

		    return episode;
		}



		
		public Cast getMovieCastById(int id) {
		    Cast cast = null;
		    Connection con = JDBCConnection.getConnection();
		    String sql = "SELECT " +
	                "    m.id AS movie_id, " +
	                "    m.title AS movie_title, " +
	                "    d.name AS director_name, " +
	                "    GROUP_CONCAT(c.name ORDER BY c.name SEPARATOR ', ') AS cast_names " +
	                "FROM movies m " +
	                "JOIN director d ON m.director_id = d.id " +
	                "JOIN moviecast mc ON m.id = mc.movies_id " +
	                "JOIN cast c ON mc.cast_id = c.id " +
	                "WHERE m.id = ? " +
	                "GROUP BY m.id, m.title, d.name";

		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            cast = new Cast();
		            
		            cast.setMovie_id(rs.getInt("movie_id"));                 // assuming this setter exists
		            cast.setMovie_title(rs.getString("movie_title"));        // assuming this setter exists
		            cast.setDirector_name(rs.getString("director_name"));    // assuming this setter exists
		            cast.setCast_names(rs.getString("cast_names"));      
		        }

		    } catch (SQLException e) {
		        System.out.println("getMovieCastById error: " + e.getMessage());
		    }

		    return cast;
		}
		
		public Genre getMovieGenreById(int id) {
		    Genre genre = null;
		    Connection con = JDBCConnection.getConnection();
		    String sql = "SELECT " +
	                "    m.id AS movie_id, " +
	                "    GROUP_CONCAT(g.name ORDER BY g.name SEPARATOR ', ') AS genre_names " +
	                "FROM movies m " +
	                "JOIN moviegenre mg ON m.id = mg.movies_id " +
	                "JOIN genretype g ON mg.genreType_id = g.id " +
	                "WHERE m.id = ? " +
	                "GROUP BY m.id";
		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            genre = new Genre();
		            genre.setMovie_id(rs.getInt("movie_id"));
		            genre.setGenre_name(rs.getString("genre_names")); // comma-separated genres
		                 
		        }

		    } catch (SQLException e) {
		        System.out.println("getMovieCastById error: " + e.getMessage());
		    }

		    return genre;
		}
		
		// for tv genre 
		

		
	

	
		// for update movies
		  public int updateMovies(Movies movie) {
		    int i = 0;
		    
		    Connection con = JDBCConnection.getConnection();
		      String sql = "UPDATE movies SET " +
		              "title = ?, " +
		              "release_year = ?, " +
		              "overview = ?, " +
		              "poster_url = ?, " +
		              "movie_file_url = ?, " +
		              "upload_date = ?, " +
		              "duration_minutes = ?, " +
		              "restriced_age = ?, " +
		              "director_id = ?, " +
		              "admin_id = ?, " +
		              "trailer_url = ?, " +
		              "rating = ?, " +
		              "type = ? " +
		              "WHERE id = ?";;
		      
		      try {
		          PreparedStatement ps = con.prepareStatement(sql);
		          ps.setString(1, movie.getTitle());
		          ps.setInt(2, movie.getRelease_year().getValue());
		          ps.setString(3, movie.getOverview());
		          ps.setString(4, movie.getPoster_url());
		          ps.setString(5, movie.getMovie_file_url());
		          ps.setDate(6, movie.getUpload_date());
		          ps.setInt(7, movie.getDuration_minutes() != null ? movie.getDuration_minutes() : 0);
		          ps.setInt(8, movie.getRestriced_age() != null ? movie.getRestriced_age() : 0);
		          ps.setInt(9, movie.getDirector_id() != null ? movie.getDirector_id() : 0);
		          ps.setInt(10, movie.getAdmin_id() != null ? movie.getAdmin_id() : 0);
		          ps.setString(11, movie.getTrailer_url());
		          ps.setDouble(12, movie.getRating() != null ? movie.getRating() : 0.0);
		          ps.setString(13, movie.getType());
		          ps.setInt(14, movie.getMovie_id());
		         
		      i = ps.executeUpdate();
		          
		      } catch (SQLException e) {
		          System.out.println("updating Movies error: " + e.getMessage());
		      }
		      
		      return i;
		  }

		  
		  

		
		  public int deleteMovie(int id) {
			    int result = 0;
			    Connection con = JDBCConnection.getConnection();
			    String sql = "DELETE FROM movies WHERE id = ?";
			    
			    try {
			        PreparedStatement ps = con.prepareStatement(sql);
			        ps.setInt(1, id);
			        result = ps.executeUpdate();
			    } catch (SQLException e) {
			        System.out.println("deleteMovie error: " + e.getMessage());
			    }
			    
			    return result;
			}
		  
		  
		  
		  
		  public List<Movies> filterMoviesByYearAndGenres(String year, List<String> genres) { 
			    List<Movies> movies = new ArrayList<>();
			    Connection con = JDBCConnection.getConnection();
			    
			    StringBuilder sql = new StringBuilder(
			          "SELECT DISTINCT m.* FROM movies m " +
			          "LEFT JOIN moviegenre mg ON m.id = mg.movies_id " +
			          "LEFT JOIN genretype g ON mg.genreType_id = g.id " +
			          "WHERE 1=1 ");
			    
			    //Year condition
			    if (year != null && !year.isEmpty()) {
			      if (year.equals("Older")) {
			        sql.append(" AND m.release_year < 2020 ");
			      } else {
			        sql.append(" AND m.release_year = ? ");
			      }
			    }
			    
			    // Genre condition
			    if (genres != null && !genres.isEmpty() && !genres.contains("")) {
			      sql.append(" AND g.name IN(")
			        .append(String.join(",", Collections.nCopies(genres.size(), "?")))
			        .append(") ");
			    }
			    
			    try {
			       PreparedStatement ps = con.prepareStatement(sql.toString());
			         int paramIndex = 1;
			         
			         // set year param if applicable
			         if (year != null && !year.isEmpty() && !year.equals("Older")) {
			                ps.setInt(paramIndex++, Integer.parseInt(year));
			            }
			         
			         // Set genre params
			          if (genres != null && !genres.isEmpty() && !genres.contains("")) {
			              for (String genre : genres) {
			                  ps.setString(paramIndex++, genre);
			              }
			          }
			          
			          ResultSet rs = ps.executeQuery();
			          while (rs.next()) {
			            Movies movie = new Movies();
			            movie.setMovie_id(rs.getInt("id"));
			              movie.setTitle(rs.getString("title"));
			              movie.setRelease_year(Year.of(rs.getInt("release_year")));
			              movie.setOverview(rs.getString("overview"));
			              movie.setPoster_url(rs.getString("poster_url"));
			              movie.setMovie_file_url(rs.getString("movie_file_url"));
			              movie.setUpload_date(rs.getDate("upload_date"));
			              movie.setDuration_minutes(rs.getInt("duration_minutes"));
			              movie.setRestriced_age(rs.getInt("restriced_age"));
			              movie.setDirector_id(rs.getInt("director_id"));
			              movie.setAdmin_id(rs.getInt("admin_id"));
			              movie.setTrailer_url(rs.getString("trailer_url"));
			              movie.setRating(rs.getDouble("rating"));
			              movie.setType(rs.getString("type"));
			              movies.add(movie);
			          }
			          
			    } catch (SQLException e) {
			      System.out.println("Filter error: " + e.getMessage());
			    }
			    
			    return movies;
			  }
	
	
		    public List<Tvshow> filterTvShowsByYearAndGenres(String year, List<String> genres) { 
		      List<Tvshow> tvShows = new ArrayList<>();
		      Connection con = JDBCConnection.getConnection();
		      
		      StringBuilder sql = new StringBuilder(
		            "SELECT DISTINCT t.* FROM tvshow t " +
		            "LEFT JOIN tvgenre tg ON t.tv_id = tg.tv_id " +
		            "LEFT JOIN genretype g ON tg.genreType_id = g.id " +
		            "WHERE 1=1 ");
		      
		      //Year condition
		      if (year != null && !year.isEmpty()) {
		        if (year.equals("Older")) {
		          sql.append(" AND t.release_year < 2020 ");
		        } else {
		          sql.append(" AND t.release_year = ? ");
		        }
		      }
		      
		      // Genre condition
		      if (genres != null && !genres.isEmpty() && !genres.contains("")) {
		        sql.append(" AND g.name IN(")
		          .append(String.join(",", Collections.nCopies(genres.size(), "?")))
		          .append(") ");
		      }
		      
		      try {
		         PreparedStatement ps = con.prepareStatement(sql.toString());
		           int paramIndex = 1;
		           
		           // set year param if applicable
		           if (year != null && !year.isEmpty() && !year.equals("Older")) {
		                  ps.setInt(paramIndex++, Integer.parseInt(year));
		              }
		           
		           // Set genre params
		            if (genres != null && !genres.isEmpty() && !genres.contains("")) {
		                for (String genre : genres) {
		                    ps.setString(paramIndex++, genre);
		                }
		            }
		            
		            ResultSet rs = ps.executeQuery();
		            while (rs.next()) {
		              Tvshow tv = new Tvshow();
		          tv.setTv_id(rs.getInt("tv_id"));
		                  tv.setTitle(rs.getString("title"));
		                  tv.setRelease_year(Year.of(rs.getInt("release_year")));
		                  tv.setOverview(rs.getString("overview"));
		                  tv.setPoster_url(rs.getString("poster_url"));
		                  tv.setUpload_date(rs.getDate("upload_date"));
		                  tv.setRestricted_age(rs.getInt("restricted_age"));
		                  tv.setTrailer_url(rs.getString("trailer_url"));
		                  tv.setRating(rs.getDouble("rating"));
		                  tv.setType(rs.getString("type"));
		                  tv.setDirector_id(rs.getInt("director_id"));
		                  tv.setAdmin_id(rs.getInt("admin_id"));
		                tvShows.add(tv);
		            }
		            
		      } catch (SQLException e) {
		        System.out.println("Filter error: " + e.getMessage());
		      }
		      
		      return tvShows;
		    }
		  public List<GenreType> getAllGenreTypes() {
			    List<GenreType> genres = new ArrayList<>();
			    Connection con = JDBCConnection.getConnection();
			    String sql = "SELECT * FROM genretype";
			    
			    try {
			      PreparedStatement ps = con.prepareStatement(sql);
			      ResultSet rs = ps.executeQuery();
			      while (rs.next()) {
			        GenreType genre = new GenreType();
			        genre.setId(rs.getInt("id"));
			                genre.setName(rs.getString("name"));
			                
			                genres.add(genre);
			      }
			    } catch (SQLException e) {
			      System.out.println("get all genres error: " + e.getMessage());
			    }
			    
			    return genres;
			  }
	
	
}
