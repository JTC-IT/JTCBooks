package Model.Bean;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Book {
	private int Id;
	private String Name;
	private String Author;
	private int Amount;
	private int Price;
	private String Img;
	private int CategoryId;
	private Date DateAdd;

	public Book(int id, String name, String author, int amount, int price, String img, int categoryId, Date dateAdd) {
		super();
		Id = id;
		Name = name;
		Author = author;
		Amount = amount;
		Price = price;
		Img = img;
		CategoryId = categoryId;
		DateAdd = dateAdd;
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

	public int getAmount() {
		return Amount;
	}

	public void setAmount(int amount) {
		Amount = amount;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	}

	public String getImg() {
		return Img;
	}

	public void setImg(String img) {
		Img = img;
	}

	public int getCategoryId() {
		return CategoryId;
	}

	public void setCategoryId(int categoryId) {
		CategoryId = categoryId;
	}

	public Date getDateAdd() {
		return DateAdd;
	}

	public void setDateAdd(Date dateAdd) {
		DateAdd = dateAdd;
	}

	public String priceToString() {
		return new DecimalFormat("###,###,###").format(Price) + " đ";
	}

	public String dateAddToString() {
		return new SimpleDateFormat("dd-MM-yyyy hh:mm").format(DateAdd);
	}
}