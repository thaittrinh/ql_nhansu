package poly.controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import poly.model.Record;
import poly.service.RecordService;
import poly.service.StaffService;

@Controller
@RequestMapping("/admin/records")
public class RecordController {
@Autowired
RecordService recordService;

@Autowired
StaffService staffService;

	
	@GetMapping()
	 public String home(ModelMap model
 							   ,@RequestParam(value = "page", defaultValue = "1") int page					  
 							 ,@RequestParam(value = "id_staff", required = false) String id_staff) {
			
		model.addAttribute("Records", recordService.findAllPage(page, id_staff));	
		return "admin/qlthanhtich";
	}
	
	
	@GetMapping("/search")
	public String search(ModelMap model,@RequestParam("id_staff") String id_staff) {
		
		model.addAttribute("Records", recordService.findAllPage(1, id_staff));	
		model.addAttribute("Staff",staffService.findById(Integer.parseInt(id_staff)));
		return "admin/qlthanhtich";
	}
	
	@GetMapping("/delete")
	public String delete(ModelMap model,@RequestParam("id") int id) {
		
		Record record = recordService.findById(id);
		model.addAttribute("Records", recordService.deleteRecord(record));			
		return "admin/qlthanhtich";
	}
	
	@PostMapping(params = "update")
	public String update(ModelMap model,@ModelAttribute("Record") Record record) {
		
		model.addAttribute("Records", recordService.updateRecord(record));		
		return "admin/qlthanhtich";
	}
	
	
	@PostMapping(params = "insert")
	public String insert(ModelMap model,@ModelAttribute("Record") Record record) {
		
		model.addAttribute("Records", recordService.insertRecord(record));	
		return "admin/qlthanhtich";
	}
	
	@ModelAttribute("Record")
	public Record getRecord() {
		return new Record();
	}
}
