package poly.response;

public class ServiceResult {
	
	private Status status = Status.NONE;
	private String message;
	private Object data;
	
	public ServiceResult(Status status,String message,Object data) {
		this.status = status;
		this.message = message;
		this.data = data;
	}
	
	
	
	public enum Status{
		NONE,SUCCESS,FAIL;
	}

	
	
	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}



}
