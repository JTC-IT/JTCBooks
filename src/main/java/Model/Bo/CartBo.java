package Model.Bo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.Book;
import Model.Bean.CartItem;
import Model.Dao.CartDao;

public class CartBo {
	private ArrayList<CartItem> Cart;
	private int id;
	private Date dateOrder;

	public int getId() {
		return id;
	}

	public String getDateOrder() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm aa");
		return sdf.format(dateOrder);
	}

	public CartBo() {
		super();
		Cart = new ArrayList<CartItem>();
		id = 0;
		dateOrder = new Date();
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
		id = cartDao.createBill(customerId, address);

		if (id > 0) {
			for (CartItem item : Cart)
				cartDao.saveCartItem(id, item.getId(), item.getAmount());
			dateOrder = new Date();
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
