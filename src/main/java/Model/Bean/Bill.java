package Model.Bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Bill {
	private int Id;
	private int CustomerId;
	private Date DateAdd;
	private String Address;
	private boolean Status;
	
	public Bill() {
		super();
		Id = 0;
		CustomerId = 0;
		DateAdd = new Date();
		Address = "";
		Status = false;
	}

	public Bill(int id, int customerId, Date dateAdd, String address, boolean status) {
		super();
		Id = id;
		CustomerId = customerId;
		DateAdd = dateAdd;
		Address = address;
		Status = status;
	}
	
	public Bill(Bill bill) {
		super();
		Id = bill.getId();
		CustomerId = bill.getCustomerId();
		DateAdd = bill.getDateAdd();
		Address = bill.getAddress();
		Status = bill.isStatus();
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getCustomerId() {
		return CustomerId;
	}

	public void setCustomerId(int customerId) {
		CustomerId = customerId;
	}

	public Date getDateAdd() {
		return DateAdd;
	}
	
	public String getDateAddToString() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm aa");
		return sdf.format(DateAdd);
	}

	public void setDateAdd(Date dateAdd) {
		DateAdd = dateAdd;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public boolean isStatus() {
		return Status;
	}

	public void setStatus(boolean status) {
		Status = status;
	}
}
