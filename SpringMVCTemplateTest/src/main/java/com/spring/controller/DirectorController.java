package com.spring.controller;

import com.spring.model.Director;
import com.spring.repository.DirectorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class DirectorController {

    @Autowired
    private DirectorRepository directorRepository;

    @GetMapping("/di")
    public String showAddForm(Model model) {
        model.addAttribute("director", new Director());
        return "director/add-director";
    }

    @GetMapping("/directors")
    public String showDirectors(Model model) {
        List<Director> directors = directorRepository.getAllDirectors();
        model.addAttribute("directors", directors);
        return "director/director-list";
    }

    @PostMapping("/directors")
    public String addDirector(@ModelAttribute Director director, RedirectAttributes redirectAttributes) {
        int result = directorRepository.addDirector(director);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("message", "Director added successfully");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to add director");
        }
        return "redirect:/directors";
    }

    @GetMapping("/directors/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model, RedirectAttributes redirectAttributes) {
        Director director = directorRepository.getDirectorById(id);
        if (director != null) {
            model.addAttribute("director", director);
            return "director/edit-director";
        }
        redirectAttributes.addFlashAttribute("error", "Director not found");
        return "redirect:/directors";
    }

//    @PostMapping("/directors/update")
//    public String updateDirector(@ModelAttribute Director director, RedirectAttributes redirectAttributes) {
//        int result = directorRepository.updateDirector(director);
//        if (result > 0) {
//            redirectAttributes.addFlashAttribute("message", "Director updated successfully");
//        } else {
//            redirectAttributes.addFlashAttribute("error", "Failed to update director");
//        }
//        return "redirect:/directors";
//    }

//    @GetMapping("/directors/delete/{id}")
//    public String deleteDirector(@PathVariable int id, RedirectAttributes redirectAttributes) {
//        int result = directorRepository.deleteDirector(id);
//        if (result > 0) {
//            redirectAttributes.addFlashAttribute("message", "Director deleted successfully");
//        } else {
//            redirectAttributes.addFlashAttribute("error", "Failed to delete director");
//        }
//        return "redirect:/directors";
//    }
}