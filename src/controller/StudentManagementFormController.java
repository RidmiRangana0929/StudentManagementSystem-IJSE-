package controller;

import javafx.event.ActionEvent;
import javafx.scene.control.Alert;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import model.Student;
import util.CrudUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentManagementFormController {
    public AnchorPane studentContext;
    public TextField txtStudentId;
    public TextField txtName;
    public TextField txtEmail;
    public TextField txtContact;
    public TextField txtAddress;
    public TextField txtNic;
    public TableView tblStudent;
    public TableColumn colStId;
    public TableColumn colStName;
    public TableColumn colEmail;
    public TableColumn colContact;
    public TableColumn colAddress;
    public TableColumn colNic;

    public void saveOnAction(ActionEvent actionEvent) {

        Student s = new Student(
                txtStudentId.getText(),txtName.getText(),txtEmail.getText(),txtContact.getText(),txtAddress.getText(),txtNic.getText()
        );
        try {
            if(CrudUtil.execute("INSERT INTO Student VALUES (?,?,?,?,?,?)",s.getStudent_id(),s.getStudent_name(),s.getEmail(),s.getContact(),s.getAddress(),s.getNic())){

                new Alert(Alert.AlertType.CONFIRMATION,"Student Information saved Successfully...!").show();

            }else {

                new Alert(Alert.AlertType.WARNING,"Error! Try Again...").show();

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    public void updateOnAction(ActionEvent actionEvent) {
    }

    public void deleteOnAction(ActionEvent actionEvent) {

        try {
            if(CrudUtil.execute("DELETE FROM Student WHERE student_id=?",txtStudentId.getText())){
                new Alert(Alert.AlertType.CONFIRMATION,"Student Information deleted...!").show();
            }else {
                new Alert(Alert.AlertType.WARNING,"Error! Try Again...").show();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    public void txtSearchOnAction(ActionEvent actionEvent) throws SQLException {

        ResultSet result= null;
        try {
            result = CrudUtil.execute("SELECT * FROM Student WHERE student_id=?",txtStudentId.getText());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if(result.next()){
            txtName.setText(result.getString(2));
            txtEmail.setText(result.getString(3));
            txtContact.setText(result.getString(4));
            txtAddress.setText(result.getString(5));
            txtNic.setText(result.getString(6));
        }

    }
}
