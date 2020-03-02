package poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.dao.DepartDao;
import poly.model.Depart;
import poly.response.PageResult;
import poly.response.ServiceResult;
import poly.response.ServiceResult.Status;
import poly.service.DepartService;

@Service
public class DepartServiceImpl implements DepartService {
	@Autowired
	DepartDao departDao;

	@Override
	public List<Depart> findAll() {

		return departDao.findAll();
	}

	@Override
	public ServiceResult findAllPage(int page, String name) {
									
		return new ServiceResult(Status.NONE, null,setUpPage(page, name));
	}

	@Override
	public List<Depart> findLikeName(String name) {

		return departDao.findLikeName(name);
	}

	@Override
	public Depart findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult deleteDepart(Depart depart) {
		if (departDao.deleteDepart(depart)) {
			
			return  new ServiceResult(Status.SUCCESS, "Xóa phòng ban thành công!", setUpPage(1, ""));
		} 
			
		  return  new ServiceResult(Status.FAIL, "Xóa phòng ban thất bại!", setUpPage(1, ""));
	}

	@Override
	public ServiceResult insertDepart(Depart depart) {
		if (departDao.insertDepart(depart)) {
			
			return new ServiceResult(Status.SUCCESS, "Thêm phòng ban thành công!", setUpPage(1, ""));
		} 
			
			return  new ServiceResult(Status.FAIL, "Thêm phòng ban thất bại!", setUpPage(1, ""));
	}

	@Override
	public ServiceResult updateDepart(Depart depart) {	
		if (departDao.updateDepart(depart)) {
			
			return new ServiceResult(Status.SUCCESS, "Cập nhật ban thành công!", setUpPage(1, ""));
		}
			
			return new ServiceResult(Status.FAIL, "Cập nhật phòng ban thất bại!", setUpPage(1, ""));	
	}
	
	public PageResult setUpPage(int page, String name) {
		
		int maxResult = 5; /// là số item trên 1 page
		int firstResult = (page - 1) * maxResult;
		int totalPage = 0;
		List<Depart> listItem = departDao.findAllIndex(firstResult, maxResult, name);
		
		if (findLikeName(name).size()>0) {
			 totalPage = (int) Math.ceil(findLikeName(name).size() / 5.0);// 5 số item trên 1 trang.
		}
		
		return new PageResult(totalPage, page, name, listItem);
	}

}
