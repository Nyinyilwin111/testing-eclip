package com.spring.controller;

import java.util.List;

import com.spring.model.Payment;
import com.spring.repository.AdminPaymentRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller

public class AdminPaymentController {

    @Autowired
    private AdminPaymentRepo paymentRepo;

    @GetMapping("/payments")
    public String viewPayments(Model model) {
        List<Payment> payments = paymentRepo.getAllPayments();
        model.addAttribute("payments", payments);
        return "adminPayment/adminpayment"; // JSP path
    }

    @PostMapping("/approvePayment")
    public String approvePayment(@RequestParam("paymentId") int paymentId) {
        paymentRepo.updatePaymentStatus(paymentId, "APPROVED");
        return "redirect:/payments";
    }

    @PostMapping("/rejectPayment")
    public String rejectPayment(@RequestParam("paymentId") int paymentId) {
        paymentRepo.updatePaymentStatus(paymentId, "REJECTED");
        return "redirect:/payments";
    }
    @GetMapping("/editPayment")
    public String editPaymentForm(@RequestParam("id") int id, Model model) {
        Payment payment = paymentRepo.getPaymentById(id);
        model.addAttribute("payment", payment);
        return "adminPayment/editpayment"; // JSP file
    }

    @PostMapping("/updatePayment")
    public String updatePayment(@ModelAttribute("payment") Payment payment) {
        paymentRepo.updatePayment(payment);
        return "redirect:/payments";
    }

    @PostMapping("/deletePayment")
    public String deletePayment(@RequestParam("paymentId") int id) {
        paymentRepo.deletePayment(id);
        return "redirect:/payments";
    }

}
