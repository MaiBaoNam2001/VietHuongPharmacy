package Entity;

import java.util.Date;

public class Report implements Cloneable{
	private String id;
	private int numberOfDrugsSold;
	private int numberOfBills;
	private int numberOfCustomers;
	private double sales;
	private Date date;
	private Employee employee;
	public Report() {}
	public Report(String id, int numberOfDrugsSold, int numberOfBills, int numberOfCustomers, double sales, Date date,
			Employee employee) {
		super();
		this.id = id;
		this.numberOfDrugsSold = numberOfDrugsSold;
		this.numberOfBills = numberOfBills;
		this.numberOfCustomers = numberOfCustomers;
		this.sales = sales;
		this.date = date;
		this.employee = employee;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNumberOfDrugsSold() {
		return numberOfDrugsSold;
	}
	public void setNumberOfDrugsSold(int numberOfDrugsSold) {
		this.numberOfDrugsSold = numberOfDrugsSold;
	}
	public int getNumberOfBills() {
		return numberOfBills;
	}
	public void setNumberOfBills(int numberOfBills) {
		this.numberOfBills = numberOfBills;
	}
	public int getNumberOfCustomers() {
		return numberOfCustomers;
	}
	public void setNumberOfCustomers(int numberOfCustomers) {
		this.numberOfCustomers = numberOfCustomers;
	}
	public double getSales() {
		return sales;
	}
	public void setSales(double sales) {
		this.sales = sales;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
