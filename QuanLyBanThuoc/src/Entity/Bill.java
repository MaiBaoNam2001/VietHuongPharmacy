package Entity;

import java.util.Date;

public class Bill implements Cloneable{
	private String id;
	private Date date;
	private double totalMoney;
	private Employee employee;
	private Customer customer;
	public Bill() {}
	public Bill(String id, Date date, double totalMoney, Employee employee, Customer customer) {
		super();
		this.id = id;
		this.date = date;
		this.totalMoney = totalMoney;
		this.employee = employee;
		this.customer = customer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
