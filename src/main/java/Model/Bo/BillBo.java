package Model.Bo;

import java.util.ArrayList;

import Model.Bean.Bill;
import Model.Dao.BillDao;

public class BillBo {
	
	public ArrayList<CartBo> getBillsByCustomer(int customerId) throws Exception
	{
		ArrayList<CartBo> list = new ArrayList<CartBo>();
		
		BillDao billDao = new BillDao();
		for(Bill bill: billDao.getBillsByCustomer(customerId)) {
			list.add(new CartBo(bill));
		}
		
		return list;
	}
	
	public ArrayList<CartBo> getBills() throws Exception
	{
		ArrayList<CartBo> list = new ArrayList<CartBo>();
		
		BillDao billDao = new BillDao();
		for(Bill bill: billDao.getBills()) {
			list.add(new CartBo(bill));
		}
		
		return list;
	}
	
	public int getQuantityBills() throws Exception{
		BillDao billDao = new BillDao();
		return billDao.getQuantityBills();
	}
	
	public void aceptBill(int id) throws Exception
	{
		BillDao billDao = new BillDao();
		billDao.aceptBillDetails(id);
		billDao.aceptBill(id);
	}
	
	public void removeBill(int id) throws Exception
	{
		BillDao billDao = new BillDao();
		billDao.removeBillDetails(id);
		billDao.removeBill(id);
	}
}
