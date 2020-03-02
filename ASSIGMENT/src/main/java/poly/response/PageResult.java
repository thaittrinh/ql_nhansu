package poly.response;

public class PageResult {
	//Phân  trang & tìm kiếm
		private int totalPage;
		private int startPage;
		//private int item ;
		private String name;
		private Object listItem;
		
		
		public PageResult(int totalPage, int startPage, String name, Object listItem) {
			this.totalPage = totalPage;
			this.startPage = startPage;
			this.name = name;
			this.listItem = listItem;
		}
		
		
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getTotalPage() {
			return totalPage;
		}
		public void setTotalPage(int totalPage) {
			this.totalPage = totalPage;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public Object getListItem() {
			return listItem;
		}
		public void setListItem(Object listItem) {
			this.listItem = listItem;
		}
		
		
}
