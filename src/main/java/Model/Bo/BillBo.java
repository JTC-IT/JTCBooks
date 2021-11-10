package Model.Bo;

import java.util.ArrayList;

import Model.Bean.Bill;
import Model.Dao.CartDao;

public class BillBo {
	
	public ArrayList<CartBo> getBills(int customerId) throws Exception
	{
		ArrayList<CartBo> list = new ArrayList<CartBo>();
		
		CartDao cartDao = new CartDao();
		for(Bill bill: cartDao.getListBill(customerId)) {
			list.add(new CartBo(bill));
		}
		
		return list;
	}
}
