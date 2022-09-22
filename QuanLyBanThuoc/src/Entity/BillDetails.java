package Entity;

public class BillDetails implements Cloneable{
	private Bill bill;
	private Drug drug;
	private String unit;
	private int quantity;
	private double unitPrice;
	public BillDetails() {}
	public BillDetails(Bill bill, Drug drug, String unit, int quantity, double unitPrice) {
		super();
		this.bill = bill;
		this.drug = drug;
		this.unit = unit;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
	}
	public Bill getBill() {
		return bill;
	}
	public void setBill(Bill bill) {
		this.bill = bill;
	}
	public Drug getDrug() {
		return drug;
	}
	public void setDrug(Drug drug) {
		this.drug = drug;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
