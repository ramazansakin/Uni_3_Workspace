/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databasegui;

import java.sql.SQLException;

/**
 *
 * @author Rmzn
 */
public class DataBaseGui {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        GuiDataBase newDataBase = new GuiDataBase();
        newDataBase.setVisible(true);
        newDataBase.setTitle("Company Database");
        newDataBase.setResizable(false);
        
    }
    
}
