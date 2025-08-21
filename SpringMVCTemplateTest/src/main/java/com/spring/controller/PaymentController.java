package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import com.spring.model.Package;
import com.spring.model.Payment;
import com.spring.repository.PackageRepo;
import com.spring.repository.PaymentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PaymentController { 
	
	 @Autowired
	    private PackageRepo pkgrepo;

    @Autowired
    private PaymentRepository paymentRepo;
    
    @GetMapping("/showPaymentForm")
    public String showPaymentForm(@RequestParam("packageId") int packageId, Model model) {
    	 Package pkg = pkgrepo.getPackageById(packageId);
         if (pkg == null) {
             return "redirect:/packages";
         }
        model.addAttribute("packageId", packageId);
        return "payment/paymentForm"; // Replace with your actual JSP name
    }


    @PostMapping("/makePayment")
    public String makePayment(@RequestParam("packageId") int packageId,
                              @RequestParam("paymentMethodId") int methodId,
                              @RequestParam("screenshot") MultipartFile screenshot,
                              HttpSession session) throws IOException {

        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) return "redirect:/login";

        String contentType = screenshot.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            return "redirect:/errorPage";
        }

        // Sanitize filename and define path
        String originalFilename = screenshot.getOriginalFilename();
        String safeFilename = originalFilename.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
        String filename = System.currentTimeMillis() + "_" + safeFilename;
        String uploadDir = "C:/uploads/screenshots/";
        File uploadPath = new File(uploadDir);
        if (!uploadPath.exists()) uploadPath.mkdirs();

        // Save screenshot to disk
        File dest = new File(uploadDir + filename);
        screenshot.transferTo(dest);

        // Create payment record
        Payment payment = new Payment();
        payment.setUserId(userId);
        payment.setPackageId(packageId);
        payment.setPaymentMethodId(methodId);
        payment.setPaymentDate(new Date());
        payment.setScreenshot_path(filename);
        payment.setStatus("PENDING");
        paymentRepo.insertPayment(payment);

        return "redirect:/paymentConfirmation";
    }

}
