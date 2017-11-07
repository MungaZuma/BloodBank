package sample;

import com.jfoenix.controls.JFXButton;
import javafx.application.Application;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class MainClass extends Application {

    public JFXButton call;
    Parent loco, dash;

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primaryStage) throws Exception {

        loco = new LoginScreen();
        Scene newscene = new Scene(loco, 700, 500);
        newscene.getStylesheets().add(getClass().getResource("LoginScreen.css").toExternalForm());
        primaryStage = new Stage();
        primaryStage.setScene(newscene);
        primaryStage.show();

    }

}
