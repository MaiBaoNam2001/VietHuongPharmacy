package Entity;

public class Drug implements Cloneable{
	private String id;
	private String name;
	private String uses;
	private String ingredient;
	private String unit;
	private String origin;
	private double price;
	private int quantity;
	private DrugType drugType;
	public Drug() {}
	public Drug(String id, String name, String uses, String ingredient, String unit, String origin, double price,
			int quantity, DrugType drugType) {
		super();
		this.id = id;
		this.name = name;
		this.uses = uses;
		this.ingredient = ingredient;
		this.unit = unit;
		this.origin = origin;
		this.price = price;
		this.quantity = quantity;
		this.drugType = drugType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUses() {
		return uses;
	}
	public void setUses(String uses) {
		this.uses = uses;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public DrugType getDrugType() {
		return drugType;
	}
	public void setDrugType(DrugType drugType) {
		this.drugType = drugType;
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
