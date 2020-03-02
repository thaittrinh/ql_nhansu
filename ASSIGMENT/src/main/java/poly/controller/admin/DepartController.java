package poly.controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.model.Depart;
import poly.service.DepartService;

@Controller
@RequestMapping("/admin/departs")
public class DepartController {
	@Autowired
	DepartService departService;
	
	
	@GetMapping()
	public String home(ModelMap model				
			            ,@RequestParam(value = "page",defaultValue = "1") int page								 	
			            ,@RequestParam(value = "name_depart", defaultValue = "") String name
			   ) {
		
			model.addAttribute("Departs",departService.findAllPage(page, name) );
			model.addAttribute("Depart",new Depart());
		return "admin/qlphongban";
	}
	
		
	@RequestMapping("/delete")
	public String delete(ModelMap model, @RequestParam("id") String maPB) {
		Depart depart = new Depart();
		depart.setId(maPB);
		
		model.addAttribute("Departs", departService.deleteDepart(depart));
		model.addAttribute("Depart",new Depart());
	    return "admin/qlphongban";
	}
	
	 
	@PostMapping(params = "insert")
	public String insert(ModelMap model, @ModelAttribute("Depart") Depart depart) {				
	
		model.addAttribute("Departs", departService.insertDepart(depart));
		//model.addAttribute("Depart",new Depart());
	    return "admin/qlphongban";	
	}
	
	
	
	@PostMapping(params = "update")
	public String update(ModelMap model, @ModelAttribute("Depart") Depart depart) {
		// Không add Depart vì muốn giữ lại depart trên form
		model.addAttribute("Departs", departService.updateDepart(depart));
	   
	    return "admin/qlphongban";	
	}

	
}
