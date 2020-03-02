package poly.service.impl;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import poly.dao.StaffDao;
import poly.model.Staff;
import poly.response.PageResult;
import poly.response.ServiceResult;
import poly.response.ServiceResult.Status;
import poly.service.StaffService;

@Service
public class StaffServiceImpl implements StaffService{
	
	@Autowired
	StaffDao staffDao;
	
	@Override
	public List<Staff> findAll() {
		return staffDao.findAll();
	}

	@Override
	public List<Staff> findTop10() {
		return staffDao.findTop10();
	}

	@Override
	public ServiceResult findAllPage(int page, String name) {		
		
		return  new ServiceResult(Status.NONE, "", setUpPage(page, name));
	}
	
	@Override
	public List<Staff> findLikeName(String name) {
		return staffDao.findLikeName(name);
	}

	
	
	@Override
	public Staff findById(int id) {
		
		return staffDao.findById(id);
	}

	@Override
	public ServiceResult insertStaff(Staff staff, MultipartFile photo) {
		
		if (!photo.isEmpty()) {
			if (saveImage(photo)) {	
				String nameImage = photo.getOriginalFilename();
				staff.setPhoto(nameImage);		
			}
			else {
				return new ServiceResult(Status.FAIL, "Lưu hình không thành công - Thêm nhân viên thất bại", setUpPage(1, ""));
			}						
		} 
		
		if (staffDao.insertStaff(staff)) {
			return new ServiceResult(Status.SUCCESS, "Thêm nhân viên thành công", setUpPage(1, ""));
		}
			
		return new ServiceResult(Status.FAIL, "Thêm nhân viên không thành công", setUpPage(1, ""));
	}

	@Override
	public ServiceResult updateStaff(Staff staff,MultipartFile photo) {	
		if (!photo.isEmpty()) {
			if (saveImage(photo)) {
				staff.setPhoto(photo.getOriginalFilename());
			} else {
			 return new ServiceResult(Status.FAIL, "Lưu hình không thành công - Cập nhật thất bại", setUpPage(1, ""));
			}
		}

		if (staffDao.updateStaff(staff)) {
			return new ServiceResult(Status.SUCCESS, "Cập nhật nhân viên thành công", setUpPage(1, ""));
		}
		
		return new ServiceResult(Status.FAIL, "Cập nhật nhân viên thành công", setUpPage(1, ""));
	}

	@Override
	public ServiceResult deleteStaff(int id) {	
		Staff staff = new Staff(); 
			staff.setId(id);	
		if (staffDao.deleteStaff(staff)) {
			return new ServiceResult(Status.SUCCESS, "Xóa nhân viên thành công", setUpPage(1, ""));
		}
	
	  return new ServiceResult(Status.FAIL, "Xóa nhân viên thất bại", setUpPage(1, ""));			
	}

	@Override
	public Integer maxId() {
		
		return staffDao.maxId();
	}


	public PageResult setUpPage(int page, String name) {
		
		int maxResult = 7; /// là số item trên 1 page
		int firstResult = (page - 1) * maxResult;
		int totalPage = 0;
		List<Staff> listItem =  staffDao.findAllIndex(firstResult, maxResult, name);
		
		if (findLikeName(name).size()>0) {
			 totalPage = (int) Math.ceil(findLikeName(name).size() / 7.0);// 7 số item trên 1 trang.
		}
		
		return new PageResult(totalPage, page, name, listItem);
	}

	
	@Autowired
	ServletContext context;
	public boolean saveImage(MultipartFile photo) {
		try {
			String photoPath = context.getRealPath("/resources/images/" + photo.getOriginalFilename());		
			photo.transferTo(new File(photoPath));
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	
}
