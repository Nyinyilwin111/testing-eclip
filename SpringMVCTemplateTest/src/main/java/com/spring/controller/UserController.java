package com.spring.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


import com.spring.repository.adminrepo;
import com.spring.service.adminservice;

import java.text.ParseException;

import com.spring.model.adminbean;

@Controller
public class UserController {
	
	

    @Autowired
    private adminservice service;

    @GetMapping("/adminform")
    public ModelAndView admin() {
        return new ModelAndView("admin12", "admin1", new adminbean());
    }

    @PostMapping("/adminform4")
    public String Adminprocess(
         @ModelAttribute("admin1") @Validated adminbean data,
        BindingResult result,
        Model model
    ) {
        if (result.hasErrors()) {
            return "admin12"; // Return to form with errors
        }

        int i = service.registerAdmin(data);

        if (i > 0) {
            return "redirect:/login";
        } else {
            model.addAttribute("error", "Insert failed!");
            return "redirect:/adminform";
        }
    }
    
    @GetMapping("/movieupload")
    public String mv() {
    	  return "redirect:/movies";
    }
}

