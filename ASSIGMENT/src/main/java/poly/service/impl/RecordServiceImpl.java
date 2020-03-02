package poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.dao.RecordDao;
import poly.dao.StaffDao;
import poly.model.Record;
import poly.model.Staff;
import poly.response.PageResult;
import poly.response.ServiceResult;
import poly.response.ServiceResult.Status;
import poly.service.Mailer;
import poly.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService {
	@Autowired
	RecordDao recordDao;

	@Autowired
	StaffDao staffDao;

	@Autowired
	Mailer mailer;

	@Override
	public List<Record> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult findAllPage(int page, String id_staff) {

		return new ServiceResult(Status.NONE, null, setUpPage(page, id_staff));

	}

	@Override
	public ServiceResult findByStaffId(String id_staff) {

		return new ServiceResult(Status.NONE, null, setUpPage(1, id_staff));
	}

	@Override
	public Record findById(int id) {

		return recordDao.findById(id);
	}

	@Override
	public ServiceResult deleteRecord(Record record) {

		String message ="Xóa đánh giá thành công!";
		Status status = Status.SUCCESS;

		if (recordDao.deleteRecord(record)) {
			Staff staff = staffDao.findById(record.getStaff().getId());
			String body = "";
			if (record.getType()) {
				body = "Bạn đã bị xóa 1 điểm cộng thành tích ";
			} else {
				body = "Bạn đã được xóa 1 điểm phạt";
			}

			mailer.sendEmail("ABCGROUP", staff.getEmail(), "Đánh giá nhân viên", body);
		}
		else {
			 message = "Xóa đánh giá thất bại!";
			 status = Status.FAIL;
		}

		return new ServiceResult(status, message, setUpPage(1, null));
	}

	@Override
	public ServiceResult insertRecord(Record record) {
		String message ="Thêm đánh giá thành công!";
		Status status = Status.SUCCESS;
		
		if (recordDao.insertRecord(record)) {	
			Staff staff = staffDao.findById(record.getStaff().getId());
			String body = "";
			if (record.getType()) {
				body="Bạn đã được 1 điểm cộng vào thành tích cá nhân. Lý do: " +record.getReason();
			}
			else {
				body="Bạn đã bị trừ 1 điểm trong thành tích cá nhân. Lý do: " +record.getReason();
			}
			
			mailer.sendEmail("ABCGROUP", staff.getEmail(), "Đánh giá nhân viên", body);
		}
		else {
			 message = "Thêm đánh giá thất bại!";
			 status = Status.FAIL;
		}
		
		return new ServiceResult(status, message, setUpPage(1, null));
	}

	@Override
	public ServiceResult updateRecord(Record record) {
		String message ="Cập nhật đánh giá thành công!";
		Status status = Status.SUCCESS;
		
		if (recordDao.updateRecord(record)) {
			Staff staff = staffDao.findById(record.getStaff().getId());
			String body = "";
			if (record.getType()) {
				body="Thành tích của bạn đã được cập nhật lại +1 điểm . Lý do: " +record.getReason();
			}
			else {
				body="Thành tích của bạn đã được cập nhật lại -1 điểm. Lý do: " +record.getReason();
			}
			mailer.sendEmail("ABCGROUP", staff.getEmail(), "Đánh giá nhân viên", body);
		}
		else {
			 message ="Cập nhật đánh giá thất bại!";
			 status = Status.FAIL;
			
		}
		
		return new ServiceResult(status, message, setUpPage(1, null));
	}

	public PageResult setUpPage(int page, String id_staff) {

		int maxResult = 6;
		int firstResult = (page - 1) * 6;
		int totalPage = (int) Math.ceil(recordDao.findByStaffId(id_staff).size() / 6.0);

		return new PageResult(totalPage, page, id_staff, recordDao.findAllIndex(firstResult, maxResult, id_staff));
	}


}
