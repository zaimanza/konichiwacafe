package konichiwa.model;

import java.util.ArrayList;
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
	private int quantity = 0;
	
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
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Item [description=" + description + ", image=" + image + ", name=" + name + ", price=" + price
				+ ", stock=" + stock + "]";
	};
	
	//adib
	public boolean check(ArrayList<Integer> cartlist, int itemid2) {
		for(Integer itemid : cartlist) {
			if(itemid ==itemid2) 
				return true;
		}
		return false;
	}

	
}
