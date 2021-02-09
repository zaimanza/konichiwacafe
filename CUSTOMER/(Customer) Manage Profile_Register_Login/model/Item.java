package konichiwa.model;

import java.util.List;

public class Item {
	private int itemid;
	private String name;
	private Double price;
	private String image;
	private int stock;
	private String description;
	private String itemcategoryid;
	private List<Item> items;
	
	public Item () {}

	public Item(int itemid, String name, Double price, String image, int stock, String description,String itemcategoryid) {
		this.itemid = itemid;
		this.name = name;
		this.price = price;
		this.image = image;
		this.stock = stock;
		this.description = description;
		this.itemcategoryid = itemcategoryid;
	}
	
	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getItemcategoryid() {
		return itemcategoryid;
	}

	public void setItemcategoryid(String itemcategoryid) {
		this.itemcategoryid = itemcategoryid;
	}
	
	public List<Item> getItems(){
		return items;
	}
	
	public void setItems(List<Item> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "Item [description=" + description + ", image=" + image + ", name=" + name + ", price=" + price
				+ ", stock=" + stock + "]";
	};
}
