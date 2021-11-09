package Model.Bo;

import java.util.ArrayList;

import Model.Bean.*;
import Model.Dao.*;

public class CustomerBo {
	private CustomerDao customerDao = new CustomerDao();

	public ArrayList<Customer> getCustomers() throws Exception {
		return customerDao.getCustomers();
	}

	public Customer Login(String st, String pass) throws Exception {
		return customerDao.getCustomer(st, pass);
	}

	public int Register(String name, String phone, String email, String address, String pass) throws Exception {
		Customer c = new Customer(0, name, phone, email, address, pass, false);
		return customerDao.insertCustomer(c);
	}
}