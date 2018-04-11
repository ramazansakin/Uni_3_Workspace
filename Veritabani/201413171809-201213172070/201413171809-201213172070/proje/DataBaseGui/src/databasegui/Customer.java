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
public class Customer {
    
    private int  cust_id, cust_pro_id;
    private String  name, Surname;

    public Customer() {
        
        cust_id =-1;
        cust_pro_id = -1;
        name = "";
        Surname= "";
    }

    public Customer(int cust_id, int cust_pro_id, String name, String Surname) {
        this.cust_id = cust_id;
        this.cust_pro_id = cust_pro_id;
        this.name = name;
        this.Surname = Surname;
    }

    /**
     * @return the cust_id
     */
    public int getCust_id() {
        return cust_id;
    }

    /**
     * @param cust_id the cust_id to set
     */
    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    /**
     * @return the cust_pro_id
     */
    public int getCust_pro_id() {
        return cust_pro_id;
    }

    /**
     * @param cust_pro_id the cust_pro_id to set
     */
    public void setCust_pro_id(int cust_pro_id) {
        this.cust_pro_id = cust_pro_id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the Surname
     */
    public String getSurname() {
        return Surname;
    }

    /**
     * @param Surname the Surname to set
     */
    public void setSurname(String Surname) {
        this.Surname = Surname;
    }

    @Override
    public String toString() {
        return String.format("%-8s%-14s%-14s%-8s", cust_id,name,Surname,cust_pro_id);
    
    }
    
    
    
    
    
}
