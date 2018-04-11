/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package databasegui;

import java.awt.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultListModel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author Rmzn
 */
public class GuiDataBase extends javax.swing.JFrame {

    DefaultListModel<Worker> workers = new DefaultListModel<>();
    DefaultListModel<Department> departments = new DefaultListModel<>();
    DefaultListModel<Project> projects = new DefaultListModel<>();
    DefaultListModel<Customer> customers = new DefaultListModel<>();
    public Connection connection = null;
    public Statement st = null;
    public ResultSet rs = null;
    
    private int numOfCustomers   = 0;
    private int numOfWorker      = 0;
    private int numOfDepartments = 0;
    private int numOfProjects    = 0;
    
    
    /**
     * Creates new form GuiDataBase
     */
    public GuiDataBase() throws ClassNotFoundException, SQLException {
        initComponents();
        
        try {
            Class.forName("org.postgresql.Driver");
        }catch (ClassNotFoundException e){
            
            System.out.println("JDBC driver nerede");
            return;
        }

        System.out.println("PostgreSQL JDBC Driver Registered!");
        connection = null;

        String databasePath = "jdbc:postgresql://127.0.0.1:";
        String portNumber ;
        String databasePass;
        String DatabaseName;
        
        
        DatabaseName = JOptionPane.showInputDialog("Please enter the Database Name:");
        databasePass = JOptionPane.showInputDialog("Please enter your DataBase password to get your datas:");
        portNumber = JOptionPane.showInputDialog("Please neter your database port number :");
        
        databasePath += portNumber;
        databasePath += "/";
        databasePath += DatabaseName;
        
        try{
            connection = DriverManager.getConnection(
                        databasePath,"postgres", databasePass );

        }catch(SQLException e){
            System.out.println("Connection Failed! Check output console");
            return;
        }
        
        st = (Statement) connection.createStatement();
        
        
        ////////////////////////////////////////////////////////////////////////
        String SQL = "SELECT * FROM calisan;";
        
        rs = st.executeQuery(SQL);
        
        while( rs.next() ){
            Worker newWorker = new Worker();
            
            newWorker.setID( rs.getInt("p_id") );
            newWorker.setName( rs.getString("ad") );
            newWorker.setSirName( rs.getString("soyad") );
            newWorker.setSalary(rs.getInt("maas") );
            newWorker.setDate( rs.getString("d_tarih") );
            newWorker.setSex( rs.getString("cinsiyet") );
            newWorker.setAddress(rs.getString("adres") );
            newWorker.setDepartment_Id(rs.getInt("bolum_id") );
            newWorker.setProject_Id(rs.getInt("proje_id") );
            ++numOfWorker;
            workers.addElement(newWorker);
        }
        
        workerjList.setModel(workers);
        
        ///////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////
        SQL = "SELECT * FROM bolum;";
        
        rs = st.executeQuery(SQL);
        
        while( rs.next() ){
            Department newDep = new Department();
            
            newDep.setID(rs.getInt("bolum_no") );
            newDep.setDep_Name(rs.getString("isim") );
            newDep.setLocation(rs.getString("lokasyon") );
            newDep.setEmployeeNum(rs.getInt("calisan_sayisi") );
            newDep.setProject_Id(rs.getInt("proje_id") );
            
            ++numOfDepartments;
            departments.addElement(newDep);
            
        }
        
        departmentList.setModel(departments);
        
        ////////////////////////////////////////////////////////////////////////
         ////////////////////////////////////////////////////////////////////////
        SQL = "SELECT * FROM proje;";
        
        rs = st.executeQuery(SQL);
        
        while( rs.next() ){
            Project newPro = new Project();
            
            newPro.setID(rs.getInt("proje_no") );
            newPro.setDep_Name(rs.getString("isim") );
            newPro.setLocation(rs.getString("lokasyon") );
            
            ++numOfProjects;
            projects.addElement(newPro);
            
        }
        
        ProjectList.setModel(projects);
        
        ////////////////////////////////////////////////////////////////////////
        ////////////////////////////////////////////////////////////////////////
        SQL = "SELECT * FROM musteri;";
        
        rs = st.executeQuery(SQL);
        
        while( rs.next() ){
            Customer newCus = new Customer();
            
            newCus.setCust_id( rs.getInt("id") );
            newCus.setCust_pro_id( rs.getInt("musteri_proje_no")  );
            newCus.setName(rs.getString("ad"));
            newCus.setSurname(rs.getString("soyad"));
            
            ++numOfCustomers;
            customers.addElement(newCus);
        }
        
        CustomerList.setModel(customers);
        
        /////////////////////////////////////////////////////////////////////////
        
        if (connection != null) {
                System.out.println("Veritabanina baglanti saglandi.!");
        }else {
                System.out.println("Baglantida hata meydana geldi.");
        }
        
        
        ////////////////////////////////////////////////////////////////////////
        UpText.setText(String.format("%-8s%-14s%-14s%-9s%-14s%-9s%-24s%-8s%-4s" ,"ID" , "Name" , "SurName" , "Slry" , "Date" ,
                                                                            "Sex", "Address", "DiD", "PiD"));
        upText2.setText( String.format("%-8s%-34s%-14s%-8s%-4s" ,"ID" , "Name" , "Location" , "EmpN" , "PiD") );

        upText3.setText(String.format( "%-19s%-35s%-10s" , "ID" , "Project Name" , "Location") );
        
        upText4.setText( String.format("%-8s%-14s%-14s%-8s", "ID","Name","Surname","PiD") );
    
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        WorkerList = new javax.swing.JTabbedPane();
        ProjectPanel = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        ProjectList = new javax.swing.JList();
        AddBtnProject = new javax.swing.JButton();
        DeleteBtnProject = new javax.swing.JButton();
        UpdateBtnProject = new javax.swing.JButton();
        upText3 = new javax.swing.JTextField();
        DepartmentPAnel = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        departmentList = new javax.swing.JList();
        addBtnDepartment = new javax.swing.JButton();
        deleteBtnDepartment = new javax.swing.JButton();
        updateBtnDepartment = new javax.swing.JButton();
        upText2 = new javax.swing.JTextField();
        WorkerPanel = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        workerjList = new javax.swing.JList();
        addButtonWorker = new javax.swing.JButton();
        deleteBtnWorker = new javax.swing.JButton();
        updateBtnWorker = new javax.swing.JButton();
        UpText = new javax.swing.JTextField();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        CustomerList = new javax.swing.JList();
        upText4 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(102, 153, 255));
        setForeground(new java.awt.Color(153, 153, 153));

        WorkerList.setName(""); // NOI18N

        ProjectPanel.setBackground(new java.awt.Color(153, 153, 153));

        ProjectList.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N
        jScrollPane3.setViewportView(ProjectList);

        AddBtnProject.setBackground(new java.awt.Color(0, 204, 204));
        AddBtnProject.setForeground(new java.awt.Color(102, 255, 102));
        AddBtnProject.setText("Add");
        AddBtnProject.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AddBtnProjectActionPerformed(evt);
            }
        });

        DeleteBtnProject.setBackground(new java.awt.Color(0, 204, 204));
        DeleteBtnProject.setForeground(new java.awt.Color(255, 51, 51));
        DeleteBtnProject.setText("Delete");
        DeleteBtnProject.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                DeleteBtnProjectActionPerformed(evt);
            }
        });

        UpdateBtnProject.setBackground(new java.awt.Color(0, 204, 204));
        UpdateBtnProject.setForeground(new java.awt.Color(255, 153, 51));
        UpdateBtnProject.setText("Update");
        UpdateBtnProject.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                UpdateBtnProjectActionPerformed(evt);
            }
        });

        upText3.setEditable(false);
        upText3.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N

        javax.swing.GroupLayout ProjectPanelLayout = new javax.swing.GroupLayout(ProjectPanel);
        ProjectPanel.setLayout(ProjectPanelLayout);
        ProjectPanelLayout.setHorizontalGroup(
            ProjectPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ProjectPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(ProjectPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addComponent(upText3)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 519, Short.MAX_VALUE))
                .addGap(10, 10, 10)
                .addGroup(ProjectPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(UpdateBtnProject, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(DeleteBtnProject, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(AddBtnProject, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        ProjectPanelLayout.setVerticalGroup(
            ProjectPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(ProjectPanelLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(upText3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(ProjectPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(ProjectPanelLayout.createSequentialGroup()
                        .addComponent(AddBtnProject)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(DeleteBtnProject)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(UpdateBtnProject)
                        .addGap(0, 264, Short.MAX_VALUE))
                    .addComponent(jScrollPane3))
                .addContainerGap())
        );

        WorkerList.addTab("Project", ProjectPanel);

        DepartmentPAnel.setBackground(new java.awt.Color(153, 153, 153));

        departmentList.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N
        jScrollPane2.setViewportView(departmentList);

        addBtnDepartment.setBackground(new java.awt.Color(0, 204, 204));
        addBtnDepartment.setForeground(new java.awt.Color(102, 255, 102));
        addBtnDepartment.setText("Add");
        addBtnDepartment.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addBtnDepartmentActionPerformed(evt);
            }
        });

        deleteBtnDepartment.setBackground(new java.awt.Color(0, 204, 204));
        deleteBtnDepartment.setForeground(new java.awt.Color(255, 51, 51));
        deleteBtnDepartment.setText("Delete");
        deleteBtnDepartment.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteBtnDepartmentActionPerformed(evt);
            }
        });

        updateBtnDepartment.setBackground(new java.awt.Color(0, 204, 204));
        updateBtnDepartment.setForeground(new java.awt.Color(255, 204, 51));
        updateBtnDepartment.setText("Update");
        updateBtnDepartment.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateBtnDepartmentActionPerformed(evt);
            }
        });

        upText2.setEditable(false);
        upText2.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N
        upText2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                upText2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout DepartmentPAnelLayout = new javax.swing.GroupLayout(DepartmentPAnel);
        DepartmentPAnel.setLayout(DepartmentPAnelLayout);
        DepartmentPAnelLayout.setHorizontalGroup(
            DepartmentPAnelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(DepartmentPAnelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(DepartmentPAnelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(upText2)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.DEFAULT_SIZE, 511, Short.MAX_VALUE))
                .addGap(10, 10, 10)
                .addGroup(DepartmentPAnelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(deleteBtnDepartment, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(addBtnDepartment, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(updateBtnDepartment, javax.swing.GroupLayout.PREFERRED_SIZE, 75, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(28, Short.MAX_VALUE))
        );
        DepartmentPAnelLayout.setVerticalGroup(
            DepartmentPAnelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(DepartmentPAnelLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(upText2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(DepartmentPAnelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(DepartmentPAnelLayout.createSequentialGroup()
                        .addComponent(addBtnDepartment)
                        .addGap(13, 13, 13)
                        .addComponent(deleteBtnDepartment)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(updateBtnDepartment)
                        .addGap(0, 262, Short.MAX_VALUE))
                    .addComponent(jScrollPane2))
                .addContainerGap())
        );

        WorkerList.addTab("Department", DepartmentPAnel);

        WorkerPanel.setBackground(new java.awt.Color(153, 153, 153));

        workerjList.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N
        workerjList.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                workerjListMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(workerjList);

        addButtonWorker.setBackground(new java.awt.Color(0, 204, 204));
        addButtonWorker.setForeground(new java.awt.Color(51, 255, 51));
        addButtonWorker.setLabel("Add");
        addButtonWorker.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                addButtonWorkerActionPerformed(evt);
            }
        });

        deleteBtnWorker.setBackground(new java.awt.Color(0, 204, 204));
        deleteBtnWorker.setForeground(new java.awt.Color(255, 51, 51));
        deleteBtnWorker.setLabel("Delete");
        deleteBtnWorker.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteBtnWorkerActionPerformed(evt);
            }
        });

        updateBtnWorker.setBackground(new java.awt.Color(0, 204, 204));
        updateBtnWorker.setForeground(new java.awt.Color(255, 204, 51));
        updateBtnWorker.setLabel("Update");
        updateBtnWorker.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateBtnWorkerActionPerformed(evt);
            }
        });

        UpText.setEditable(false);
        UpText.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N
        UpText.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                UpTextActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout WorkerPanelLayout = new javax.swing.GroupLayout(WorkerPanel);
        WorkerPanel.setLayout(WorkerPanelLayout);
        WorkerPanelLayout.setHorizontalGroup(
            WorkerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(WorkerPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(WorkerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(WorkerPanelLayout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 515, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(WorkerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(deleteBtnWorker, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)
                            .addComponent(updateBtnWorker, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)
                            .addComponent(addButtonWorker, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addComponent(UpText, javax.swing.GroupLayout.PREFERRED_SIZE, 511, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(24, Short.MAX_VALUE))
        );
        WorkerPanelLayout.setVerticalGroup(
            WorkerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(WorkerPanelLayout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(UpText, javax.swing.GroupLayout.PREFERRED_SIZE, 20, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(WorkerPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(WorkerPanelLayout.createSequentialGroup()
                        .addComponent(addButtonWorker)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(deleteBtnWorker)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(updateBtnWorker)
                        .addGap(0, 264, Short.MAX_VALUE))
                    .addComponent(jScrollPane1))
                .addContainerGap())
        );

        WorkerList.addTab("Worker", WorkerPanel);

        jPanel1.setBackground(new java.awt.Color(153, 153, 153));

        CustomerList.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N
        jScrollPane4.setViewportView(CustomerList);

        upText4.setEditable(false);
        upText4.setFont(new java.awt.Font("Comic Sans MS", 1, 10)); // NOI18N

        jButton1.setBackground(new java.awt.Color(0, 204, 204));
        jButton1.setForeground(new java.awt.Color(0, 255, 0));
        jButton1.setText("Add");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setBackground(new java.awt.Color(0, 204, 204));
        jButton2.setForeground(new java.awt.Color(255, 0, 0));
        jButton2.setText("Delete");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setBackground(new java.awt.Color(0, 204, 204));
        jButton3.setForeground(new java.awt.Color(255, 153, 51));
        jButton3.setText("Update");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 519, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(jButton1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jButton2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jButton3, javax.swing.GroupLayout.DEFAULT_SIZE, 75, Short.MAX_VALUE)))
                    .addComponent(upText4, javax.swing.GroupLayout.PREFERRED_SIZE, 519, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(20, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addComponent(upText4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jButton1)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton3)
                        .addGap(272, 275, Short.MAX_VALUE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jScrollPane4)
                        .addContainerGap())))
        );

        WorkerList.addTab("Customer", jPanel1);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(WorkerList)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(WorkerList, javax.swing.GroupLayout.Alignment.TRAILING)
        );

        WorkerList.getAccessibleContext().setAccessibleName("Worker");
        WorkerList.getAccessibleContext().setAccessibleDescription("");

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void UpdateBtnProjectActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_UpdateBtnProjectActionPerformed

        int index = ProjectList.getSelectedIndex();
        String name, query;
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a Project to update!!");
        }else{
            Project newPro = new Project();

        newPro.setID( projects.get(index).getID() );
        
            
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 30 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Project Name");
            if ( name.length() <= 30 && !name.isEmpty() )
                newPro.setDep_Name(name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 30 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Location");
            if ( name.length() <= 10 && !name.isEmpty() )
                newPro.setLocation( name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
            
        query = "UPDATE proje  SET  isim = '" + newPro.getDep_Name()
                                                 + "' , lokasyon = '"+ newPro.getLocation()
                                                 + "'  WHERE proje_no = " + projects.get(index).getID()+";"  ;
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            projects.setElementAt(newPro, index);
            ProjectList.setModel(projects);

        }

    }//GEN-LAST:event_UpdateBtnProjectActionPerformed

    private void DeleteBtnProjectActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_DeleteBtnProjectActionPerformed

        // Delete a worker
        int index = ProjectList.getSelectedIndex();
        String query;
        
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a projeect to delete!!");
        }else{
            
            query = "DELETE FROM proje WHERE  proje_no = " + projects.get(index).getID()+" ;";
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
            projects.removeElementAt(index);
            ProjectList.setModel(projects);
        }

    }//GEN-LAST:event_DeleteBtnProjectActionPerformed

    private void AddBtnProjectActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AddBtnProjectActionPerformed
        // Add a new Project
        Project pro = new Project();
        ++numOfProjects;
        String query, name;
        
        
        
        pro.setID(numOfProjects);
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 30 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("PRoject Name");
            if ( name.length() <= 30 && !name.isEmpty() )
                pro.setDep_Name(name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 30 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Project Location");
            if ( name.length() <= 10 && !name.isEmpty() )
                pro.setLocation(name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        query = "INSERT INTO proje( proje_no, isim , lokasyon  ) VALUES ( '" + pro.getID() + "' , '"
                + pro.getDep_Name() + "', '" + pro.getLocation() + "' );";
        
        try {
            st.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        projects.addElement(pro);
        ProjectList.setModel(projects);

    }//GEN-LAST:event_AddBtnProjectActionPerformed

    private void updateBtnDepartmentActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateBtnDepartmentActionPerformed

        int index = departmentList.getSelectedIndex();
        String name, query;
        
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a Department to delete!!");
        }else{
            Department newDep = new Department();

         newDep.setID(departments.get(index).getID()) ;
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 30 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Department Name");
            if ( name.length() <= 30 && !name.isEmpty() )
                newDep.setDep_Name( name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 30 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Department Location");
            if ( name.length() <= 30 && !name.isEmpty() )
                newDep.setLocation( name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 4 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Project ID");
            if ( name.length() <= 4 && !name.isEmpty() )
                newDep.setProject_Id( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        query = "UPDATE bolum  SET   isim = '" + newDep.getDep_Name()
                                                 + "' , lokasyon = '"+ newDep.getLocation()
                                                 + "' , calisan_sayisi = "+newDep.getEmployeeNum()
                                                 + " ,  proje_id = "+ newDep.getProject_Id()
                                                 + " WHERE bolum_no = " + departments.get(index).getID()+";"  ;
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
        

            departments.setElementAt(newDep, index);
            departmentList.setModel(departments);
        }

    }//GEN-LAST:event_updateBtnDepartmentActionPerformed

    private void deleteBtnDepartmentActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteBtnDepartmentActionPerformed
            
        String query;
        // Delete a worker
        int index = departmentList.getSelectedIndex();
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a department to delete!!");
        }else{
            query = "DELETE FROM bolum WHERE  bolum_no = " + departments.get(index).getID()+" ;";
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            departments.removeElementAt(index);
            departmentList.setModel(departments);
        }
    }//GEN-LAST:event_deleteBtnDepartmentActionPerformed

    private void addBtnDepartmentActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addBtnDepartmentActionPerformed
        // add a new department
        Department dep = new Department();
        String name, query;
        ++numOfDepartments;
        
        dep.setID( numOfDepartments );
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 30 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Department Name");
            if ( name.length() <= 30 && !name.isEmpty() )
                dep.setDep_Name( name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 30 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Department Location");
            if ( name.length() <= 10 && !name.isEmpty() )
                dep.setLocation( name  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        ////////////////////////////////////////////////////////////////////////
        
        name ="";
        while( name.length() > 4 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Number Of Employee");
            if ( name.length() <= 4 && !name.isEmpty() )
                dep.setEmployeeNum( Integer.parseInt(name)  );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////////////////
        
        
        name ="";
        while( name.length() > 4 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Project ID");
            if ( name.length() <= 4 && !name.isEmpty() )
                dep.setProject_Id( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        query = "INSERT INTO bolum( bolum_no, isim , lokasyon,calisan_sayisi,  proje_id ) VALUES ( '" + dep.getID() + "' , '"
                + dep.getDep_Name()+"', '" +  dep.getLocation() + "', '"+ dep.getEmployeeNum()+ "', '"+dep.getProject_Id() +"' );";
        
        try {
            st.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
        }

        departments.addElement(dep);
        departmentList.setModel(departments);

    }//GEN-LAST:event_addBtnDepartmentActionPerformed

    private void updateBtnWorkerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateBtnWorkerActionPerformed

        int index = workerjList.getSelectedIndex();
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a Worker to update!!");
        }else{
            Worker worker = new Worker();
            String name ="";
            
            worker.setID( workers.get(index).getID() );
            
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Name");
            if ( name.length() <= 10 && !name.isEmpty() )
                worker.setName( name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        
        /////////////////////////////////////////////////////////////

        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Surname");
            if ( name.length() <= 10 && !name.isEmpty())
                worker.setSirName(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 5 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Sex ( Bay veya Bayan )");
            if ( name.length() <= 5 && !name.isEmpty())
                worker.setSex(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter bay and bayan!!!");
            }
        }
        
        ///////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 20 || name == ""|| name.isEmpty()){
            name = JOptionPane.showInputDialog("Address");
            if ( name.length() <= 20 && !name.isEmpty())
                worker.setAddress(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 20 characters and below!!!");
            }
        }
        
        
        ///////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Date");
            if ( name.length() <= 10 && !name.isEmpty())
                worker.setDate(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        
        
        //////////////////////////////////////////////////////
        name ="";
        while( name.length() > 5 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Salary");
            if ( name.length() <= 5 && !name.isEmpty())
                worker.setSalary( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 5 characters and below!!!");
            }
        }
        
        ///////////////////////////////////////////////////////////
        name = "";
        while( name.length() > 4 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Department ID");
            if ( name.length() <= 4 && !name.isEmpty())
                worker.setDepartment_Id( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        ///////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 4 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Project ID");
            if ( name.length() <= 4 && !name.isEmpty() )
                worker.setProject_Id(Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
            
        
        //--------------------------------------------------------------------
            String query ;
            
            query = "UPDATE calisan  SET   ad = '" + worker.getName()
                                                 + "' , soyad = '"+ worker.getSirName() 
                                                 + "' , maas = "+worker.getSalary()
                                                 + " , cinsiyet = '"+ worker.getSex() 
                                                 + "' , adres = '" + worker.getAddress()
                                                 + "' , bolum_id = "+worker.getDepartment_Id()
                                                 + " ,  proje_id = "+worker.getProject_Id()
                                                 + " WHERE p_id = " + workers.get(index).getID()+";"  ;
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            workers.setElementAt(worker, index);
            workerjList.setModel(workers);

        }

    }//GEN-LAST:event_updateBtnWorkerActionPerformed

    private void deleteBtnWorkerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteBtnWorkerActionPerformed
        
        String query;
        // Delete a worker
        int index = workerjList.getSelectedIndex();
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a Worker to delete!!");
        }else{
            query = "DELETE FROM calisan WHERE  p_id = " + workers.get(index).getID()+" ;";
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
        workers.removeElementAt(index);
        workerjList.setModel(workers);
        
        }

    }//GEN-LAST:event_deleteBtnWorkerActionPerformed

    private void addButtonWorkerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_addButtonWorkerActionPerformed
        // add a new worker
        Worker worker = new Worker();
        ++numOfWorker;
        String name ="";
        String query;
        
        
        
        worker.setID(numOfWorker);
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Name");
            if ( name.length() <= 10 && !name.isEmpty() )
                worker.setName( name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        
        /////////////////////////////////////////////////////////////

        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Surname");
            if ( name.length() <= 10 && !name.isEmpty())
                worker.setSirName(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 5 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Sex (Bay veya Bayan)");
            if ( name.length() <= 5 && !name.isEmpty())
                worker.setSex(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter bay or bayan!!!");
            }
        }
        
        ///////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 20 || name == ""|| name.isEmpty()){
            name = JOptionPane.showInputDialog("Address");
            if ( name.length() <= 20 && !name.isEmpty())
                worker.setAddress(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 20 characters and below!!!");
            }
        }
        
        
        ///////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Date");
            if ( name.length() <= 10 && !name.isEmpty())
                worker.setDate(name );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        
        
        //////////////////////////////////////////////////////
        name ="";
        while( name.length() > 5 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Salary");
            if ( name.length() <= 5 && !name.isEmpty())
                worker.setSalary( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 5 characters and below!!!");
            }
        }
        
        ///////////////////////////////////////////////////////////
        name = "";
        while( name.length() > 4 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Department ID");
            if ( name.length() <= 4 && !name.isEmpty())
                worker.setDepartment_Id( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        ///////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 4 || name == "" || name.isEmpty()){
            name = JOptionPane.showInputDialog("Project ID");
            if ( name.length() <= 4 && !name.isEmpty() )
                worker.setProject_Id(Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        query = "INSERT INTO calisan( p_id, ad, soyad, maas, d_tarih, cinsiyet, adres, bolum_id, proje_id ) VALUES ( '"+ worker.getID()
                + "' , '"+ worker.getName() +"', '"+ worker.getSirName() +"' , '"+ worker.getSalary() +"', '"+ worker.getDate()
                + "' , '"+ worker.getSex()+"','"+ worker.getAddress() +"', '"+ worker.getDepartment_Id()+"' , '"+ worker.getProject_Id()+"' );";
        
        try {
            st.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        workers.addElement(worker);
        workerjList.setModel(workers);
    }//GEN-LAST:event_addButtonWorkerActionPerformed

    private void workerjListMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_workerjListMouseClicked

    }//GEN-LAST:event_workerjListMouseClicked

    private void UpTextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_UpTextActionPerformed
        
    }//GEN-LAST:event_UpTextActionPerformed

    private void upText2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_upText2ActionPerformed
        
    }//GEN-LAST:event_upText2ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // add a new department
        Customer cust = new Customer();
        String name, query;
        ++numOfCustomers;
        
        cust.setCust_id(numOfCustomers);
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Customer Name");
            if ( name.length() <= 10 && !name.isEmpty() )
                cust.setName(name);
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Customer Surname");
            if ( name.length() <= 10 && !name.isEmpty() )
                cust.setSurname(name);
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        ////////////////////////////////////////////////////////////////////////
        
        name ="";
        while( name.length() > 4 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Customer Project Id");
            if ( name.length() <= 4 && !name.isEmpty() )
                cust.setCust_pro_id( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////////////////
       
        
        query = "INSERT INTO musteri( id, ad, soyad, musteri_proje_no ) VALUES ( '" + cust.getCust_id() + "' , '"
                + cust.getName()+"', '" + cust.getSurname() + "', '"+ cust.getCust_pro_id() +"' );";
        
        try {
            st.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
        }

        customers.addElement( cust );
        CustomerList.setModel(customers);
        
        
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        
         String query;
        // Delete a worker
        int index = CustomerList.getSelectedIndex();
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a customer to delete!!");
        }else{
            query = "DELETE FROM musteri WHERE  id = " + customers.get(index).getCust_id()+" ;";
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            customers.removeElementAt(index);
            CustomerList.setModel(customers);
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        
        int index = CustomerList.getSelectedIndex();
        String name, query;
        
        if( index == -1 ){
            JOptionPane.showMessageDialog( null, "Select a customer to update!!");
        }else{
            Customer newCust = new Customer();

         newCust.setCust_id(customers.get(index).getCust_id()) ;
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Customer Name");
            if ( name.length() <= 10 && !name.isEmpty() )
                newCust.setName(name);
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 10 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Customer Surname");
            if ( name.length() <= 10 && !name.isEmpty() )
                newCust.setSurname(name);
            else{
                JOptionPane.showMessageDialog(null, "Please enter 10 characters and below!!!");
            }
        }
        ////////////////////////////////////////////////////////////
        name ="";
        while( name.length() > 4 || name == "" || name.isEmpty() ){
            name = JOptionPane.showInputDialog("Customer Project ID");
            if ( name.length() <= 4 && !name.isEmpty() )
                newCust.setCust_pro_id( Integer.parseInt(name) );
            else{
                JOptionPane.showMessageDialog(null, "Please enter 4 characters and below!!!");
            }
        }
        
        query = "UPDATE musteri  SET   ad = '" + newCust.getName()
                                             + "' , soyad = '"+ newCust.getSurname()
                                             + "' , musteri_proje_id = "+newCust.getCust_pro_id()
                                             + " WHERE  id = " + newCust.getCust_id() + ";"  ;
            
            try {
                st.executeUpdate(query);
            } catch (SQLException ex) {
                Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
            }
        

            customers.setElementAt(newCust, index);
            CustomerList.setModel(customers);
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(GuiDataBase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(GuiDataBase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(GuiDataBase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(GuiDataBase.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new GuiDataBase().setVisible(true);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(GuiDataBase.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton AddBtnProject;
    private javax.swing.JList CustomerList;
    private javax.swing.JButton DeleteBtnProject;
    private javax.swing.JPanel DepartmentPAnel;
    private javax.swing.JList ProjectList;
    private javax.swing.JPanel ProjectPanel;
    private javax.swing.JTextField UpText;
    private javax.swing.JButton UpdateBtnProject;
    private javax.swing.JTabbedPane WorkerList;
    private javax.swing.JPanel WorkerPanel;
    private javax.swing.JButton addBtnDepartment;
    private javax.swing.JButton addButtonWorker;
    private javax.swing.JButton deleteBtnDepartment;
    private javax.swing.JButton deleteBtnWorker;
    private javax.swing.JList departmentList;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JTextField upText2;
    private javax.swing.JTextField upText3;
    private javax.swing.JTextField upText4;
    private javax.swing.JButton updateBtnDepartment;
    private javax.swing.JButton updateBtnWorker;
    private javax.swing.JList workerjList;
    // End of variables declaration//GEN-END:variables
}
