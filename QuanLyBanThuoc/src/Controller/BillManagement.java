package Controller;

import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import Entity.Bill;
import Entity.BillDetails;
import Entity.Customer;
import Entity.Drug;
import Entity.Employee;
import MySQL.JDBC;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class BillManagement implements Initializable{
    @FXML private ComboBox<String> cbxSearchType;
    @FXML private TextField txtSearchBar;
    @FXML private Button btnSearch;
    @FXML private Button btnUnsearch;
    @FXML private TextField txtBillID;
    @FXML private DatePicker dpxCreatedDate;
    @FXML private TextField txtTotalPayment;
    @FXML private TextField txtCustomerName;
    @FXML private TextField txtEmployeeName;
    @FXML private Button btnBack;
    @FXML private TableView<Bill> tbvBills;
    @FXML private TableColumn<Bill, String> colBillID;
    @FXML private TableColumn<Bill, String> colCreatedDate;
    @FXML private TableColumn<Bill, Double> colTotalPayment;
    @FXML private TableColumn<Bill, String> colCustomerName;
    @FXML private TableColumn<Bill, String> colEmployeeName;
    @FXML private TableView<BillDetails> tbvBillDetails;
    @FXML private TableColumn<BillDetails, String> colDrugName;
    @FXML private TableColumn<BillDetails, String> colUnit;
    @FXML private TableColumn<BillDetails, Double> colUnitPrice;
    @FXML private TableColumn<BillDetails, Integer> colQuantity;
    @FXML private TableColumn<BillDetails, Double> colMoney;
    private Connection connection;
    public static final SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
    private ObservableList<Bill> billList;
    private ObservableList<BillDetails> billDetailsList;
    public BillManagement() throws ClassNotFoundException, SQLException {
		connection = JDBC.getConnection();
	}
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		try {
			billList = this.getBillList();
			this.showBillTable(billList);
			billDetailsList = this.getBillDetailsList();
			ObservableList<String> searchTypeList = FXCollections.observableArrayList();
			searchTypeList.add("Mã hóa đơn");
			searchTypeList.add("Ngày thanh toán");
			searchTypeList.add("Tên khách hàng");
			searchTypeList.add("Tên nhân viên");
			cbxSearchType.setItems(searchTypeList);
			cbxSearchType.getSelectionModel().selectFirst();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ObservableList<Bill> getBillList() throws SQLException{
		ObservableList<Bill> bills = FXCollections.observableArrayList();
		CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.get_bill_list();");
		ResultSet rs = cs.executeQuery();
		while(rs.next()) {
			Bill bill = new Bill();
			bill.setId(rs.getString("ma_hoa_don"));
			bill.setDate(rs.getDate("ngay_thanh_toan"));
			bill.setTotalMoney(rs.getDouble("tong_tien_thanh_toan"));
			Customer customer = new Customer();
			customer.setId(rs.getString("ma_khach_hang"));
			customer.setName(rs.getString("ten_khach_hang"));
			bill.setCustomer(customer);
			Employee employee = new Employee();
			employee.setId(rs.getString("ma_nhan_vien"));
			employee.setName(rs.getString("ho_ten"));
			bill.setEmployee(employee);
			bills.add(bill);
		}
		return bills;
	}
	public ObservableList<BillDetails> getBillDetailsList() throws SQLException{
		ObservableList<BillDetails> billDetails = FXCollections.observableArrayList();
		CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.get_bill_details_list();");
		ResultSet rs = cs.executeQuery();
		while(rs.next()) {
			BillDetails billDetail = new BillDetails();
			Bill bill = new Bill();
			bill.setId(rs.getString("ma_hoa_don"));
			billDetail.setBill(bill);
			Drug drug = new Drug();
			drug.setId(rs.getString("ma_thuoc"));
			drug.setName(rs.getString("ten_thuoc"));
			billDetail.setDrug(drug);
			billDetail.setUnit(rs.getString("don_vi_tinh"));
			billDetail.setUnitPrice(rs.getDouble("don_gia_ban"));
			billDetail.setQuantity(rs.getInt("so_luong"));
			billDetails.add(billDetail);
		}
		return billDetails;
	}
	public void showBillTable(ObservableList<Bill> billList) {
		colBillID.setCellValueFactory(b -> new SimpleStringProperty(b.getValue().getId()));
		colCreatedDate.setCellValueFactory(b -> new SimpleStringProperty(f.format(b.getValue().getDate())));
		colTotalPayment.setCellValueFactory(b -> new SimpleDoubleProperty(b.getValue().getTotalMoney()).asObject());
		colCustomerName.setCellValueFactory(b -> new SimpleStringProperty(b.getValue().getCustomer().getName()));
		colEmployeeName.setCellValueFactory(b -> new SimpleStringProperty(b.getValue().getEmployee().getName()));
		tbvBills.setItems(billList);
	}
	public void showBillDetailsTable(ObservableList<BillDetails> billDetailsList) {
		colDrugName.setCellValueFactory(b -> new SimpleStringProperty(b.getValue().getDrug().getName()));
		colUnit.setCellValueFactory(b -> new SimpleStringProperty(b.getValue().getUnit()));
		colUnitPrice.setCellValueFactory(b -> new SimpleDoubleProperty(b.getValue().getUnitPrice()).asObject());
		colQuantity.setCellValueFactory(b -> new SimpleIntegerProperty(b.getValue().getQuantity()).asObject());
		colMoney.setCellValueFactory(b -> new SimpleDoubleProperty(b.getValue().getUnitPrice() * b.getValue().getQuantity()).asObject());
		tbvBillDetails.setItems(billDetailsList);
	}
    public void handleClick(MouseEvent event) {
    	Bill bill = tbvBills.getSelectionModel().getSelectedItem();
    	if(bill == null) return;
    	txtBillID.setText(bill.getId());
    	dpxCreatedDate.setValue(LocalDate.parse(f.format(bill.getDate()), DateTimeFormatter.ofPattern("dd/MM/yyyy")));
    	txtTotalPayment.setText(String.valueOf(bill.getTotalMoney()));
    	txtCustomerName.setText(bill.getCustomer().getName());
    	txtEmployeeName.setText(bill.getEmployee().getName());
    	this.showBillDetailsTable(this.getBillDetailsListByID(tbvBills.getSelectionModel().getSelectedItem().getId()));
    }
    public ObservableList<BillDetails> getBillDetailsListByID(String keyword){
    	return billDetailsList.stream().filter(b -> b.getBill().getId().equals(keyword)).collect(Collectors.toCollection(FXCollections::observableArrayList));
    }
    public void handleSearch(MouseEvent event) {
    	this.clearAll();
    	tbvBillDetails.getItems().clear();
    	if(cbxSearchType.getSelectionModel().isSelected(0))
    		this.showBillTable(this.getBillListByID(txtSearchBar.getText()));
    	else if(cbxSearchType.getSelectionModel().isSelected(1))
    		this.showBillTable(this.getBillListByCreatedDate(txtSearchBar.getText()));
    	else if(cbxSearchType.getSelectionModel().isSelected(2))
    		this.showBillTable(this.getBillListByCustomerName(txtSearchBar.getText()));
    	else this.showBillTable(this.getBillListByEmployeeName(txtSearchBar.getText()));
    }
    public void handleUnsearch(MouseEvent event) {
    	this.clearAll();
    	tbvBillDetails.getItems().clear();
    	txtSearchBar.clear();
    	this.showBillTable(billList);
    }
    public ObservableList<Bill> getBillListByID(String keyword){
    	return billList.stream().filter(b -> b.getId().equals(keyword)).collect(Collectors.toCollection(FXCollections::observableArrayList));
    }
    public ObservableList<Bill> getBillListByCreatedDate(String keyword){
    	return billList.stream().filter(b -> f.format(b.getDate()).equals(keyword)).collect(Collectors.toCollection(FXCollections::observableArrayList));
    }
    public ObservableList<Bill> getBillListByCustomerName(String keyword){
    	return billList.stream().filter(b -> b.getCustomer().getName().toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toCollection(FXCollections::observableArrayList));
    }
    public ObservableList<Bill> getBillListByEmployeeName(String keyword){
    	return billList.stream().filter(b -> b.getEmployee().getName().toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toCollection(FXCollections::observableArrayList));
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
    	txtBillID.clear();
    	dpxCreatedDate.setValue(null);
    	txtTotalPayment.clear();
    	txtCustomerName.clear();
    	txtEmployeeName.clear();
    }
}

