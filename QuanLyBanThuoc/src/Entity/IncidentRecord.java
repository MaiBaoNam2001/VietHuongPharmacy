package Entity;

import java.util.Date;

public class IncidentRecord implements Cloneable{
	private String id;
	private String incidentName;
	private String testResult;
	private String solution;
	private Date creadtedDate;
	private Employee employee;
	private Customer customer;
	public IncidentRecord() {}
	public IncidentRecord(String id, String incidentName, String testResult, String solution, Date creadtedDate,
			Employee employee, Customer customer) {
		super();
		this.id = id;
		this.incidentName = incidentName;
		this.testResult = testResult;
		this.solution = solution;
		this.creadtedDate = creadtedDate;
		this.employee = employee;
		this.customer = customer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIncidentName() {
		return incidentName;
	}
	public void setIncidentName(String incidentName) {
		this.incidentName = incidentName;
	}
	public String getTestResult() {
		return testResult;
	}
	public void setTestResult(String testResult) {
		this.testResult = testResult;
	}
	public String getSolution() {
		return solution;
	}
	public void setSolution(String solution) {
		this.solution = solution;
	}
	public Date getCreadtedDate() {
		return creadtedDate;
	}
	public void setCreadtedDate(Date creadtedDate) {
		this.creadtedDate = creadtedDate;
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
