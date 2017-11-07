package sample;

import com.jfoenix.controls.JFXButton;
import javafx.scene.Parent;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.VBox;

public class DashBoard extends BorderPane {

    public JFXButton home, user, donor, recipient, bloodbank, statistics;
    public GridPane grid;
    public VBox vbox;

    public DashBoard() {

        home = new JFXButton("HOME");
        home.setButtonType(JFXButton.ButtonType.FLAT);
        home.setId("dash_homeBtn");
        home.setPrefSize(150, 75);
        Image img = new Image(getClass().getResourceAsStream("resources\\home.png"));
        home.setGraphic(new ImageView(img));

        user = new JFXButton("USER");
        user.setId("dash_userBtn");
        user.setButtonType(JFXButton.ButtonType.FLAT);
        user.setPrefSize(150, 75);
        user.setOnAction(event -> {
            Parent Userview = new UserRegistration();
            this.setCenter(Userview);
        });
        Image img1 = new Image(getClass().getResourceAsStream("resources\\user.png"));
        user.setGraphic(new ImageView(img1));

        donor = new JFXButton("DONOR");
        donor.setButtonType(JFXButton.ButtonType.FLAT);
        donor.setId("dash_donorBtn");
        donor.setPrefSize(150, 75);


        recipient = new JFXButton("RECIPIENTS");
        recipient.setId("dash_recipientBtn");
        recipient.setButtonType(JFXButton.ButtonType.FLAT);
        recipient.setPrefSize(150, 75);

        bloodbank = new JFXButton("BLOODBANK");
        bloodbank.setId("dash_bloodbankBtn");
        bloodbank.setButtonType(JFXButton.ButtonType.FLAT);
        bloodbank.setPrefSize(150, 75);

        statistics = new JFXButton("STATISTICS");
        statistics.setId("dash_statBtn");
        statistics.setButtonType(JFXButton.ButtonType.FLAT);
        statistics.setPrefSize(150, 75);

        vbox = new VBox();
        vbox.setId("dash_vbox");
        vbox.getChildren().addAll(home, user, donor, recipient, bloodbank, statistics);


        this.setLeft(vbox);
    }
}
