package konichiwa.model;

public class Item_Category {
	String name;
	
	public Item_Category() {}

	public Item_Category(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Item_Category [name=" + name + "]";
	};
	
}
