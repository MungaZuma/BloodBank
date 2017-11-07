package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.geometry.Orientation;
import javafx.geometry.Pos;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Separator;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Paint;
import javafx.scene.text.Text;

public class UserRegistration extends BorderPane {

    public TextField userId, user_fisrtName, user_lastname, residence, contacts, logdetailsUserId, password;
    public final ComboBox gender;
    public final ComboBox priviledge;
    public DatePicker dob;
    public VBox mainVBox;
    public GridPane gridPane1, gridPane2;
    public JFXButton UserRegistrationBtn, viewUser, cancelRegistration, editDetails, saveDeatails;
    public Separator hSeparator1, HSeparator2;
    public HBox hBox, hBox1;
    public Text personalDetailsHeader, loginDetailsHeader;

    public UserRegistration() {
//        TOP OF BORDERPANE

        UserRegistrationBtn = new JFXButton("User Registration");
        UserRegistrationBtn.setButtonType(JFXButton.ButtonType.RAISED);
        UserRegistrationBtn.setPrefSize(150, 30);

        viewUser = new JFXButton("View Users");
        viewUser.setButtonType(JFXButton.ButtonType.RAISED);
        viewUser.setPrefSize(150, 30);

        hBox = new HBox();
        hBox.setSpacing(500);
        hBox.setPadding(new Insets(10, 50, 10, 100));
        hBox.setAlignment(Pos.CENTER_LEFT);
        hBox.getChildren().addAll(UserRegistrationBtn, viewUser);

//        CENTER CONTENT
/*        start of personal details */
//        header
        personalDetailsHeader = new Text("User Personal Details");
        personalDetailsHeader.setId("Header1");

        hSeparator1 = new Separator();
        hSeparator1.setOrientation(Orientation.HORIZONTAL);

/* userId. */
        userId = new TextField();
        userId.setPromptText("UserId");
//        userId.setFocusColor(Paint.valueOf("#000000"));
//        userId.setLabelFloat(true);
        GridPane.setConstraints(userId, 0, 0);

//        user_fisrtName
        user_fisrtName = new TextField();
        user_fisrtName.setPromptText("First Name");
//        user_fisrtName.setFocusColor(Paint.valueOf("#000000"));
//        user_fisrtName.setLabelFloat(true);
        GridPane.setConstraints(user_fisrtName, 1, 0);

//        user_lastname
        user_lastname = new TextField();
        user_lastname.setPromptText("Last Name");
//        user_lastname.setFocusColor(Paint.valueOf("#000000"));
//        user_lastname.setLabelFloat(true);
        GridPane.setConstraints(user_lastname, 2, 0);

//        gender
        ObservableList<String> options1 =
                FXCollections.observableArrayList(
                        "Male", "Female"
                );
        gender = new ComboBox(options1);
        gender.setValue("Male");
        GridPane.setConstraints(gender, 0, 1);

//        date of birth
        dob = new DatePicker();
        GridPane.setConstraints(dob, 1, 1);

//        residence
        residence = new TextField();
        residence.setPromptText("Residence");
//        residence.setFocusColor(Paint.valueOf("#000000"));
//        residence.setLabelFloat(true);
        GridPane.setConstraints(residence, 2, 1);

//        contacts
        contacts = new TextField();
        contacts.setPromptText("Contacts");
//        contacts.setFocusColor(Paint.valueOf("#000000"));
//        contacts.setLabelFloat(true);
        GridPane.setConstraints(contacts, 0, 2);

        gridPane1 = new GridPane();
        gridPane1.setPadding(new Insets(10, 50, 10, 0));
        gridPane1.setHgap(150);
        gridPane1.setVgap(30);
        gridPane1.setAlignment(Pos.CENTER_LEFT);
        gridPane1.getChildren().addAll(userId, user_fisrtName, user_lastname, gender, dob, residence, contacts);

/*        end of personal details */
/*        start of login details */
//        header
        loginDetailsHeader = new Text("Login Details");
        loginDetailsHeader.setId("Header2");

        HSeparator2 = new Separator();
        HSeparator2.setOrientation(Orientation.HORIZONTAL);

        logdetailsUserId = new TextField();
        logdetailsUserId.setPromptText("UserId");
//        logdetailsUserId.setFocusColor(Paint.valueOf("#000000"));
//        logdetailsUserId.setLabelFloat(true);
        GridPane.setConstraints(logdetailsUserId, 0, 0);

//        password
        password = new TextField();
        password.setPromptText("Password");
//        password.setFocusColor(Paint.valueOf("#000000"));
//        password.setLabelFloat(true);
        GridPane.setConstraints(password, 1, 0);

//        priviledge

        ObservableList<String> options2 =
                FXCollections.observableArrayList(
                        "Alpha", "Beta"
                );
        priviledge = new ComboBox(options2);
        priviledge.setValue("Alpha");
        GridPane.setConstraints(priviledge, 2, 0);

        gridPane2 = new GridPane();
        gridPane2.setVgap(20);
        gridPane2.setHgap(150);
        gridPane2.setPadding(new Insets(10, 50, 10, 0));
        gridPane2.setAlignment(Pos.CENTER_LEFT);
        gridPane2.getChildren().addAll(logdetailsUserId, password, priviledge);

        mainVBox = new VBox();
        mainVBox.setSpacing(20);
        mainVBox.setPadding(new Insets(10, 50, 20, 100));
        mainVBox.getChildren().addAll(personalDetailsHeader, hSeparator1, gridPane1, loginDetailsHeader, HSeparator2, gridPane2);

//        Start Bottom border
//        cancel button
        cancelRegistration = new JFXButton("Cancel");
        cancelRegistration.setId("Cancel");
        cancelRegistration.setButtonType(JFXButton.ButtonType.RAISED);
        cancelRegistration.setPrefSize(150, 30);
        Image cancel = new Image(getClass().getResourceAsStream("resources\\cancel.png"));
        cancelRegistration.setGraphic(new ImageView(cancel));

//        edit button
        editDetails = new JFXButton("Edit");
        editDetails.setId("edit");
        editDetails.setButtonType(JFXButton.ButtonType.RAISED);
        editDetails.setPrefSize(150, 30);
        Image edit = new Image(getClass().getResourceAsStream("resources\\edit.png"));
        editDetails.setGraphic(new ImageView(edit));

//        save button.
        saveDeatails = new JFXButton("Save");
        saveDeatails.setId("save");
        saveDeatails.setButtonType(JFXButton.ButtonType.RAISED);
        saveDeatails.setPrefSize(150, 30);
        Image save = new Image(getClass().getResourceAsStream("resources\\save.png"));
        saveDeatails.setGraphic(new ImageView(save));

        hBox1 = new HBox();
        hBox1.setSpacing(150);
        hBox1.setPadding(new Insets(10, 50, 50, 100));
        hBox1.getChildren().addAll(cancelRegistration, editDetails, saveDeatails);

//        endBottom border


        this.setTop(hBox);
        this.setCenter(mainVBox);
        this.setBottom(hBox1);
    }
}
