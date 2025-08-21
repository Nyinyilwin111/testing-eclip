package com.spring.controller;

import java.util.Date;
import java.util.Calendar;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.spring.model.Package;
import com.spring.model.Subscription;
import com.spring.repository.PackageRepo;
import com.spring.repository.SubscriptionRepo;

@Controller
public class SubscriptionController {
    
    @Autowired
    private PackageRepo pkgrepo;
    
    @Autowired
    private SubscriptionRepo subscriptionRepo;

    @GetMapping("/subscriptionForm")
    public String showSubscriptionForm(@RequestParam("packageId") int packageId, Model model) {
        Package pkg = pkgrepo.getPackageById(packageId);
        if (pkg == null) {
            return "redirect:/packages";
        }
        model.addAttribute("packageId", packageId);
        model.addAttribute("packageName", pkg.getName());
        return "subscription/subscriptionForm";
    }
    
    @PostMapping("/subscribe")
    public String subscribe(@RequestParam("packageId") int packageId, HttpSession session, Model model) {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }
        
        Package selectedPackage = pkgrepo.getPackageById(packageId);
        if (selectedPackage == null) {
            return "redirect:/packages";
        }

        Date startDate = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(startDate);
        cal.add(Calendar.DAY_OF_MONTH, selectedPackage.getDuration_in_days());
        Date endDate = cal.getTime();

        Subscription sub = new Subscription();
        sub.setUserId(userId);
        sub.setPackageId(packageId);
        sub.setStartDate(startDate);
        sub.setEndDate(endDate);

        subscriptionRepo.insertSubscription(sub);

        return "redirect:/showPaymentForm?packageId=" + packageId;
    }
}