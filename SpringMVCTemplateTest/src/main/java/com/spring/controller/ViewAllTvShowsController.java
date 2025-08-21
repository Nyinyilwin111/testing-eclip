package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.GenreType;

import com.spring.model.Tvshow;
import com.spring.repository.MovieRepo;

@Controller
public class ViewAllTvShowsController {
	
	@Autowired
	private MovieRepo repo;
	
	@GetMapping("/viewAllTvShows")
	public String viewAllMovies(@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
		List<Tvshow> tvShows = repo.getTvshows();
		PagedListHolder<Tvshow> pagedListHolder = new PagedListHolder<>(tvShows);
	    pagedListHolder.setPageSize(6);
	    pagedListHolder.setPage(page - 1);

	    model.addAttribute("tvShows", pagedListHolder.getPageList());
	    model.addAttribute("page", page);
	    model.addAttribute("maxPages", pagedListHolder.getPageCount());
	    
		List<GenreType> genres = repo.getAllGenreTypes();
		model.addAttribute("genres", genres);
		
		model.addAttribute("selectedYear", null);
	    model.addAttribute("selectedGenres", null);

		
		return "viewAllTvShows";
	}
	
	@PostMapping("/filterFormForTV")
	public String moviesFilter(
			@RequestParam(value = "year", required = false) String year,
			@RequestParam(value = "genre", required = false) List<String> genres,
			@RequestParam(value="page", defaultValue = "1") int page,
			Model model, 
			HttpSession session) {
		
		List<Tvshow> filterTvShows = repo.filterTvShowsByYearAndGenres(year, genres);
		PagedListHolder<Tvshow> pagedListHolder = new PagedListHolder<>(filterTvShows);
		pagedListHolder.setPageSize(6); // 7 moives per page
		pagedListHolder.setPage(page - 1); // zero-based index
		
		int maxPages = pagedListHolder.getPageCount(); 
		
		model.addAttribute("tvShows", pagedListHolder.getPageList());
		model.addAttribute("page", page);
		model.addAttribute("maxPages", maxPages);
		
		/* model.addAttribute("movies",filterMovies); */
		model.addAttribute("genres", repo.getAllGenreTypes());
		
		// For persistence in pagination links
	    model.addAttribute("selectedYear", year);
	    model.addAttribute("selectedGenres", genres);
		
		return "viewAllTvShows";
	}
}
