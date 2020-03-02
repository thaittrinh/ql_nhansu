package poly.controller.admin;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.model.Depart;
import poly.model.Record;
import poly.model.Staff;
import poly.response.ServiceResult;
import poly.service.DepartService;
import poly.service.Mailer;
import poly.service.RecordService;
import poly.service.StaffService;

@Controller
@RequestMapping("/admin/staffs")
public class StaffController {
	@Autowired
	StaffService staffService;
	
	@Autowired
	Mailer mailer;
	

	@GetMapping("")
	public String home(ModelMap model
				,@RequestParam(value = "page", defaultValue = "1") int page
				,@RequestParam(value = "name_nv", defaultValue = "") String name) {
		
		model.addAttribute("Staffs", staffService.findAllPage(page, name));	
		model.addAttribute("Staff", new Staff());
		return "admin/qlnhanvien";
	}

	
	@GetMapping("/delete")
	public String delete(ModelMap model, @RequestParam("id") int id) {
		
			model.addAttribute("Staffs", staffService.deleteStaff(id));	
			model.addAttribute("Staff", new Staff());
			return "admin/qlnhanvien";
	}

	@PostMapping(params = "insert")
	public String insert(ModelMap model, @ModelAttribute("Staff") Staff staff,
			@RequestParam("imageNew") MultipartFile photo) {
		
		model.addAttribute("Staffs", staffService.insertStaff(staff, photo));	
		model.addAttribute("Staff",staffService.findById(staffService.maxId()));
		return "admin/qlnhanvien";
	}

	@PostMapping(params = "update")
	public String update(ModelMap model, @ModelAttribute("Staff") Staff staff,
			@RequestParam("imageNew") MultipartFile photo) {

		model.addAttribute("Staffs", staffService.updateStaff(staff, photo));	
		model.addAttribute("Staff",staffService.findById(staff.getId()));
		return "admin/qlnhanvien";
	
	}
	

	@GetMapping("/record/like")
	public String recordLike(ModelMap model,@RequestParam(value= "idStaffR", defaultValue = "0") int id,
							@RequestParam("reason") String reason) {
		
		model.addAttribute("Records", insertRecord(id,reason,false));
		model.addAttribute("Record", new Record());
		
		return "admin/qlthanhtich";
	}
	
	
	
	@GetMapping("/record/dislike")
	public String recordDislike(ModelMap model,@RequestParam(value= "idStaffR", defaultValue = "0") int id,
							@RequestParam("reason") String reason) {
	
		model.addAttribute("Records", insertRecord(id,reason,true));
		model.addAttribute("Record", new Record());
		
		return "admin/qlthanhtich";
	}

	
	@Autowired
	DepartService departService;
	@ModelAttribute("Departs")
	public List<Depart> phongban() {
		return departService.findAll();
	}

	
	@Autowired
	RecordService recordService;
	public ServiceResult insertRecord(int id, String reason, boolean type) {
		Staff staff = new Staff();
			staff.setId(id);
	    Record record = new Record();
			record.setReason(reason);
			record.setType(type);
			record.setDate(new Date());
			record.setStaff(staff);
		return recordService.insertRecord(record);
	}
	
}
