package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.model.CastBean;
import com.spring.repository.CastRepository;

@Controller
public class CastController {

	@Autowired
     CastRepository castRepository;

    // Show form
    @GetMapping("/cast-form")
    public String showCastForm(Model model) {
        model.addAttribute("cast", new CastBean());
        return "castForm";
    }

    // Handle form post
    @PostMapping("/cast-save")
    public String saveCast(@ModelAttribute("cast")@Validated CastBean cast,BindingResult br, Model model) {
    	
    	if(br.hasErrors()) {
			return"castForm";
		}
    	
    	//cast.setDateOfBirth(new java.sql.Date(System.currentTimeMillis()));
        int result=castRepository.save(cast);
        
        if(result>0) {
        model.addAttribute("message", "🎬 Cast inserted successfully!");
        return "redirect:cast-list";
    }else {
    	
    	model.addAttribute("message", "Cast inserted Faild!");
    	return "castForm";
    	
    }
	
    }
    
    @GetMapping("/cast-list")
    public String listCast(Model model) {
        model.addAttribute("castList", castRepository.findAll());
        return "castList";
    }

    @GetMapping("/cast-delete/{id}")
    public String deleteCast(@PathVariable("id") int id,RedirectAttributes redirectAttributes) {
       int result= castRepository.delete(id);
        if (result > 0) {
            redirectAttributes.addFlashAttribute("msg_success", "Delete successful!");
        } else {
            redirectAttributes.addFlashAttribute("msg_fail", "Delete failed!");
        }
        return "redirect:/cast-list";
    }
    
    @GetMapping("/cast-edit/{id}")
    public String editCast(@PathVariable("id") int id, Model model) {
    	//int Id=Integer.parseInt(id);
        model.addAttribute("cast", castRepository.findById(id));
        return "castedit";  // reuse same form
    }

    @PostMapping("/cast-update")
    public String updateCast(@ModelAttribute("cast")@Validated CastBean cast,BindingResult br, Model model,RedirectAttributes ra) {
    	
    	if(br.hasErrors()) {
			return"castedit";
		}
    	
        int result=castRepository.update(cast);
        
        if(result>0) {
			ra.addFlashAttribute("msg_success","update success!");
			return "redirect:/cast-list";
			
			
		}else {
			model.addAttribute("msg_faid  ","update failD!");
			
			return "castedit";
		}
    }
}
