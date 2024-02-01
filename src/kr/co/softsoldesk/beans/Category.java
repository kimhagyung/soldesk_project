package kr.co.softsoldesk.beans;

import java.util.List;

public class Category {
		private String id;
	    private String title;
	    private List<String> items;
		 
		public Category(String id, String title, List<String> items) {
			super();
			this.id = id;
			this.title = title;
			this.items = items;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public List<String> getItems() {
			return items;
		}
		public void setItems(List<String> items) {
			this.items = items;
		}
	    
	    
}
