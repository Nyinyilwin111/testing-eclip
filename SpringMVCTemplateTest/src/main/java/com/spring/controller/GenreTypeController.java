package com.spring.controller;



import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.spring.model.GenreType;
import com.spring.repository.GenreTypeRepository;

@Controller
public class GenreTypeController {

	 @Autowired
	  GenreTypeRepository genreRepo;

	    // List all genres
	    @GetMapping("/genres")
	    public String listGenres(Model model) {
	        List<GenreType> genres = genreRepo.findAll();
	        model.addAttribute("genres", genres);
	        return "genre-list"; // genre-list.jsp
	    }

	    // Show Add Form
	    @GetMapping("/genres/add")
	    public String showAddForm(Model model) {
	        model.addAttribute("genre", new GenreType());
	        return "genre-form"; // genre-form.jsp
	    }
	    // Save genre (insert or update)
	    @PostMapping("/genres/save")
	    public String saveGenre(@Valid @ModelAttribute("genre") GenreType genre,BindingResult result,Model model) {
	    	
	    	if (result.hasErrors()) {
	            return "genre-form"; // JSP name
	        }
	    	
	    	
	    	if (genre.getId() > 0) {
	              genreRepo.update(genre);
	        } else {
	            genreRepo.save(genre);
	        }
	        return "redirect:/genres";
	    }

	    // Show Edit Form
	    @GetMapping("/genres/edit/{id}")
	    public String showEditForm(@PathVariable int id, Model model) {
	    	GenreType genre = genreRepo.findById(id);
	        model.addAttribute("genre", genre);
	        return "genre-form";
	    }

	    // Delete genre
	    @GetMapping("/genres/delete/{id}")
	    public String deleteGenre(@PathVariable int id) {
	        genreRepo.delete(id);
	        return "redirect:/genres";
	    }
	
}
