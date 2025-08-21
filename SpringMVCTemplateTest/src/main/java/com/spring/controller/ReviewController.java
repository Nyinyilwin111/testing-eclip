package com.spring.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import com.spring.model.MovieUser;
import com.spring.model.Movies;
import com.spring.model.Review;
import com.spring.repository.MovieRepo;
import com.spring.repository.ReviewRepository;

@Controller
public class ReviewController {

	@Autowired
	private ReviewRepository reviewRepo;
	
	@Autowired
	private MovieRepo repo;
    
    @GetMapping("/review/form")
    public String showReviewForm(@RequestParam("movieId") int movieId, Model model, HttpSession session) {
        MovieUser user = (MovieUser) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/login";
        }

        Review review = new Review();
        review.setMoviesId(movieId);
        review.setUserId(user.getId());

        model.addAttribute("review", review);
        return "redirect:/anime-watching/" + review.getMoviesId();
    }

    @PostMapping("/review/save")
    public String saveReview(@ModelAttribute("review") @Valid Review review,
                             BindingResult result,
                             HttpSession session,
                             Model model) {
        MovieUser user = (MovieUser) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login";
        }

        if (result.hasErrors()) {
           
            Movies movie = repo.getMovieById(review.getMoviesId());
            List<Review> reviews = reviewRepo.getReviewsByMovieId(review.getMoviesId());

            model.addAttribute("movie", movie);
            model.addAttribute("reviews", reviews);
            return "anime-watching"; 
        }

        review.setUserId(user.getId());
        review.setReviewDate(LocalDateTime.now());

        reviewRepo.saveReview(review);

        return "redirect:/anime-watching/" + review.getMoviesId();
    }
   
    @GetMapping("/review/list")
    public String listReviews(Model model) {
        List<Review> reviews = reviewRepo.getAllReviews();

        
        for (Review r : reviews) {
            if (r.getUser() == null) {
                System.out.println("❌ Null User for review ID: " + r.getId());
            } else {
                System.out.println("✅ Review by: " + r.getUser().getUsername());
            }
        }

        model.addAttribute("reviews", reviews);
        return "review-list"; // Make sure JSP file name is review-list.jsp
    }

    @GetMapping("/review/delete/{id}")
    public String deleteReview(@PathVariable("id") int id) {
        Review review = reviewRepo.getReviewById(id); 
        int movieId = review.getMoviesId();

        reviewRepo.deleteReviewById(id);

        return "redirect:/anime-watching/" + movieId;
    }
}
