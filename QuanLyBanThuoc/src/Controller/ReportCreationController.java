package Controller;

import java.net.URL;
import java.util.ResourceBundle;
import Entity.ReportType;
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
import javafx.scene.chart.PieChart;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseButton;
import javafx.scene.input.MouseEvent;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;

public class ReportCreationController implements Initializable{
    @FXML private TextField txtReportID;
    @FXML private DatePicker dpkCreatedDate;
    @FXML private TextField txtEmployeeName;
    @FXML private TextField txtNumberOfDrugsSold;
    @FXML private TextField txtNumberOfBills;
    @FXML private TextField txtNumberOfCustomers;
    @FXML private ComboBox<String> cbxReportType;
    @FXML private Label lblType;
    @FXML private TextField txtType;
    @FXML private TextField txtSales;
    @FXML private Button btnAdd;
    @FXML private TableView<ReportType> tbvSales;
    @FXML private TableColumn<ReportType, Integer> colType;
    @FXML private TableColumn<ReportType, String> colSales;
    @FXML private PieChart chartSales;
    @FXML private Button btnPrintReport;
    @FXML private Button btnSaveReport;
    @FXML private Button btnAddNewReport;
    @FXML private Button btnBack;
    private ObservableList<ReportType> reportTypeList;
    public ReportCreationController() {
		// TODO Auto-generated constructor stub
	}
    @Override
	public void initialize(URL location, ResourceBundle resources) {
    	txtEmployeeName.setText(LoginController.user.getName());
    	ObservableList<String> reportTypesList = FXCollections.observableArrayList();
    	reportTypesList.add("Tháng");
    	reportTypesList.add("Quý");
    	reportTypesList.add("Năm");
    	cbxReportType.setItems(reportTypesList);
    	cbxReportType.getSelectionModel().selectFirst();
    	reportTypeList = FXCollections.observableArrayList();
    	tbvSales.setOnMouseClicked(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent event) {
				MouseButton mouse = event.getButton();
				if(mouse == MouseButton.SECONDARY) {
					handleDelete(event);
				}
			}
		});
	}
    public void handleReportType(ActionEvent event) {
    	if(cbxReportType.getSelectionModel().isSelected(0)) {
    		lblType.setText("Tháng:");
    		colType.setText("Tháng");
    	}
    	else if(cbxReportType.getSelectionModel().isSelected(1)) {
    		lblType.setText("Quý:");
    		colType.setText("Quý");
    	}
    	else {
    		lblType.setText("Năm:");
    		colType.setText("Năm");
    	}
    }
    public void showSalesTable(ObservableList<ReportType> reportTypeList) {
    	colType.setCellValueFactory(t -> new SimpleIntegerProperty(t.getValue().getType()).asObject());
    	colSales.setCellValueFactory(t -> new SimpleStringProperty(String.format("%.0f", t.getValue().getSales())));
    	tbvSales.setItems(reportTypeList);
    }
    public ReportType getReportType() {
    	ReportType reportType = new ReportType();
    	reportType.setType(Integer.parseInt(txtType.getText()));
    	reportType.setSales(Double.parseDouble(txtSales.getText()));
    	return reportType;
    }
    public void handleAdd(ActionEvent event) {
    	reportTypeList.add(this.getReportType());
    	this.showSalesTable(reportTypeList);
    	this.loadSalesChart(reportTypeList);
    }
    public void handleDelete(MouseEvent event) {
    	reportTypeList.remove(reportTypeList.indexOf(tbvSales.getSelectionModel().getSelectedItem()));
    	this.showSalesTable(reportTypeList);
    	this.loadSalesChart(reportTypeList);
    }
    public void handleAddNewReport(ActionEvent event) {
    	//Coming Soon
    }
    public void handlePrintReport(ActionEvent event) {
    	this.showDialog(AlertType.INFORMATION, "Thông báo", "In báo cáo thành công", "Báo cáo đã được in thành công");
    }
    public void handleSaveReport(ActionEvent event) {
    	this.showDialog(AlertType.INFORMATION, "Thông báo", "Lưu báo cáo thành công", "Báo cáo đã được lưu thành công");
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
    public void showDialog(AlertType alertType, String title, String headerText, String contentText) {
    	Alert alert = new Alert(alertType);
    	alert.setTitle(title);
    	alert.setHeaderText(headerText);
    	alert.setContentText(contentText);
    	alert.showAndWait();
    }
    public void loadSalesChart(ObservableList<ReportType> reportTypeList) {
    	chartSales.getData().clear();
    	ObservableList<PieChart.Data> chartDataList = FXCollections.observableArrayList();
    	for(ReportType reportType:reportTypeList) {
    		chartDataList.add(new PieChart.Data(String.format("%s %d", colType.getText(), reportType.getType()), reportType.getSales()));
    	}
    	chartSales.setData(chartDataList);
    }
}

