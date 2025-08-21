package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.Cast;
import com.spring.model.Episodes;
import com.spring.model.FileMetadata;
import com.spring.model.Genre;
import com.spring.model.InternetUtil;
import com.spring.model.MovieLogin;
import com.spring.model.MovieUser;
import com.spring.model.Movies;
import com.spring.model.Review;
import com.spring.model.Tvshow;
import com.spring.model.adminbean;
import com.spring.repository.FileMetadataRepository;
import com.spring.repository.MovieRepo;
import com.spring.repository.ReviewRepository;
import com.spring.service.GoogleDriveServiceImpl;
import com.spring.util.PasswordUtil;

@Controller
public class MovieController {
	
	@Autowired
	MovieRepo repo;
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private FileMetadataRepository fileMetadataRepository;

	@Autowired
	private ReviewRepository reviewRepo;
	
	@GetMapping("/home")
	public ModelAndView showIndex() {
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("movies", repo.getAllMovies());
	    mv.addObject("tvList", repo.getTvshows()); // Add your TV episodes list here
	    return mv;
	}

	@GetMapping("/signup")
	public ModelAndView user() {
		MovieUser user = new MovieUser();
		ModelAndView modelAndView = new ModelAndView("signup", "userObj", user);
		return modelAndView;
	}	
	
	@GetMapping("/UserRegiForm")
	public String showForm(@RequestParam(required = false) String email, Model model) {
	    model.addAttribute("email", email);
	    return "register";
	}

	
	
	
	@PostMapping("/UserRegi")
	public String addUser(@ModelAttribute("userObj") @Validated MovieUser mv,
	                      BindingResult result1,
	                      Model model,
	                      HttpSession session) throws IOException {

	    if (result1.hasErrors()) {
	        return "signup"; // Return to form with errors
	    }

	    if (repo.isEmailExists(mv.getEmail())) {
	        model.addAttribute("errorEmail", "Email already registered!");
	        return "error";
	    }

	    mv.setCreateAt(new java.sql.Date(System.currentTimeMillis()));
	    String hashedPassword = PasswordUtil.hashPassword(mv.getPasswordHash());
	    mv.setPasswordHash(hashedPassword);

	    MultipartFile file = mv.getProfilePic();
	    if (file != null && !file.isEmpty()) {
	        String uploadDir = servletContext.getRealPath("/uploads/");
	        File dir = new File(uploadDir);
	        if (!dir.exists()) dir.mkdirs();

	        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
	        File serverFile = new File(dir, fileName);
	        file.transferTo(serverFile);

	        mv.setProfilePicUrl("/uploads/" + fileName);
	    } else {
	        // ✅ Set default image path (make sure this image exists in the webapp folder)
	        mv.setProfilePicUrl("/resources/img/photo_2025-06-02_14-45-17.jpg");
	    }

	    int result = repo.insertUser(mv);

	    if (result > 0) {
	    	MovieUser savedUser = repo.findUserByEmail(mv.getEmail());
	         session.setAttribute("userId", savedUser.getId());
	        return "redirect:/packages";     
	    } else {
	        model.addAttribute("msg", "Failed registration");
	        return "signup";
	    }
	}

	
	@GetMapping("/login")
	public ModelAndView showLoginForm() {
		MovieLogin loginUser = new MovieLogin();
		ModelAndView modelAndView = new ModelAndView("login", "loginObj", loginUser);
		return modelAndView;
	}
	
	
	
	@PostMapping("/loginUser")
	public String login(@ModelAttribute("loginObj") MovieLogin loginUser,
	                    HttpSession session, Model model,
	                    RedirectAttributes redirectAttributes) {

	    // 1. First check if email belongs to an admin
	    adminbean admin = repo.findAdminByEmail(loginUser.getEmail());
	    if (admin != null) {
	        // Verify hashed password
	        if (BCrypt.checkpw(loginUser.getPassword(), admin.getPassword())) {
	            session.setAttribute("loggedInAdmin", admin);
	            return "dashboard";
	        } else {
	            redirectAttributes.addFlashAttribute("msg", "Invalid password for admin.");
	            return "redirect:/login";
	        }
	    }

	    // 2. If not admin, check if it's a regular user
	    MovieUser user = repo.checkLogin(loginUser);
	    if (user != null) {
	        session.setAttribute("loggedInUser", user);
	        return "redirect:/home";
	    } else {
	        redirectAttributes.addFlashAttribute("msg", "Invalid user credentials.");
	        return "redirect:/login";
	    }
	}

	
	
	@PostMapping("/adminLogin")
	public String adminLogin(@ModelAttribute("loginObj") MovieLogin loginUser,
	                         HttpSession session,
	                         Model model,
	                         RedirectAttributes redirectAttributes) {

	    adminbean admin = repo.checkAdminLogin(loginUser.getEmail(), loginUser.getPassword());

	    if (admin != null) {
	        session.setAttribute("loggedInAdmin", admin);
	        model.addAttribute("msg", "Welcome, " + admin.getName());
	        return "redirect:singup"; // change as needed
	    } else {
	        redirectAttributes.addFlashAttribute("msg", "Invalid admin credentials.");
	        return "redirect:/login";
	    }
	}

	@GetMapping("/forgotPassword")  // Add this new mapping to show the form
    public ModelAndView showForgotPasswordForm() {
        MovieLogin loginUser = new MovieLogin();
        ModelAndView modelAndView = new ModelAndView("forgotPassword", "loginObj", loginUser);
        return modelAndView;
    }

    @PostMapping("/forgotPassword")
    public String processForgotPassword(@ModelAttribute("loginObj") MovieLogin loginUser,
                                      HttpSession session,
                                      Model model) {
        try {
            // Check if email exists in database
            if (!repo.isEmailExists(loginUser.getEmail())) {
                model.addAttribute("errorMsg", "Email not found. Please enter a registered email.");
                return "forgotPassword";
            }

            // Rest of your existing code...
            Random rand = new Random();
            int otpValue = rand.nextInt(999999);

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("yephonea7@gmail.com", "vkik kjli bvaw ivio");
                }
            });

            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress("yephonea7@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(loginUser.getEmail()));
            message.setSubject("Password Reset OTP");
            message.setText("Your OTP for password reset is: " + otpValue);
            Transport.send(message);
            
            session.setAttribute("otp", otpValue);
            session.setAttribute("email", loginUser.getEmail());
            
            model.addAttribute("message", "OTP sent successfully to " + loginUser.getEmail());
            return "EnterOtp";

        } catch (MessagingException e) {
            e.printStackTrace();
            model.addAttribute("errorMsg", "Failed to send OTP. Please try again.");
            return "forgotPassword";
        }
    }
	
    
    
    
    
    @PostMapping("/ValidateOtp")
    public String validateOTP(@RequestParam("otp") int userEnteredOtp, 
                            HttpSession session, 
                            Model model) {
        
        int generatedOtp = (int) session.getAttribute("otp");
        String email = (String) session.getAttribute("email");
        
        if(userEnteredOtp == generatedOtp) {
            // Create and add the passwordReset model attribute
            MovieLogin passwordReset = new MovieLogin();
            passwordReset.setEmail(email);
            model.addAttribute("passwordReset", passwordReset);
            return "newPassword";
        } else {
            model.addAttribute("errorMsg", "Invalid OTP. Please try again.");
            return "EnterOtp";
        }
    }
    @PostMapping("/newPassword")
    public String handleNewPassword(@ModelAttribute("passwordReset") MovieLogin passwordReset,
                                  HttpSession session,
                                  RedirectAttributes redirectAttributes) {
        
        String email = (String) session.getAttribute("email");
        if (email == null) {
            redirectAttributes.addFlashAttribute("errorMsg", "Session expired. Please try again.");
            return "redirect:/forgotPassword";
        }

        // Validate passwords match
        if (!passwordReset.getNewPassword().equals(passwordReset.getConfirmPassword())) {
            redirectAttributes.addFlashAttribute("errorMsg", "Passwords do not match!");
            return "redirect:/newPassword";
        }

        // Hash the new password
        String hashedPassword = PasswordUtil.hashPassword(passwordReset.getNewPassword());
        
        // Update password in database
        boolean success = repo.updatePassword(email, hashedPassword);
        
        if (success) {
            // Clear session attributes
            session.removeAttribute("otp");
            session.removeAttribute("email");
            
            redirectAttributes.addFlashAttribute("msg", "Password updated successfully!");
            return "redirect:/login";  // Redirect to login page
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", "Failed to update password. Please try again.");
            return "redirect:/newPassword";
        }
    }
    @GetMapping("/newPassword")
    public String showNewPasswordForm(HttpSession session, Model model) {
        // Check if user has validated OTP
        if (session.getAttribute("email") == null) {
            return "redirect:/forgotPassword";
        }
        
        // Create empty password reset object
        MovieLogin passwordReset = new MovieLogin();
        model.addAttribute("passwordReset", passwordReset);
        return "newPassword";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // This clears the session
        return "redirect:/login"; // Redirect to login page
    }
	

    @GetMapping("/anime")
	public String animewatch() {
		
		return "anime-watching";
	}
    @GetMapping("/backhome")
	public String backhome() {
		
		return "index";
	}
    
    
    
    
    @GetMapping("/profile1")
    public String showProfile(HttpSession session,
                              RedirectAttributes redirectAttributes,
                              Model model) {

        MovieUser loggedInUser = (MovieUser) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            redirectAttributes.addFlashAttribute("accessDeniedMsg", "Please sign up or log in to access your profile");
            return "redirect:/signup";
        }

        // Use email from session directly
        String email = loggedInUser.getEmail();
        MovieUser user = repo.findUserByEmail(email);

        if (user != null) {
            model.addAttribute("user", user);
            return "profile";
        } else {
            redirectAttributes.addFlashAttribute("accessDeniedMsg", "User not found.");
            return "redirect:/signup";
        }
    }

    
    @GetMapping("/editProfile")
    public String editProfile(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        MovieUser loggedInUser = (MovieUser) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            redirectAttributes.addFlashAttribute("accessDeniedMsg", "Please log in first.");
            return "redirect:/login";
        }

        String email = loggedInUser.getEmail();
        MovieUser user = repo.findUserByEmail(email);

        if (user != null) {
            model.addAttribute("userObj", user);
            return "editProfile";
        } else {
            redirectAttributes.addFlashAttribute("msg", "User not found.");
            return "redirect:/home";
        }
    }


    @PostMapping("/editProfile")
    public String updateProfile(@ModelAttribute("userObj") MovieUser user,
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {

        MovieUser loggedInUser = (MovieUser) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/signup";
        }

        try {
            // 🖼️ Handle profile picture upload
            MultipartFile file = user.getProfilePic();
            if (file != null && !file.isEmpty()) {
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                String uploadPath = session.getServletContext().getRealPath("/uploads/");
                file.transferTo(new File(uploadPath + File.separator + fileName));
                user.setProfilePicUrl("/uploads/" + fileName);
            } else {
                MovieUser existing = repo.findUserByEmail(loggedInUser.getEmail());
                user.setProfilePicUrl(existing.getProfilePicUrl());
            }

            // ✅ Ensure ID and old passwordHash are preserved
            user.setId(loggedInUser.getId());
            user.setPasswordHash(loggedInUser.getPasswordHash());

            // ✅ Check if email is already used by another user (optional safety step)
            MovieUser existingWithNewEmail = repo.findUserByEmail(user.getEmail());
            if (existingWithNewEmail != null && existingWithNewEmail.getId() != loggedInUser.getId()) {
                redirectAttributes.addFlashAttribute("errorMsg", "Email already in use.");
                return "redirect:/editProfile?email=" + loggedInUser.getEmail();
            }

            // ✅ Update user
            repo.updateUser(user);
            session.setAttribute("loggedInUser", user);

            return "redirect:/profile1?email=" + user.getEmail();

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("errorMsg", "Profile update failed.");
            return "redirect:/editProfile?email=" + loggedInUser.getEmail();
        }
    }
    
    
    @GetMapping("/changePassword")
    public String showChangePasswordForm(@RequestParam("email") String email, 
                                       HttpSession session, 
                                       Model model) {
        MovieUser loggedInUser = (MovieUser) session.getAttribute("loggedInUser");
        
        if (loggedInUser == null || !loggedInUser.getEmail().equals(email)) {
            return "redirect:/signup";
        }
        
        model.addAttribute("email", email);
        return "user/changePassword";
    }
    
    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("email") String email,
                               @RequestParam("currentPassword") String currentPassword,
                               @RequestParam("newPassword") String newPassword,
                               @RequestParam("confirmPassword") String confirmPassword,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        
        MovieUser loggedInUser = (MovieUser) session.getAttribute("loggedInUser");
        
        // Validate session
        if (loggedInUser == null || !loggedInUser.getEmail().equals(email)) {
            return "redirect:/signup";
        }
        
        // Validate new password matches confirmation
        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("confirmPasswordError", "Passwords do not match");
            return "redirect:/changePassword?email=" + email;
        }
        
        // Verify current password
        MovieUser user = repo.findUserByEmail(email);
        if (!PasswordUtil.checkPassword(currentPassword, user.getPasswordHash())) {
            redirectAttributes.addFlashAttribute("currentPasswordError", "Current password is incorrect");
            return "redirect:/changePassword?email=" + email;
        }
        
        // Update password
        String newHashedPassword = PasswordUtil.hashPassword(newPassword);
        boolean updated = repo.updatePssword(email, newHashedPassword);
        
        if (updated) {
            // Update session with new password hash
            loggedInUser.setPasswordHash(newHashedPassword);
            session.setAttribute("loggedInUser", loggedInUser);
            
            redirectAttributes.addFlashAttribute("successMessage", "Password changed successfully");
            return "redirect:/profile1?email=" + email;
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to update password");
            return "redirect:/changePassword?email=" + email;
        }
    }


    
    
	 @GetMapping("/anime-details")
	  public String showMDetails() { 
		  return "anime-k"; 
	  }
	 
		/*
		 * @GetMapping("/anime-details/{id}") public ModelAndView
		 * showMovieDetails(@PathVariable("id") int id, Model model) { Movies movie =
		 * repo.getMovieById(id); Cast casts = repo.getMovieCastById(id);
		 * model.addAttribute("casts", casts); Genre genre = repo.getMovieGenreById(id);
		 * model.addAttribute("genre", genre); ModelAndView modelAndView = new
		 * ModelAndView("anime-details", "movie", movie); return modelAndView; }
		 */
	 @GetMapping("/anime-details/{id}")
		public ModelAndView showMovieDetails(@PathVariable("id") int id, Model model) {
			Movies movie = repo.getMovieById(id);
			if (movie == null) {
	            return new ModelAndView("redirect:/error-page");
	        }
			
			// Fetch all reviews for this movie using the repository method.
			List<Review> reviews = reviewRepo.getReviewsByMovieId(id);
			
			model.addAttribute("casts", repo.getMovieCastById(id));
			model.addAttribute("genre", repo.getMovieGenreById(id));
			model.addAttribute("reviews", reviews); // Add the review list to the model.
			
			return new ModelAndView("anime-details", "movie", movie);
		}
	 @GetMapping("/anime-watching/{id}")
		public String showAnimeWatching(@PathVariable("id") int id, Model model,HttpSession session) {
		    Movies movie = repo.getMovieById(id);
	        if (movie == null) {
	            return "redirect:/error-page";
	        }
		    
		    // Also fetch reviews for the watching page.
		    List<Review> reviews = reviewRepo.getReviewsByMovieId(id);

		    model.addAttribute("movie", movie);
		    model.addAttribute("reviews", reviews); // Add reviews to the model.
		    
		    Review review = new Review();
		    review.setMoviesId(id);

		    MovieUser user = (MovieUser) session.getAttribute("loggedInUser");
		    if (user != null) {
		        review.setUserId(user.getId());
		    }

		    model.addAttribute("review", review);

		    return "anime-watching"; 
		}
	
	
		/*
		 * @GetMapping("/anime-watching/{id}") public String
		 * showAnimeWatching(@PathVariable("id") int id, Model model) { Movies movie =
		 * repo.getMovieById(id); model.addAttribute("movie", movie); return
		 * "anime-watching"; }
		 */
	
	@GetMapping("/tvshow-details/{id}")
	public ModelAndView showTvShowDetails(@PathVariable("id") int id, Model model) {
		Tvshow tv = repo.getTvShowById(id);
		
		if (tv == null) {
			return new ModelAndView("redirect:/error");
		}
		ModelAndView modelAndView = new ModelAndView("tvshow-details", "tv", tv);
		return modelAndView;
	}
	
	@GetMapping("/tv-watching/{id}")
	public String showTvWatching(@PathVariable("id") int id, Model model) {
		Tvshow tv = repo.getTvShowById(id);
		model.addAttribute("tv", tv);
		model.addAttribute("episodes", tv.getEpisodes());
		return "tv-watching";
	}
	
	@GetMapping("/episode-watching/{id}")
	public String showEpisodeWatching(@PathVariable("id") int episodeId, Model model) {
		Episodes episode = repo.getEpisodeById(episodeId); // Fetch episode
	    Tvshow tv = episode.getTvshow(); // Get the associated Tvshow
	    
		model.addAttribute("tv", tv);
		model.addAttribute("episodes", tv.getEpisodes());
		model.addAttribute("selectedEpisode", episode); // pass the selected episode
		return "episode-watching";
	}
	

}
