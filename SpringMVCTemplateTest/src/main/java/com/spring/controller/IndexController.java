package com.spring.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.Res.Res;
//Existing imports...
import java.util.Collections;
import java.util.stream.Collectors;
import java.util.List;
import com.spring.model.Episodes;
import com.spring.model.Movies;
import com.spring.model.Tvshow;
import com.spring.repository.MovieRepo;
import com.spring.service.DriveService;
import com.spring.service.GoogleDriveServiceImpl;


@Controller
public class IndexController {
	
	@Autowired
	private MovieRepo repo;
	
	@Autowired
	private GoogleDriveServiceImpl googleDriveService;
	
	@Autowired
	private DriveService driveService;
	
	
	/*
	 * @GetMapping("/home") public String showIndex() { return "index"; }
	 */
	
//	@GetMapping("/signup")
//	public String showMenu() {
//		return "signup";
//	}
	
	@GetMapping("/movies")
	public ModelAndView showMovieForm() {
		return new ModelAndView("movies", "movieObj", new Movies());
	}
	
	//for tvshow
	@GetMapping("/addTv")
	public ModelAndView showTvForm() {
		return new ModelAndView("addTv", "tvObj", new Tvshow());
	}
	
	@GetMapping("/addEpisodes")
	public ModelAndView showEpisoedesForm() {
		return new ModelAndView("addEpisodes", "episodeObj", new Episodes());
	}
	
	// for movie file destination
	@Value("${upload.dir}")
	private String uploadDir;
	
	// for movie poster file destination
	@Value("${upload.mpdir}")
	private String uploadMpdir;
	
	// for movie trailer destination
	@Value("${upload.mtdir}")
	private String uploadMtdir;
	
	// for episode destination
	@Value("${upload.edir}")
	private String uploadEdir;
	
	/*
	 * @Value("${ffmpeg.path}") private String ffmpegPath;
	 * 
	 * @PostConstruct public void init() { System.setProperty("ffmpeg.location",
	 * ffmpegPath); }
	 */
	
	@PostMapping("/movie")
	public ModelAndView saveMovie(@ModelAttribute("movieObj") Movies movie, 
			@RequestParam("movieFile") MultipartFile movieFile) {
		
		MultipartFile moviePoster = movie.getPoster();
		MultipartFile movieTrailer = movie.getTrailerFile();
		
		movie.setUpload_date(new java.sql.Date(System.currentTimeMillis()));

		try {
			
			
				// Upload poster to Google Drvie (image folder)
				if (!moviePoster.isEmpty()) {
		            String posterFileId = googleDriveService.uploadFileToFolder(moviePoster, "image");
		            if (posterFileId == null) {
		                return new ModelAndView("movies", "posterError", "Poster upload failed!");
		            }
					/*
					 * String posterUrl = "https://drive.google.com/uc?id=" + posterFileId +
					 * "&export=download";
					 */
		            movie.setPoster_url(posterFileId);
		        }
			
			
				/*
				 * if (!moviePoster.isEmpty()) { String posterUrl =
				 * FileUploadUtil.saveFile(moviePoster, uploadMpdir, null, new String[] {".jpg",
				 * ".jpeg", ".png"}); if (posterUrl == null) return new ModelAndView("movies",
				 * "posterError", "Invalid or duplicate poster file!");
				 * movie.setPoster_url(posterUrl); }
				 */
				
				
				// Upload trailer to Google Drive (trailer folder)
		        if (!movieTrailer.isEmpty()) {
		            String trailerFileId = googleDriveService.uploadFileToFolder(movieTrailer, "trailer");
		            if (trailerFileId == null) {
		                return new ModelAndView("movies", "trailerError", "Trailer upload failed!");
		            }
				
		            movie.setTrailer_url(trailerFileId);
		        }

			
		        
		        // Upload full movie to Google Drive (video folder)
		        if (!movieFile.isEmpty()) {
		            String movieFileId = googleDriveService.uploadFileToFolder(movieFile, "video");
		            if (movieFileId == null) {
		                return new ModelAndView("movies", "movieError", "Movie upload failed!");
		            }
			
		            movie.setMovie_file_url(movieFileId);
		        }
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
                return new ModelAndView("movies", "error", "File upload failed!");
			}
		
		int result = repo.insertMovie(movie);
		
		 if (result > 0) {
	            return new ModelAndView("movies", "error", "Movie saved!");
	        } else {
	            return new ModelAndView("movies", "error", "Movie not saved!");
	        }		
	}
	
	@PostMapping("/tv")
	public ModelAndView saveTv(@ModelAttribute("tvObj") Tvshow tv) {
		
		MultipartFile tvPoster = tv.getPoster();
		MultipartFile tvTrailer = tv.getTrailerFile();
		
		tv.setUpload_date(new java.sql.Date(System.currentTimeMillis()));
		
		try {
				
			// Upload poster to Google Drvie (image folder)
			if (!tvPoster.isEmpty()) {
	            String posterFileId = googleDriveService.uploadFileToFolder(tvPoster, "image");
	            if (posterFileId == null) {
	                return new ModelAndView("addTv", "tvPosterError", "Invalid or duplicate poster file!");
	            }
	            tv.setPoster_url(posterFileId);
	        }
			
			// Upload trailer to Google Drive (trailer folder)
	        if (!tvTrailer.isEmpty()) {
	            String trailerFileId = googleDriveService.uploadFileToFolder(tvTrailer, "trailer");
	            if (trailerFileId == null) {
	                return new ModelAndView("addTv", "tvTrailerError", "Trailer upload failed!");
	            }
				
	            tv.setTrailer_url(trailerFileId);
	        }
	        
		} catch(Exception e) {
			e.printStackTrace();
            return new ModelAndView("addTv", "error", "File upload failed!");
		}
		
		int result = repo.insertTv(tv);
		
		if (result > 0) {
            return new ModelAndView("addTv", "error", "Movie saved!");
        } else {
            return new ModelAndView("addTv", "error", "Movie not saved!");
        }	
		
	}

	@GetMapping("/movie-list")
	public ModelAndView listMovies1() {
	    List<Movies> movies = repo.getAllMovies();
	    
	    // Get distinct years for filter
	    List<String> years = movies.stream()
	        .map(m -> m.getRelease_year().toString())
	        .distinct()
	        .sorted(Collections.reverseOrder())
	        .collect(Collectors.toList());
	    
	    ModelAndView modelAndView = new ModelAndView("movie_list");
	    modelAndView.addObject("movies", movies);
	    modelAndView.addObject("years", years);
	    return modelAndView;
	}
	
	
	@GetMapping("/editMovie/{id}")
	public String editMovies(@PathVariable("id") int id, Model model) {
		Movies movie = repo.getMovieById(id);
		model.addAttribute("editMovieObj", movie);
		return "editMovies";
	}
	
	@PostMapping("editMovie")
	public String updateMovie(@ModelAttribute("editMovieObj") Movies movie,
			Model model,
			RedirectAttributes ra,
			@RequestParam("movieFile") MultipartFile movieFile) {
		
		MultipartFile moviePoster = movie.getPoster();
		MultipartFile movieTrailer = movie.getTrailerFile();
		
		movie.setUpload_date(new java.sql.Date(System.currentTimeMillis()));
		
		try {
			
			// for movie poster 
			if (!moviePoster.isEmpty()) {
	            String posterFileId = googleDriveService.uploadFileToFolder(moviePoster, "image");
	            if (posterFileId == null) {
	            	model.addAttribute("posterError", "Poster upload failed!");
	  
	                return "editMovies";
	            }
	            movie.setPoster_url(posterFileId);
	        }
			
			// Upload trailer to Google Drive (trailer folder)
	        if (!movieTrailer.isEmpty()) {
	            String trailerFileId = googleDriveService.uploadFileToFolder(movieTrailer, "trailer");
	            if (trailerFileId == null) {
	            	
	            	model.addAttribute("trailerError", "Trailer upload failed!");
	                return "editMovies";
	            }
	            movie.setTrailer_url(trailerFileId);
	        }
	        
	        if (!movieFile.isEmpty()) {
	            String movieFileId = googleDriveService.uploadFileToFolder(movieFile, "video");
	            if (movieFileId == null) {
	            	model.addAttribute("movieError", "Movie upload failed!");
	                return "editMovies";
	            }
				
	            movie.setMovie_file_url(movieFileId);
	        }
			
	        int result = repo.updateMovies(movie);
	        
	        if (result > 0) {
	            ra.addFlashAttribute("success", "Update success");
	            return "redirect:/movie_list";
	        } else {
	            model.addAttribute("updateError", "Update failed");
	            return "editMovie";
	        }
	        
			
			
		} catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("updateError", "File upload failed");
	        return "editMovies";
	    }
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/viewTvShows")
	public String viewTvShows(Model model) {
		List<Tvshow> tvList = repo.getTvshows();
		model.addAttribute("tvList", tvList);
		return "viewTvShows";
	}
	
	@GetMapping("/editTvShow/{id}")
	public String editTvShow(@PathVariable("id")int id, Model model) {
		Tvshow tv = repo.getTvShowByIdforEditing(id);
		model.addAttribute("editTvObj", tv);
		return "editTvshows";
	}
	@PostMapping("/editTv")
	public String updateTv (@ModelAttribute("editTvObj") Tvshow tv , Model model, RedirectAttributes ra) {
		
		MultipartFile tvPoster = tv.getPoster();
		MultipartFile tvTrailer = tv.getTrailerFile();
		// set update upload date
		tv.setUpload_date(new java.sql.Date(System.currentTimeMillis()));
		
		 try {
			// Upload poster to Google Drvie (image folder)
				if (!tvPoster.isEmpty()) {
		            String posterFileId = googleDriveService.uploadFileToFolder(tvPoster, "image");
		            if (posterFileId == null) {
		            	model.addAttribute("tvPosterError", "Poster upload failed!");
		          	  
		                return "addTv";
		              
		            }
		            tv.setPoster_url(posterFileId);
		        }
				
				// Upload trailer to Google Drive (trailer folder)
		        if (!tvTrailer.isEmpty()) {
		            String trailerFileId = googleDriveService.uploadFileToFolder(tvTrailer, "trailer");
		            if (trailerFileId == null) {
		            	model.addAttribute("tvTrailerError", "Poster upload failed!");
			          	  
		                return "addTv";
		             
		            }
					
		            tv.setTrailer_url(trailerFileId);
		        }

		        int result = repo.updateTvShows(tv);

		        if (result > 0) {
		            ra.addFlashAttribute("success", "Update success");
		            return "redirect:/viewTvShows";
		        } else {
		            model.addAttribute("updateError", "Update failed");
		            return "editTvshows";
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		        model.addAttribute("updateError", "File upload failed");
		        return "editTvshows";
		    }
		
	}
	
	//for episodes
	@PostMapping("/episodes")
	public ModelAndView saveEpisodes(@ModelAttribute("episodeObj") Episodes episode) {
		
		MultipartFile episodeFile = episode.getEpisodeFile();
		
		if (!episodeFile.isEmpty()) { 
			try {
				
				// to episode file to google drive 
				 String movieFileId = googleDriveService.uploadFileToFolder(episodeFile, "video");
		            if (movieFileId == null) {
		                return new ModelAndView("addEpisodes", "error", "Episode upload failed!");
		            }
		            episode.setEpisode_file_url(movieFileId);
				
			
		            
			} catch(Exception e) {
				e.printStackTrace();
                return new ModelAndView("addEpisodes", "error", "File upload failed!");
			}
		}
		
		int result = repo.insertEpisode(episode);
		
		if (result > 0) {
            return new ModelAndView("addEpisodes", "error", "Episode saved!");
        } else {
            return new ModelAndView("addEpisodes", "error", "Episode not saved!");
        }	
		
	}
	
	
	
	
	@GetMapping("/movie-details/{id}")
	public String showMovieDetails(@PathVariable("id") int id, Model model) {
		Movies movie = repo.getMovieById(id);
		model.addAttribute("movie", movie);
		return "movie-details";
	}
	
	
	//for showing image 
	@GetMapping("/proxy-image/{fileId}")
	public void proxyImage(@PathVariable String fileId, HttpServletResponse response) {
	    try {
	        String imageUrl = "https://drive.google.com/uc?export=view&id=" + fileId;
	        URL url = new URL(imageUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("User-Agent", "Mozilla/5.0"); // Important
	        conn.connect();

	        response.setContentType(conn.getContentType());

	        try (InputStream in = conn.getInputStream();
	             OutputStream out = response.getOutputStream()) {
	            byte[] buffer = new byte[8192];
	            int len;
	            while ((len = in.read(buffer)) != -1) {
	                out.write(buffer, 0, len);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	    }
	}
	
	// for streaming video
	@GetMapping("/proxy-video/{fileId}")
	public void proxyVideo(@PathVariable String fileId, HttpServletResponse response) {
	    try {
	        String videoUrl = "https://drive.google.com/uc?export=download&id=" + fileId;

	        URL url = new URL(videoUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("User-Agent", "Mozilla/5.0"); // Spoof browser
	        conn.connect();

	        response.setContentType(conn.getContentType());
	        response.setHeader("Content-Disposition", "inline"); // allow direct streaming

	        try (InputStream in = conn.getInputStream();
	             OutputStream out = response.getOutputStream()) {
	            byte[] buffer = new byte[8192];
	            int len;
	            while ((len = in.read(buffer)) != -1) {
	                out.write(buffer, 0, len);
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	    }
	}


	
	
	@GetMapping("/poster/{fileName:.+}")
	public void servePoster(@PathVariable("fileName") String fileName, HttpServletResponse response) throws IOException {
		
		System.out.println("Serving poster: " + uploadMpdir + fileName);
		
		
		File imageFile = new File(uploadMpdir + fileName);
		
		System.out.println("File exists: " + imageFile.exists());
		
		if (!imageFile.exists()) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		response.setContentType(Files.probeContentType(imageFile.toPath())); //dynamically detect image type
		response.setHeader("Content-Disposition", "inline;filename=" + fileName);
	    response.setContentLengthLong(imageFile.length());
	    
	    Files.copy(imageFile.toPath(), response.getOutputStream());
	    response.flushBuffer();
		
	}
	
	@GetMapping("/video/{fileName}")
	public void streamVideo(@PathVariable("fileName") String fileName,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
	    File videoFile = new File(uploadDir + fileName); // assumes 'uploadDir' ends with "/"
	    
	    if (!videoFile.exists()) {
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	        return;
	    }
	    
	    long fileLength = videoFile.length();
	    String range = request.getHeader("Range");
	    
	    if (range == null) {
	    	// no Range header - return full video
	    	response.setContentType("video/mp4");
	    	response.setHeader("Content-Length", String.valueOf(fileLength));
	    	Files.copy(videoFile.toPath(), response.getOutputStream());
	    	
	    }
	    
	    // Parse range (eg. "bytes=1000-")
	    long start = 0;
	    long end = fileLength - 1;
	    
	    String[] ranges = range.replace("bytes=", "").split("-");
	    try {
	    	start = Long.parseLong(ranges[0]);
	    	if (ranges.length > 1 && !ranges[1].isEmpty()) {
	    		end = Long.parseLong(ranges[1]);
	    	}
	    } catch (NumberFormatException e) {
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        return;
	    }
	    
	    if (start > end || end >= fileLength) {
	    	response.setStatus(HttpServletResponse.SC_REQUESTED_RANGE_NOT_SATISFIABLE);
	    	response.setHeader("Content-Range", "bytes */" + fileLength);
	        return;
	    }
	    
	    long contentLength = end - start + 1;
	    response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
	    response.setContentType("video/mp4");
	    response.setHeader("Accept-Ranges", "bytes");
	    response.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + fileLength);
	    response.setHeader("Content-Length", String.valueOf(contentLength));
	    
	    try (BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(videoFile));
	    		OutputStream outputStream = response.getOutputStream()) {
	    	inputStream.skip(start);
	    	
	    	byte[] buffer = new byte[8192];
	    	long bytesToRead = contentLength;
	    	
	    	int bytesRead;
	    	while ((bytesRead = inputStream.read(buffer, 0, (int) Math.min(buffer.length, bytesToRead))) != -1 && bytesToRead > 0) {
	            outputStream.write(buffer, 0, bytesRead);
	            bytesToRead -= bytesRead;
	        }
	    }
	    
	}
	
	@GetMapping("/episode/{fileName}")
	public void streamEpisode(@PathVariable("fileName") String fileName, 
			HttpServletResponse response) throws IOException {
	    File videoFile = new File(uploadEdir + fileName); // assumes 'uploadDir' ends with "/"
	    
	    if (!videoFile.exists()) {
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	        return;
	    }

	    response.setContentType("video/mp4");
	    response.setHeader("Content-Disposition", "inline;filename=" + fileName);
	    response.setContentLengthLong(videoFile.length());

	    Files.copy(videoFile.toPath(), response.getOutputStream());
	    response.flushBuffer();
	}
	
	@GetMapping("/episodeTrailer/{fileName}")
	public void streamEpisodeTrailer(@PathVariable("fileName") String fileName, 
			HttpServletResponse response) throws IOException {
	    File videoFile = new File(uploadMtdir + fileName); // assumes 'uploadDir' ends with "/"
	    
	    if (!videoFile.exists()) {
	        response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	        return;
	    }

	    response.setContentType("video/mp4");
	    response.setHeader("Content-Disposition", "inline;filename=" + fileName);
	    response.setContentLengthLong(videoFile.length());

	    Files.copy(videoFile.toPath(), response.getOutputStream());
	    response.flushBuffer();
	}
	
	@GetMapping("/deleteMovie/{id}")
	public String deleteMovie(@PathVariable("id") int id, RedirectAttributes ra) {
	    try {
	        // First get the movie to delete (so we can get file IDs for cleanup)
	        Movies movie = repo.getMovieById(id);
	        
	        if (movie != null) {
	            // Delete files from Google Drive
	            if (movie.getPoster_url() != null && !movie.getPoster_url().isEmpty()) {
	                Res deleteRes = driveService.deleteFile(movie.getPoster_url());
	                if (deleteRes.getStatus() != 200) {
	                    ra.addFlashAttribute("error", "Failed to delete poster: " + deleteRes.getMessage());
	                    return "redirect:/movie-list";
	                }
	            }
	            
	            if (movie.getTrailer_url() != null && !movie.getTrailer_url().isEmpty()) {
	                Res deleteRes = driveService.deleteFile(movie.getTrailer_url());
	                if (deleteRes.getStatus() != 200) {
	                    ra.addFlashAttribute("error", "Failed to delete trailer: " + deleteRes.getMessage());
	                    return "redirect:/movie-list";
	                }
	            }
	            
	            if (movie.getMovie_file_url() != null && !movie.getMovie_file_url().isEmpty()) {
	                Res deleteRes = driveService.deleteFile(movie.getMovie_file_url());
	                if (deleteRes.getStatus() != 200) {
	                    ra.addFlashAttribute("error", "Failed to delete movie file: " + deleteRes.getMessage());
	                    return "redirect:/movie-list";
	                }
	            }
	            
	            // Delete from database
	            int result = repo.deleteMovie(id);
	            
	            if (result > 0) {
	                ra.addFlashAttribute("success", "Movie deleted successfully!");
	            } else {
	                ra.addFlashAttribute("error", "Failed to delete movie from database!");
	            }
	        } else {
	            ra.addFlashAttribute("error", "Movie not found!");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        ra.addFlashAttribute("error", "Error deleting movie: " + e.getMessage());
	    }
	    
	    return "redirect:/movie-list";
	}
	
}

