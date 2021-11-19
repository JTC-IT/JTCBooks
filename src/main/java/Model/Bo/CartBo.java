package Model.Bo;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.Bill;
import Model.Bean.Book;
import Model.Bean.CartItem;
import Model.Dao.BillDao;
import Model.Dao.CartDao;

public class CartBo {
	private ArrayList<CartItem> Cart;
	private Bill bill;

	public Bill getBill() {
		return bill;
	}

	public String getDateOrder() {
		return bill.getDateAddToString();
	}

	public CartBo() {
		super();
		Cart = new ArrayList<CartItem>();
		bill = new Bill();
	}
	
	public CartBo(Bill bill) throws Exception {
		this.bill = new Bill(bill);
		
		CartDao cartDao = new CartDao();
		Cart = cartDao.getBillDetail(bill.getId());
	}

	public void addCartItem(int bookId) throws Exception {
		for (CartItem item : Cart) {
			if (item.getId() == bookId) {
				if (item.getAmount() < 5)
					item.addAmount();
				return;
			}
		}

		Book book = new BookBo().getBook(bookId);
		if (book != null)
			Cart.add(new CartItem(book.getId(), book.getName(), book.getAuthor(), book.getImg(), book.getPrice(), 1));
	}

	public String setAmount(int bookId, int amount) {
		for (CartItem item : Cart)
			if (item.getId() == bookId) {
				item.setAmount(amount);
				return item.moneyToString();
			}
		return null;
	}

	public ArrayList<CartItem> getCart() {
		return Cart;
	}

	public CartItem getCartItem(int bookId) {
		for (CartItem item : Cart)
			if (item.getId() == bookId)
				return item;
		return null;
	}

	public int size() {
		return Cart.size();
	}

	public String getThanhTien() {
		long sum = 0;
		for (CartItem item : Cart) {
			sum += item.getMoney();
		}
		return new DecimalFormat("###,###,###").format(sum) + " đ";
	}

	public void payCart(int customerId, String address) throws Exception {
		if (size() < 1)
			return;
		CartDao cartDao = new CartDao();
		BillDao billDao = new BillDao();
		bill.setId(billDao.createBill(customerId, address));

		if (bill.getId() > 0) {
			for (CartItem item : Cart)
				cartDao.saveCartItem(bill.getId(), item.getId(), item.getAmount());
			bill.setDateAdd(new Date());
		}
	}

	public void aceptCart(int customerId, String address) throws Exception {
		if (size() < 1)
			return;
		CartDao cartDao = new CartDao();
		BillDao billDao = new BillDao();
		bill.setId(billDao.createBill(customerId, address));

		if (bill.getId() > 0) {
			for (CartItem item : Cart)
				cartDao.saveCartItem(bill.getId(), item.getId(), item.getAmount());
			bill.setDateAdd(new Date());
		}
	}

	public void removeItem(int bookId) {
		for (CartItem item : Cart)
			if (item.getId() == bookId) {
				Cart.remove(item);
				return;
			}
	}

	public void clearCart() {
		Cart.clear();
	}
}
