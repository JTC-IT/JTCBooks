package Model.Bean;

public class Customer {
	private int Id;
	private String Name;
	private String Phone;
	private String Email;
	private String Password;
	private boolean Admin;
	public Customer(int id, String name, String phone, String email, String password, boolean admin) {
		super();
		Id = id;
		Name = name;
		Phone = phone;
		Email = email;
		Password = password;
		Admin = admin;
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
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public boolean isAdmin() {
		return Admin;
	}
	public void setAdmin(boolean admin) {
		Admin = admin;
	}
}
