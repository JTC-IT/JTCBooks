package Model.Bo;

import java.util.ArrayList;

import Model.Bean.*;
import Model.Dao.*;

public class CustomerBo {
	private CustomerDao customerDao = new CustomerDao();
	
	public ArrayList<Customer> getCustomers(){
		return customerDao.getCustomers();
	}

	public Customer Login(String st, String pass) {
		for(Customer c: getCustomers()) {
			if((c.getPhone().trim().equals(st) || c.getEmail().trim().equals(st)) && c.getPassword().trim().equals(pass))
				return c;
		}
		return null;
	}
}