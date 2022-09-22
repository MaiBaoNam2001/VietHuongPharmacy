package Controller;

import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import Entity.Customer;
import MySQL.JDBC;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class CustomerManagement implements Initializable{
	@FXML ComboBox<String> cbxSearchType;
	@FXML TextField txtSearchBar;
	@FXML Button btnSearch;
	@FXML Button btnUnsearch;
	@FXML TextField txtCustomerID;
	@FXML TextField txtCustomerName;
	@FXML TextArea txtAddress;
	@FXML TextField txtPhoneNumber;
	@FXML Button btnAdd;
	@FXML Button btnDelete;
	@FXML Button btnUpdate;
	@FXML Button btnBack;
	@FXML TableView<Customer> tbvCustomers;
	@FXML TableColumn<Customer, String> colCustomerID;
	@FXML TableColumn<Customer, String> colCustomerName;
	@FXML TableColumn<Customer, String> colAddress;
	@FXML TableColumn<Customer, String> colPhoneNumber;
	private Connection connection;
	private ObservableList<Customer> customerList;
	public CustomerManagement() throws ClassNotFoundException, SQLException {
		connection = JDBC.getConnection();
	}
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		try {
			customerList = this.getCustomerList();
			this.showCustomerTable(customerList);
			ObservableList<String> searchTypeList = FXCollections.observableArrayList();
			searchTypeList.add("Mã khách hàng");
			searchTypeList.add("Tên khách hàng");
			searchTypeList.add("Địa chỉ");
			searchTypeList.add("Số điện thoại");
			cbxSearchType.setItems(searchTypeList);
			cbxSearchType.getSelectionModel().selectFirst();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ObservableList<Customer> getCustomerList() throws SQLException{
		ObservableList<Customer> customers = FXCollections.observableArrayList();
		CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.get_customer_list();");
		ResultSet rs = cs.executeQuery();
		while(rs.next()) {
			Customer customer = new Customer();
			customer.setId(rs.getString("ma_khach_hang"));
			customer.setName(rs.getString("ten_khach_hang"));
			customer.setAddress(rs.getString("dia_chi"));
			customer.setPhoneNumber(rs.getString("so_dien_thoai"));
			customers.add(customer);
		}
		return customers;
	}
	public void showCustomerTable(ObservableList<Customer> customers) {
		colCustomerID.setCellValueFactory(c -> new SimpleStringProperty(c.getValue().getId()));
		colCustomerName.setCellValueFactory(c -> new SimpleStringProperty(c.getValue().getName()));
		colAddress.setCellValueFactory(c -> new SimpleStringProperty(c.getValue().getAddress()));
		colPhoneNumber.setCellValueFactory(c -> new SimpleStringProperty(c.getValue().getPhoneNumber()));
		tbvCustomers.setItems(customers);
	}
	public Customer getCustomer() {
		Customer customer = new Customer();
		customer.setId(txtCustomerID.getText());
		customer.setName(txtCustomerName.getText());
		customer.setAddress(txtAddress.getText());
		customer.setPhoneNumber(txtPhoneNumber.getText());
		return customer;
	}
	public void handleAdd(ActionEvent event) {
		if(this.isEmpty())
			this.showDialog(AlertType.INFORMATION, "Thông báo", "Thêm không thành công", "Vui lòng nhập đầy đủ thông tin");
		else {
			try {
				Customer customer = this.getCustomer();
				CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.add_customer(?, ?, ?, ?);");
				cs.setString(1, customer.getId());
				cs.setString(2, customer.getName());
				cs.setString(3, customer.getAddress());
				cs.setString(4, customer.getPhoneNumber());
				cs.execute();
				this.customerList.add(customer);
				this.sortUpByID();
				this.showDialog(AlertType.INFORMATION, "Thông báo", "Thêm thành công", "Khách hàng đã được thêm thành công");
				this.clearAll();
				txtSearchBar.clear();
			}
			catch (Exception e) {
				this.showDialog(AlertType.INFORMATION, "Thông báo", "Thêm không thành công", "Có lỗi xảy ra trong lúc thêm");
				e.printStackTrace();
			}
		}
	}
	public void handleDelete(ActionEvent event) throws SQLException {
		if(this.isEmpty())
			this.showDialog(AlertType.INFORMATION, "Thông báo", "Xóa không thành công", "Vui lòng nhập đầy đủ thông tin");
		else {
			try
			{
				Customer customer = this.getCustomer();
				CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.delete_customer(?);");
				cs.setString(1, customer.getId());
				cs.execute();
				if(this.customerList.removeIf(c -> c.getId().equals(customer.getId()))) {
					this.showDialog(AlertType.INFORMATION, "Thông báo", "Xóa thành công", "Khách hàng đã được xóa thành công");
					this.clearAll();
					txtSearchBar.clear();
				}
				else this.showDialog(AlertType.INFORMATION, "Thông báo", "Xóa không thành công", "Có lỗi xảy ra trong lúc xóa");
			}catch (Exception e) {
				this.showDialog(AlertType.INFORMATION, "Thông báo", "Xóa không thành công", "Có lỗi xảy ra trong lúc xóa");
				e.printStackTrace();
			}
		}
	}
	public void handleUpdate(ActionEvent event) {
		if(this.isEmpty())
			this.showDialog(AlertType.INFORMATION, "Thông báo", "Cập nhật không thành công", "Vui lòng nhập đầy đủ thông tin");
		else {
			try {
				Customer selectedCustomer = tbvCustomers.getSelectionModel().getSelectedItem();
				Customer customer = this.getCustomer();
				CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.update_customer(?, ?, ?, ?, ?);");
				cs.setString(1, selectedCustomer.getId());
				cs.setString(2, customer.getId());
				cs.setString(3, customer.getName());
				cs.setString(4, customer.getAddress());
				cs.setString(5, customer.getPhoneNumber());
				cs.execute();
				this.customerList.set(this.customerList.indexOf(selectedCustomer), customer);
				this.sortUpByID();
				this.showDialog(AlertType.INFORMATION, "Thông báo", "Cập nhật thành công", "Khách hàng đã được cập nhật thành công");
				this.clearAll();
				txtSearchBar.clear();
			}catch (Exception e) {
				this.showDialog(AlertType.INFORMATION, "Thông báo", "Cập nhật không thành công", "Có lỗi xảy ra trong lúc cập nhật");
				e.printStackTrace();
			}
		}
	}
	public void handleClick(MouseEvent event) {
		Customer selectedCustomer = tbvCustomers.getSelectionModel().getSelectedItem();
		if(selectedCustomer == null) return;
		txtCustomerID.setText(selectedCustomer.getId());
		txtCustomerName.setText(selectedCustomer.getName());
		txtAddress.setText(selectedCustomer.getAddress());
		txtPhoneNumber.setText(selectedCustomer.getPhoneNumber());
	}
	public void handleSearch(MouseEvent event) {
		this.clearAll();
		btnAdd.setDisable(true);
		btnDelete.setDisable(true);
		btnUpdate.setDisable(true);
		if(cbxSearchType.getSelectionModel().isSelected(0))
			this.showCustomerTable(this.getCustomerListByID(txtSearchBar.getText()));
		else if(cbxSearchType.getSelectionModel().isSelected(1))
			this.showCustomerTable(this.getCustomerListByName(txtSearchBar.getText()));
		else if(cbxSearchType.getSelectionModel().isSelected(2))
			this.showCustomerTable(this.getCustomerListByAddress(txtSearchBar.getText()));
		else this.showCustomerTable(this.getCustomerListByPhoneNumber(txtSearchBar.getText()));
	}
	public void handleUnsearch(MouseEvent event) {
		this.clearAll();
		txtSearchBar.clear();
		btnAdd.setDisable(false);
		btnDelete.setDisable(false);
		btnUpdate.setDisable(false);
		this.showCustomerTable(customerList);
	}
	public ObservableList<Customer> getCustomerListByID(String keyword){
		return customerList.stream().filter(c -> c.getId().equals(keyword)).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public ObservableList<Customer> getCustomerListByName(String keyword){
		return customerList.stream().filter(c -> c.getName().toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public ObservableList<Customer> getCustomerListByAddress(String keyword){
		return customerList.stream().filter(c -> c.getAddress().toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public ObservableList<Customer> getCustomerListByPhoneNumber(String keyword){
		return customerList.stream().filter(c -> c.getPhoneNumber().equals(keyword)).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public void handleBack(ActionEvent event) {
		try {
			Node node = (Node) event.getSource();
			Stage stage = (Stage) node.getScene().getWindow();
			stage.close();
			FXMLLoader loader = new FXMLLoader(getClass().getResource("/Sample/HomeSample.fxml"));
			Parent root = loader.load();
			HomeController homeController = loader.getController();
			homeController.setUserInformation(LoginController.user);
			Scene scene = new Scene(root);
			scene.getStylesheets().add(getClass().getResource("/CSS/style.css").toExternalForm());
			stage.setScene(scene);
			stage.setTitle("Viet Huong Pharmacy | Trang chủ");
			stage.setResizable(false);
			stage.show();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void clearAll() {
		txtCustomerID.clear();
		txtCustomerName.clear();
		txtAddress.clear();
		txtPhoneNumber.clear();
	}
	public void sortUpByID() {
		customerList.sort((c1, c2) -> c1.getId().compareTo(c2.getId()));
	}
	public boolean isEmpty() {
		return txtCustomerID.getText().equals("") || txtCustomerName.getText().equals("") || txtAddress.getText().equals("") || txtPhoneNumber.getText().equals("");
	}
	public void showDialog(AlertType alertType, String title, String headerText, String contentText) {
		Alert alert = new Alert(alertType);
		alert.setTitle(title);
		alert.setHeaderText(headerText);
		alert.setContentText(contentText);
		alert.showAndWait();
	}
}
