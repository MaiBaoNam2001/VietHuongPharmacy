package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;

public class IncidentRecordCreation implements Initializable{
    @FXML private TextField txtRecordID;
    @FXML private DatePicker dpkCreatedDate;
    @FXML private TextField txtEmployeeName;
    @FXML private TextField txtCustomerName;
    @FXML private TextField txtPhoneNumber;
    @FXML private TextField txtAddress;
    @FXML private TextField txtIncidentName;
    @FXML private TextArea txtTestResult;
    @FXML private TextArea txtSolution;
    @FXML private Button btnPrintRecord;
    @FXML private Button btnSaveRecord;
    @FXML private Button btnAddNewRecord;
    @FXML private Button btnBack;
    public IncidentRecordCreation() {
		// TODO Auto-generated constructor stub
	}
    @Override
	public void initialize(URL location, ResourceBundle resources) {
    	txtEmployeeName.setText(LoginController.user.getName());
	}
    public void handlePrintRecord(ActionEvent event) {
    	this.showDialog(AlertType.INFORMATION, "Thông báo", "In biên bản thành công", "Biên bản giải quyết đã được in thành công");
    }
    public void handleSaveRecord(ActionEvent event) {
    	this.showDialog(AlertType.INFORMATION, "Thông báo", "Lưu biên bản thành công", "Biên bản giải quyết đã được lưu thành công");
    }
    public void handleAddNewRecord(ActionEvent event) {
    	// Coming Soon
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
}

