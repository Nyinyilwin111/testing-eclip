package com.spring.controller;

import com.spring.model.Package;
import com.spring.repository.AdminRepoPackage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class AdminPackageController {

    @Autowired
    private AdminRepoPackage repo;
    
    @GetMapping("/AdminPackageAdd")
    public String showAddForm(Model model) {
        model.addAttribute("pkg", new Package());
        return "adminPackage/add-package";
    }

   
    @PostMapping("/AdminPackageAddSave")
    public String savePackage(@ModelAttribute("pkg") Package pkg) {
        repo.insertnewPackage(pkg);
        return "redirect:/AdminPackages";
    }
    
    @GetMapping("/AdminPackages")
    public String listPackages(Model model) {
        List<Package> packages = repo.getAllPackages();
        model.addAttribute("packages", packages);
        return "adminPackage/Package List";
    }

    @GetMapping("/AdminPackageEdit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        Package pkg = repo.getPackageById(id);
        model.addAttribute("pkg", pkg);
        return "adminPackage/edit-package";
    }

  
    @PostMapping("/AdminPackageUpdate")
    public String updatePackage(@ModelAttribute("pkg") Package pkg) {
        repo.updatePackage(pkg);
        return "redirect:/AdminPackages";
    }

  
    @GetMapping("/AdminPackageDelete/{id}")
    public String deletePackage(@PathVariable int id) {
        repo.deletePackageById(id);
        return "redirect:/AdminPackages";
    }

}
