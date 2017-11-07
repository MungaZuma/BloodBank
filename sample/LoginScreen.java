package sample;

import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Paint;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import sample.DashBoard;


public class LoginScreen extends BorderPane {

    public Text header;
    public JFXTextField username;
    public JFXPasswordField passwordfield;
    public JFXButton Login;
    public VBox vbox;
    public Text mainheader;
    public Image Account;
    public ImageView Icon;

    public LoginScreen() {

        mainheader = new Text("BLOODBANK INFORMATION SYSTEM");
        mainheader.setId("mainhead");

//        header = new Text("Login");
//        header.setId("login");

        Account = new Image(getClass().getResourceAsStream("resources\\AccountHeader.png"));
        Icon = new ImageView(Account);

        username = new JFXTextField();
        username.setFocusColor(Paint.valueOf("#87ceeb"));
        username.setPromptText("Username");
        username.setId("txt");
        username.setMaxSize(150, 50);

        passwordfield = new JFXPasswordField();
        passwordfield.setFocusColor(Paint.valueOf("#87ceeb"));
        passwordfield.setPromptText("Password");
        passwordfield.setId("pass");
        passwordfield.setMaxSize(150, 50);

        Login = new JFXButton("Login");
        Login.setButtonType(JFXButton.ButtonType.RAISED);
        Login.setId("button");
        Login.setMaxSize(150, 50);
        Login.setOnAction(e -> {
            Stage stage;
            Parent root;
            stage = (Stage) Login.getScene().getWindow();
            root = new DashBoard();

            Scene cn = new Scene(root);
            cn.getStylesheets().add(getClass().getResource("DashBoardStyle.css").toExternalForm());
            stage.setScene(cn);
            stage.setMaximized(true);
            stage.show();

        });

        vbox = new VBox();
        vbox.setId("logbox");
        vbox.getChildren().addAll(mainheader,Icon, username, passwordfield, Login);
//        vbox.setMaxSize(300, 300);


        this.setId("border");
        this.setMaxSize(500, 400);
        this.setCenter(vbox);
    }

}