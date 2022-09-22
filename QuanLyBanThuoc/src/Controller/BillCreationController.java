package Controller;

import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ResourceBundle;
import Entity.BillDetails;
import Entity.Customer;
import Entity.Drug;
import Entity.DrugType;
import MySQL.JDBC;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class BillCreationController implements Initializable{
	@FXML TextField txtBillID;
	@FXML DatePicker dpkCreatedDate;
	@FXML TextField txtEmployeeName;
	@FXML TextField txtCustomerName;
	@FXML TextField txtPhoneNumber;
	@FXML TextField txtAddress;
	@FXML ComboBox<String> cbxSearchType;
	@FXML ComboBox<String> cbxFoundDrug;
	@FXML TextField txtUnit;
	@FXML TextField txtUnitPrice;
	@FXML TextField txtSellQuantity;
	@FXML Button btnAdd;
	@FXML TableView<BillDetails> tbvBill;
	@FXML TableColumn<BillDetails, String> colDrugName;
	@FXML TableColumn<BillDetails, String> colUnit;
	@FXML TableColumn<BillDetails, Double> colUnitPrice;
	@FXML TableColumn<BillDetails, Integer> colQuantity;
	@FXML TableColumn<BillDetails, Double> colMoney;
	@FXML TextField txtSubTotal;
	@FXML TextField txtVAT;
	@FXML TextField txtTotalPayment;
	@FXML TextField txtReceivedMoney;
	@FXML TextField txtExchange;
	@FXML Button btnAddNewBill;
	@FXML Button btnPrintBill;
	@FXML Button btnSaveBill;
	@FXML Button btnBack;
	private Connection connection;
	private ObservableList<Drug> drugList;
	private ObservableList<BillDetails> billDetailsList;
	private ObservableList<Customer> customerList;
	public static final SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
	public BillCreationController() throws ClassNotFoundException, SQLException {
		connection = JDBC.getConnection();
	}
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		try {
			txtEmployeeName.setText(LoginController.user.getName());
			drugList = this.getDrugList();
			customerList = this.getCustomerList();
			billDetailsList = FXCollections.observableArrayList();
			cbxSearchType.setItems(this.getDrugTypeNameList());
			cbxSearchType.getSelectionModel().selectFirst();
			cbxFoundDrug.setItems(this.getDrugNameListByTypeName(cbxSearchType.getSelectionModel().getSelectedItem()));
			cbxFoundDrug.getSelectionModel().selectFirst();
			txtUnit.setText(this.getDrugByName(cbxFoundDrug.getSelectionModel().getSelectedItem()).getUnit());
			txtUnitPrice.setText(String.valueOf(this.getDrugByName(cbxFoundDrug.getSelectionModel().getSelectedItem()).getPrice()));
			txtReceivedMoney.textProperty().addListener((observalbe, oldValue, newValue) -> {
				double receivedMoney = Double.parseDouble(txtReceivedMoney.getText());
				double totalPayment = Double.parseDouble(txtTotalPayment.getText());
				txtExchange.setText(String.valueOf(receivedMoney - totalPayment));
			});
			tbvBill.setOnMouseClicked(new EventHandler<MouseEvent>() {
				@Override
				public void handle(MouseEvent event) {
					MouseButton mouse = event.getButton();
					if(mouse == MouseButton.SECONDARY) {
						if(tbvBill.getSelectionModel().getSelectedItem() != null) {
							billDetailsList.remove(billDetailsList.indexOf(tbvBill.getSelectionModel().getSelectedItem()));
							showBillTable(billDetailsList);
							txtSubTotal.setText(String.valueOf(billDetailsList.stream().mapToDouble(b -> b.getUnitPrice() * b.getQuantity()).sum()));
							double subTotal = Double.parseDouble(txtSubTotal.getText());
							txtTotalPayment.setText(String.valueOf(subTotal * 1.05));
						}
					}
				}
			});
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ObservableList<Drug> getDrugList() throws SQLException{
		ObservableList<Drug> drugs = FXCollections.observableArrayList();
		CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.get_drug_list();");
		ResultSet rs = cs.executeQuery();
		while(rs.next()) {
			Drug drug = new Drug();
			DrugType drugType = new DrugType();
			drugType.setId(rs.getString("ma_loai_thuoc"));
			drugType.setName(rs.getString("ten_loai_thuoc"));
			drug.setId(rs.getString("ma_thuoc"));
			drug.setName(rs.getString("ten_thuoc"));
			drug.setDrugType(drugType);
			drug.setUses(rs.getString("cong_dung"));
			drug.setIngredient(rs.getString("thanh_phan"));
			drug.setUnit(rs.getString("don_vi_tinh"));
			drug.setOrigin(rs.getString("xuat_su"));
			drug.setPrice(rs.getDouble("gia_ban"));
			drug.setQuantity(rs.getInt("so_luong"));
			drugs.add(drug);
		}
		return drugs;
	}
	public ObservableList<String> getDrugTypeNameList() throws SQLException{
		ObservableList<String> drugTypeNames = FXCollections.observableArrayList();
		CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.get_drug_type_name_list();");
		ResultSet rs = cs.executeQuery();
		while(rs.next()) {
			String drugTypeName = rs.getString("ten_loai_thuoc");
			drugTypeNames.add(drugTypeName);
		}
		return drugTypeNames;
	}
	public void handleSearchType(ActionEvent event) {
		cbxFoundDrug.setItems(this.getDrugNameListByTypeName(cbxSearchType.getSelectionModel().getSelectedItem()));
		cbxFoundDrug.getSelectionModel().selectFirst();
	}
	public void handleFoundDrug(ActionEvent event) {
		if(this.getDrugByName(cbxFoundDrug.getSelectionModel().getSelectedItem()) == null) return;
		txtUnit.setText(this.getDrugByName(cbxFoundDrug.getSelectionModel().getSelectedItem()).getUnit());
		txtUnitPrice.setText(String.valueOf(this.getDrugByName(cbxFoundDrug.getSelectionModel().getSelectedItem()).getPrice()));
	}
	public void showBillTable(ObservableList<BillDetails> billDetailsList) {
		colDrugName.setCellValueFactory(b -> new SimpleStringProperty(b.getValue().getDrug().getName()));
		colUnit.setCellValueFactory(b -> new SimpleStringProperty(b.getValue().getUnit()));
		colUnitPrice.setCellValueFactory(b -> new SimpleDoubleProperty(b.getValue().getUnitPrice()).asObject());
		colQuantity.setCellValueFactory(b -> new SimpleIntegerProperty(b.getValue().getQuantity()).asObject());
		colMoney.setCellValueFactory(b -> new SimpleDoubleProperty(b.getValue().getUnitPrice() * b.getValue().getQuantity()).asObject());
		tbvBill.setItems(billDetailsList);
	}
	public void handleAdd(ActionEvent event) {
		billDetailsList.add(this.getBillDetailsByDrug(this.getDrugByName(cbxFoundDrug.getSelectionModel().getSelectedItem())));
		this.showBillTable(billDetailsList);
		txtSubTotal.setText(String.valueOf(billDetailsList.stream().mapToDouble(b -> b.getUnitPrice() * b.getQuantity()).sum()));
		double subTotal = Double.parseDouble(txtSubTotal.getText());
		txtTotalPayment.setText(String.valueOf(subTotal * 1.05));
	}
	public void handleAddNewBill(ActionEvent event) {
		// Coming Soon
	}
	public void handlePrintBill(ActionEvent event) {
		this.showDialog(AlertType.INFORMATION, "Thông báo", "In hóa đơn thành công", "Hóa đơn thanh toán đã được in thành công");
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
	public Customer getCustomer() {
		Customer customer = new Customer();
		customer.setId(null);
		customer.setName(txtCustomerName.getText());
		customer.setAddress(txtAddress.getText());
		customer.setPhoneNumber(txtPhoneNumber.getText());
		return customer;
	}
	public Customer getCustomerFromList(Customer customer) {
		return customerList.stream().filter(c -> c.getName().equals(customer.getName()) && c.getPhoneNumber().equals(customer.getPhoneNumber())).findFirst().orElse(null);
	}
	public void handleSaveBill(ActionEvent event) throws SQLException {
		try
		{
			Customer customer = this.getCustomerFromList(this.getCustomer());
			if(customer == null) {
				Customer lastCustomerInList = customerList.get(customerList.size() - 1);
				customer = this.getCustomer();
				customer.setId(String.format("C%05d", Integer.parseInt(lastCustomerInList.getId().substring(1)) + 1));
				CallableStatement csCustomer = connection.prepareCall("call quan_ly_ban_thuoc_db.add_customer(?, ?, ?, ?);");
				csCustomer.setString(1, customer.getId());
				csCustomer.setString(2, customer.getName());
				csCustomer.setString(3, customer.getAddress());
				csCustomer.setString(4, customer.getPhoneNumber());
				csCustomer.execute();
			}
			CallableStatement csBill = connection.prepareCall("call quan_ly_ban_thuoc_db.add_bill(?, ?, ?, ?, ?);");
			csBill.setString(1, txtBillID.getText());
			csBill.setDate(2, Date.valueOf(dpkCreatedDate.getValue()));
			csBill.setDouble(3, Double.parseDouble(txtTotalPayment.getText()));
			csBill.setString(4, customer.getId());
			csBill.setString(5, LoginController.user.getId());
			csBill.execute();
			CallableStatement csBillDetails = connection.prepareCall("call quan_ly_ban_thuoc_db.add_bill_details(?, ?, ?, ?, ?);");
			for (BillDetails billDetails : billDetailsList) {
				csBillDetails.setString(1, txtBillID.getText());
				csBillDetails.setString(2, billDetails.getDrug().getId());
				csBillDetails.setString(3, billDetails.getUnit());
				csBillDetails.setDouble(4, billDetails.getUnitPrice());
				csBillDetails.setInt(5, billDetails.getQuantity());
				csBillDetails.execute();
			}
			this.showDialog(AlertType.INFORMATION, "Thông báo", "Lưu hóa đơn thành công", "Hóa đơn đã được lưu thành công");
		}catch (Exception e) {
			this.showDialog(AlertType.INFORMATION, "Thông báo", "Lưu hóa đơn không thành công", "Có lỗi trong lúc lưu hóa đơn");
			e.printStackTrace();
		}
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
	public ObservableList<String> getDrugNameListByTypeName(String keyword){
		ObservableList<String> drugNames = FXCollections.observableArrayList();
		drugList.stream().filter(d -> d.getDrugType().getName().equals(keyword)).forEach(d -> drugNames.add(d.getName()));
		return drugNames;
	}
	public Drug getDrugByName(String keyword) {
		return drugList.stream().filter(d -> d.getName().equals(keyword)).findFirst().orElse(null);
	}
	public BillDetails getBillDetailsByDrug(Drug drug) {
		BillDetails billDetails = new BillDetails();
		billDetails.setDrug(drug);
		billDetails.setUnit(txtUnit.getText());
		billDetails.setUnitPrice(Double.parseDouble(txtUnitPrice.getText()));
		billDetails.setQuantity(Integer.parseInt(txtSellQuantity.getText()));
		return billDetails;
	}
	public void showDialog(AlertType alertType, String title, String headerText, String contentText) {
		Alert alert = new Alert(alertType);
		alert.setTitle(title);
		alert.setHeaderText(headerText);
		alert.setContentText(contentText);
		alert.showAndWait();
	}
}
