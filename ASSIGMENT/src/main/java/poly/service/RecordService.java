package poly.service;

import java.util.List;

import poly.model.Record;
import poly.response.ServiceResult;

public interface RecordService {
    List<Record>  findAll();
	
	ServiceResult findAllPage(int page, String idStaff);
	
	ServiceResult findByStaffId(String staffid);
	
	Record findById(int id);
	 
	ServiceResult deleteRecord(Record record);
	
	ServiceResult insertRecord(Record record);
	
	ServiceResult updateRecord(Record record);
}
