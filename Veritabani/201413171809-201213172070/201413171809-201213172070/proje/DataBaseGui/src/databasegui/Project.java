/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databasegui;

/**
 *
 * @author Rmzn
 */
public class Project {
    
    private String Pro_Name, Location;
    private int ID;
    
    
    // Default Degerler
    public Project() {
        
        Pro_Name = "";
        Location = "";
        ID = -1;
    }

    public Project(String Dep_Name, String Location, int ID, int Project_Id) {
        this.Pro_Name = Dep_Name;
        this.Location = Location;
        this.ID = ID;
    }

    /**
     * @return the Dep_Name
     */
    public String getDep_Name() {
        return Pro_Name;
    }

    /**
     * @param Dep_Name the Dep_Name to set
     */
    public void setDep_Name(String Dep_Name) {
        this.Pro_Name = Dep_Name;
    }

    /**
     * @return the Location
     */
    public String getLocation() {
        return Location;
    }

    /**
     * @param Location the Location to set
     */
    public void setLocation(String Location) {
        this.Location = Location;
    }

    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    @Override
    public String toString() {
        return  String.format( "%-19s%-35s%-10s" , ID , Pro_Name , Location); 
    }
    
    
    
}
