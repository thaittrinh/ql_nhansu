package poly.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import poly.model.Staff;
import poly.response.ServiceResult;

public interface StaffService {
	
	
	List<Staff> findAll();
	
	List<Staff> findTop10();
	
	ServiceResult findAllPage(int page,String name);
	
	List<Staff> findLikeName(String name);
	
	Staff findById(int id);
	
	Integer maxId();
	
	ServiceResult insertStaff(Staff staff,MultipartFile multipartFile);
	
	ServiceResult updateStaff(Staff staff,MultipartFile multipartFile);
	
	ServiceResult deleteStaff(int id);
	
	
	
}
