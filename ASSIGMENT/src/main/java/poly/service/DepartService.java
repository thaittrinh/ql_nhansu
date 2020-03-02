package poly.service;

import java.util.List;

import poly.model.Depart;
import poly.response.PageResult;
import poly.response.ServiceResult;

public interface DepartService {
	List<Depart> findAll();
	//page vị trí page chọn trong phân trang.
	//List<Depart> 
	
	ServiceResult findAllPage(int page,String name);
	List<Depart> findLikeName(String name);
	Depart findById(String id);
	ServiceResult deleteDepart(Depart depart);
	ServiceResult insertDepart(Depart depart);
	ServiceResult updateDepart(Depart depart);
	
	
}
