package Controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import Entity.Employee;
import MySQL.JDBC;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class LoginController {
	@FXML private TextField txtUsername;
	@FXML private PasswordField txtPassword;
	@FXML private Button btnLogin;
	@FXML private Button btnReset;
	private Connection connection;
	public static Employee user;
	public LoginController() throws ClassNotFoundException, SQLException {
		connection = JDBC.getConnection();
	}
	public void handleLogin(ActionEvent event) throws SQLException, IOException {
		if(txtUsername.getText().equals("") || txtPassword.getText().equals(""))
			showDialog(AlertType.INFORMATION, "Thông báo", "Đăng nhập thất bại", "Vui lòng nhập đầy đủ thông tin");
		else {
			CallableStatement cs = connection.prepareCall("call quan_ly_ban_thuoc_db.get_login(?, ?);");
			cs.setString(1, txtUsername.getText());
			cs.setString(2, txtPassword.getText());
			ResultSet rs = cs.executeQuery();
			if(!rs.next())
				showDialog(AlertType.INFORMATION, "Thông báo", "Đăng nhập thất bại", "Vui lòng nhập chính xác thông tin");
			else {
				showDialog(AlertType.INFORMATION, "Thông báo", "Đăng nhập thành công", "Vui lòng xác nhận để chuyển hướng");
				try
				{
					user = new Employee();
					user.setId(rs.getString("ma_nhan_vien"));
					user.setName(rs.getString("ho_ten"));
					user.setPosition(rs.getString("chuc_vu"));
					user.setGender(rs.getString("gioi_tinh"));
					user.setBirthDay(rs.getDate("ngay_sinh"));
					user.setAddress(rs.getString("dia_chi"));
					user.setEmail(rs.getString("email"));
					user.setPhoneNumber(rs.getString("so_dien_thoai"));
					user.setUsername(rs.getString("ten_dang_nhap"));
					user.setPassword(rs.getString("mat_khau"));
					Node node = (Node) event.getSource();
					Stage stage = (Stage) node.getScene().getWindow();
					stage.close();
					FXMLLoader loader = new FXMLLoader(getClass().getResource("/Sample/HomeSample.fxml"));
					Parent root = loader.load();
					HomeController homeController = loader.getController();
					homeController.setUserInformation(user);
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
	}
	public void handleReset(ActionEvent event) {
		txtUsername.setText("");
		txtPassword.setText("");
	}
	public void showDialog(AlertType alertType, String title, String headerText, String contentText) {
		Alert alert = new Alert(alertType);
		alert.setTitle(title);
		alert.setHeaderText(headerText);
		alert.setContentText(contentText);
		alert.showAndWait();
	}
}
