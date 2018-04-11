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
public class Department {
    
    private String Dep_Name, Location;
    private int ID, Project_Id, EmployeeNum;

    public Department() {
        Dep_Name = "";
        Location = "";
        ID = -1;        
        Project_Id = -1;
        EmployeeNum=0;
    
    }
    

    public Department(String Dep_Name, String Location, int ID, int Project_Id, int EmployeeNum) {
        this.Dep_Name = Dep_Name;
        this.Location = Location;
        this.ID = ID;
        this.Project_Id = Project_Id;
        this.EmployeeNum = EmployeeNum;
    }

    
    /**
     * @return the Dep_Name
     */
    public String getDep_Name() {
        return Dep_Name;
    }

    /**
     * @param Dep_Name the Dep_Name to set
     */
    public void setDep_Name(String Dep_Name) {
        this.Dep_Name = Dep_Name;
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

    /**
     * @return the Project_Id
     */
    public int getProject_Id() {
        return Project_Id;
    }

    /**
     * @param Project_Id the Project_Id to set
     */
    public void setProject_Id(int Project_Id) {
        this.Project_Id = Project_Id;
    }

    @Override
    public String toString() {
        return  String.format("%-8s%-34s%-14s%-8s%-4s" ,ID , Dep_Name , Location , getEmployeeNum(), Project_Id );
    }

    /**
     * @return the EmployeeNum
     */
    public int getEmployeeNum() {
        return EmployeeNum;
    }

    /**
     * @param EmployeeNum the EmployeeNum to set
     */
    public void setEmployeeNum(int EmployeeNum) {
        this.EmployeeNum = EmployeeNum;
    }
    
    
    
    
}
