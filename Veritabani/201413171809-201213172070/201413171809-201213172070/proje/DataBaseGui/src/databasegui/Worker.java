/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databasegui;

import java.util.Arrays;



/**
 *
 * @author Rmzn
 */
public class Worker {

    private String Name, SirName, Sex, Address, Date ;
    private int ID, Salary, Department_Id, Project_Id;
    
    
    // default degerler...
    public Worker() {
        ID = -1;
        Name = "";
        SirName = "";
        Sex = "";
        Address = "";
        Date = "";
        Department_Id = -1;
        Project_Id = -1;
        Salary = 0;
        
    }
    
    public Worker( int id, String name, String sirname, String sex, String address, String date, int salary, int DepId, int ProId ) {
        ID = id;
        Name = name;
        SirName = sirname;
        Sex = sex;
        Address = address;
        Date = date;
        Salary = salary;
        Department_Id = DepId;
        Project_Id = ProId;
        
    }

    /**
     * @return the Name
     */
    public String getName() {
        return Name;
    }

    /**
     * @param Name the Name to set
     */
    public void setName(String Name) {
        this.Name = Name;
    }

    /**
     * @return the SirName
     */
    public String getSirName() {
        return SirName;
    }

    /**
     * @param SirName the SirName to set
     */
    public void setSirName(String SirName) {
        this.SirName = SirName;
    }

    /**
     * @return the Sex
     */
    public String getSex() {
        return Sex;
    }

    /**
     * @param Sex the Sex to set
     */
    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    /**
     * @return the Address
     */
    public String getAddress() {
        return Address;
    }

    /**
     * @param Address the Address to set
     */
    public void setAddress(String Address) {
        this.Address = Address;
    }

    /**
     * @return the Date
     */
    public String getDate() {
        return Date;
    }

    /**
     * @param Date the Date to set
     */
    public void setDate(String Date) {
        this.Date = Date;
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
     * @return the Salary
     */
    public int getSalary() {
        return Salary;
    }

    /**
     * @param Salary the Salary to set
     */
    public void setSalary(int Salary) {
        this.Salary = Salary;
    }

    /**
     * @return the Department_Id
     */
    public int getDepartment_Id() {
        return Department_Id;
    }

    /**
     * @param Department_Id the Department_Id to set
     */
    public void setDepartment_Id(int Department_Id) {
        this.Department_Id = Department_Id;
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
    
    //System.out.printf("%-12s%-12s\n","Column 1","Column 2");
    
    @Override
    public String toString() {
        return String.format("%-8s%-14s%-14s%-9s%-14s%-9s%-24s%-8s%-4s", ID , Name , SirName , Salary , Date ,
                                                                            Sex, Address, Department_Id, Project_Id);
    }
     
    
}
