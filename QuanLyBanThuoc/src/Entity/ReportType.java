package Entity;

public class ReportType implements Cloneable{
	private int type;
	private double sales;
	public ReportType() {}
	public ReportType(int type, double sales) {
		super();
		this.type = type;
		this.sales = sales;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public double getSales() {
		return sales;
	}
	public void setSales(double sales) {
		this.sales = sales;
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
