<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Student Profile</title>
        <link rel="stylesheet" href="../css/studentProfile.css">
    </head>
    <body>
        <% 
//            We get the student emailid through session
            String emailId = (String) session.getAttribute("mailid");
        %>        
        <div class="wrapper">
            <!--on the left side student logo and name to be appeared-->
            <div class="left">
                <img src="../images/student.png" alt="student" width="100">
                <h4>
                <%      
                    try {
                        String name = "Select * from student where semailid='" + emailId + "'";
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(name);
                        while (rs.next()) {
                            out.println(rs.getString(2));
                        }
                        conn.close();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                %>  
                </h4>
                <p>Student</p>
            </div>
            <!--on the right all the details of the student available in database to be displayed-->    
            <div class="right">
                <div class="info">
                    <h3>YOUR PROFILE</h3>
                    <div class="info_data">
                        <div class="data">
                            <!--displaying student emailid-->
                            <h4>Email</h4>
                            <p>
                                <%
                                    try {
                                        String name = "Select * from student where semailid='" + emailId + "'";
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(name);
                                        while (rs.next()) {
                                            out.println(rs.getString(1));
                                        }
                                        conn.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>  
                            </p>
                        </div>
                        <div class="data">
                            <!--displaying student branch-->
                            <h4>Branch</h4>
                            <p>
                                <%
                                    try {
                                        String name = "Select * from student where semailid='" + emailId + "'";
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(name);
                                        while (rs.next()) {
                                            out.println(rs.getString(3));
                                        }
                                        conn.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>  
                            </p>
                        </div>
                        <div class="data">
                            <!--displaying student current year of B.Tech-->
                            <h4>Year</h4>
                            <p>
                                <%
                                    try {
                                        String name = "Select * from student where semailid='" + emailId + "'";
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(name);
                                        while (rs.next()) {
                                            out.println(rs.getString(4));
                                        }
                                        conn.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>  
                            </p>
                        </div>
                        <div class="data">
                            <!--displaying student password in * form-->
                            <h4>Password</h4>
                            <p>
                                <%
                                    try {
                                        String name = "Select * from student where semailid='" + emailId + "'";
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(name);
                                        while (rs.next()) {
                                            String pwd = rs.getString(5);
                                            for (int i = 0; i < pwd.length(); i++) {
                                                out.print("*");
                                            }
                                        }
                                        conn.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>  
                            </p>
                        </div>
                        <div class="data">
                            <!--displaying student security question-->
                            <h4>Security Question</h4>
                            <p>
                                <%
                                    try {
                                        String name = "Select * from student where semailid='" + emailId + "'";
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(name);
                                        while (rs.next()) {
                                            out.println(rs.getString(6));
                                        }
                                        conn.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>  
                            </p>
                        </div>
                        <div class="data">
                            <!--displaying student security answer-->
                            <h4>Security Answer</h4>
                            <p>
                                <%
                                    try {
                                        String name = "Select * from student where semailid='" + emailId + "'";
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery(name);
                                        while (rs.next()) {
                                            out.println(rs.getString(7));
                                        }
                                        conn.close();
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>  
                            </p>
                        </div>
                    </div>
                    <div class="change">
                        <!--button for change password-->
                        <div class="btn">
                            <button type="button" onclick="window.open( '../jsp/changeStudentPassword.jsp');">Change Password</button>
                        </div>
                        <!--button for change security question and answer-->
                        <div class="btn">
                            <button type="button" onclick="window.open(  '../jsp/changeSecQuesAnsStudent.jsp');">Change Security QnA</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <!-- div for responsive footer-->
            <footer class="ct-footer" >     
                <div class="inner-right">
                    <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
                </div>
            </footer>
        </div>
    </body>
</html>
