package konichiwa.model;

import java.util.List;

public class Item_Category {
	private int itemcategoryid;
	private String categoryname;
	private List<Item_Category> itemcategory;
	
	public Item_Category() {}
	
	public Item_Category(int itemcategoryid, String categoryname) {
		this.categoryname = categoryname;
		this.itemcategoryid = itemcategoryid;
	}

	public int getItemcategoryid() {
		return itemcategoryid;
	}

	public void setItemcategoryid(int itemcategoryid) {
		this.itemcategoryid = itemcategoryid;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	
	
	public List<Item_Category> getItemcategory() {
		return itemcategory;
	}

	public void setItemcategory(List<Item_Category> itemcategory) {
		this.itemcategory = itemcategory;
	}


}
