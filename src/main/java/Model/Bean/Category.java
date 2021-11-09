package Model.Bean;

public class Category {
	private int Id;
	private String Name;

	public Category() {
		super();
	}

	public Category(int id, String name) {
		super();
		this.Id = id;
		this.Name = name;
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
}
