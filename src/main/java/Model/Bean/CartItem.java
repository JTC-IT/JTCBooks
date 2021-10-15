package Model.Bean;

import java.text.DecimalFormat;

public class CartItem {
	private int Id;
	private String Name;
	private String Author;
	private String Img;
	private int Price;
	private int Amount;
	
	public CartItem(int id, String name, String author, String img, int price, int amount) {
		super();
		Id = id;
		Name = name;
		Author = author;
		Img = img;
		Price = price;
		Amount = amount;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getImg() {
		return Img;
	}
	public void setImg(String img) {
		Img = img;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public void addAmount() {
		Amount++;
	}
	public String priceToString() {
		return new DecimalFormat("###,###,###").format(Price)+" đ";
	}
	
	public int getMoney() {
		return Amount*Price;
	}
	
	public String moneyToString() {
		return new DecimalFormat("###,###,###").format(getMoney())+" đ";
	}
}
