package Model.Bo;

import java.util.ArrayList;

import Model.Bean.*;
import Model.Dao.*;

public class CategoryBo {
	CategoryDao categoryDao = new CategoryDao();

	public ArrayList<Category> getCategorys() throws Exception {
		return categoryDao.getCategorys();
	}
}
