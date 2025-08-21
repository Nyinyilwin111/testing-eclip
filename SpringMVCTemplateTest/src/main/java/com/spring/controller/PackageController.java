package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.spring.repository.PackageRepo;
import com.spring.model.Package;  // Make sure your Package model is imported

@Controller
public class PackageController {

    @Autowired
    private PackageRepo pkgrepo;
    
    @GetMapping("/packages")
    public String showAllPackages(Model m) {
        List<Package> packages = pkgrepo.getAllPackages();
        m.addAttribute("packages", packages);
        return "package/packageList";  
    }
}

