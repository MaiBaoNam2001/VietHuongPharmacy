package Controller;

import java.net.URL;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import Entity.Drug;
import Entity.DrugType;
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
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class DrugSearchController implements Initializable{
	@FXML ComboBox<String> cbxSearchType;
	@FXML TextField txtSearchBar;
	@FXML Button btnSearch;
	@FXML Button btnUnsearch;
	@FXML TextField txtDrugID;
	@FXML TextField txtDrugName;
	@FXML TextField txtDrugTypeName;
	@FXML TextArea txtUses;
	@FXML TextArea txtIngredient;
	@FXML TextField txtUnit;
	@FXML TextField txtOrigin;
	@FXML TextField txtPrice;
	@FXML TextField txtQuantity;
	@FXML Button btnBack;
	@FXML TableView<Drug> tbvDrugs;
	@FXML TableColumn<Drug, String> colDrugID;
	@FXML TableColumn<Drug, String> colDrugName;
	@FXML TableColumn<Drug, String> colDrugTypeName;
	@FXML TableColumn<Drug, String> colUses;
	@FXML TableColumn<Drug, String> colIngredient;
	@FXML TableColumn<Drug, String> colUnit;
	@FXML TableColumn<Drug, String> colOrigin;
	@FXML TableColumn<Drug, Double> colPrice;
	@FXML TableColumn<Drug, Integer> colQuantity;
	private Connection connection;
	private ObservableList<Drug> drugList;
	public DrugSearchController() throws ClassNotFoundException, SQLException {
		connection = JDBC.getConnection();
	}
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		try {
			drugList = this.getDrugList();
			this.showDrugTable(drugList);
			ObservableList<String> searchTypeList = FXCollections.observableArrayList();
			searchTypeList.add("Mã thuốc");
			searchTypeList.add("Tên thuốc");
			searchTypeList.add("Tên loại thuốc");
			searchTypeList.add("Xuất xứ");
			searchTypeList.add("Giá bán");
			cbxSearchType.setItems(searchTypeList);
			cbxSearchType.getSelectionModel().selectFirst();
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
	public void showDrugTable(ObservableList<Drug> drugs) {
		colDrugID.setCellValueFactory(d -> new SimpleStringProperty(d.getValue().getId()));
		colDrugName.setCellValueFactory(d -> new SimpleStringProperty(d.getValue().getName()));
		colDrugTypeName.setCellValueFactory(d -> new SimpleStringProperty(d.getValue().getDrugType().getName()));
		colUses.setCellValueFactory(d -> new SimpleStringProperty(d.getValue().getUses()));
		colIngredient.setCellValueFactory(d -> new SimpleStringProperty(d.getValue().getIngredient()));
		colUnit.setCellValueFactory(d -> new SimpleStringProperty(d.getValue().getUnit()));
		colOrigin.setCellValueFactory(d -> new SimpleStringProperty(d.getValue().getOrigin()));
		colPrice.setCellValueFactory(d -> new SimpleDoubleProperty(d.getValue().getPrice()).asObject());
		colQuantity.setCellValueFactory(d -> new SimpleIntegerProperty(d.getValue().getQuantity()).asObject());
		tbvDrugs.setItems(drugs);
	}
	public void handleClick(MouseEvent event) {
		Drug selectedDrug = tbvDrugs.getSelectionModel().getSelectedItem();
		if(selectedDrug == null) return;
		txtDrugID.setText(selectedDrug.getId());
		txtDrugName.setText(selectedDrug.getName());
		txtDrugTypeName.setText(selectedDrug.getDrugType().getName());
		txtUses.setText(selectedDrug.getUses());
		txtIngredient.setText(selectedDrug.getIngredient());
		txtUnit.setText(selectedDrug.getUnit());
		txtOrigin.setText(selectedDrug.getOrigin());
		txtPrice.setText(String.valueOf(selectedDrug.getPrice()));
		txtQuantity.setText(String.valueOf(selectedDrug.getQuantity()));
	}
	public void clearAll() {
		txtDrugID.clear();
		txtDrugName.clear();
		txtDrugTypeName.clear();
		txtUses.clear();
		txtIngredient.clear();
		txtUnit.clear();
		txtOrigin.clear();
		txtPrice.clear();
		txtQuantity.clear();
	}
	public void handleSearch(MouseEvent event) {
		this.clearAll();
		if(cbxSearchType.getSelectionModel().isSelected(0))
			this.showDrugTable(this.getDrugListByID(txtSearchBar.getText()));
		else if(cbxSearchType.getSelectionModel().isSelected(1))
			this.showDrugTable(this.getDrugListByName(txtSearchBar.getText()));
		else if(cbxSearchType.getSelectionModel().isSelected(2))
			this.showDrugTable(this.getDrugListByTypeName(txtSearchBar.getText()));
		else if(cbxSearchType.getSelectionModel().isSelected(3))
			this.showDrugTable(this.getDrugListByOrigin(txtSearchBar.getText()));
		else this.showDrugTable(this.getDrugListByPrice(txtSearchBar.getText()));
	}
	public void handleUnsearch(MouseEvent event) {
		this.clearAll();
		txtSearchBar.clear();
		this.showDrugTable(drugList);
	}
	public ObservableList<Drug> getDrugListByID(String keyword){
		return drugList.stream().filter(d -> d.getId().equals(keyword)).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public ObservableList<Drug> getDrugListByName(String keyword){
		return drugList.stream().filter(d -> d.getName().toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public ObservableList<Drug> getDrugListByTypeName(String keyword){
		return drugList.stream().filter(d -> d.getDrugType().getName().toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public ObservableList<Drug> getDrugListByOrigin(String keyword){
		return drugList.stream().filter(d -> d.getOrigin().toLowerCase().contains(keyword.toLowerCase())).collect(Collectors.toCollection(FXCollections::observableArrayList));
	}
	public ObservableList<Drug> getDrugListByPrice(String keyword){
		return drugList.stream().filter(d -> String.valueOf(d.getPrice()).equals(keyword)).collect(Collectors.toCollection(FXCollections::observableArrayList));
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
}
