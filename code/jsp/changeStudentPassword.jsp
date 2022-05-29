<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/changeStudentPassword.css">
        <link href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap" rel="stylesheet">
        <title>Change Password</title>
    </head>

    <body>
        <header class="class">
            <!-- Left Box for logo -->
            <div class="left">
                <img src="../images/logobg.png" alt="">
            </div>
        </header>   
    <%
//        We get the student emailid through session
        String emailId = (String) session.getAttribute("mailid");    
    %>
    <!--HTML code for the student update password form-->
    <div class="one">
        <form>
            <div class="form-box">
                <div class="header-text">Change your Password</div>
                <input type="password" name="newpassword" placeholder="Enter new password" maxlength="20" />
                <input type="password" name="confirmpassword" placeholder="Confirm password" maxlength="20"/>
                <button type="submit" class="btn" name="save">Save</button>
            </div>
        </form>
    </div>
    <!--HTML code for footer-->     
    <footer class="ct-footer" >     
        <div class="inner-right">
            <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
        </div>
    </footer>
    </body>
</html>
<!--Java code to update the student password-->
<%
    if (request.getParameter("save") != null) {
        String newpass, confirmpass;
        newpass = request.getParameter("newpassword"); // we get the new password entered by the student
        confirmpass = request.getParameter("confirmpassword"); // we get the confirmed password entered by the student
        if(newpass.length()<6){ // check to see if password length is >= 6 or not
            out.println("<html><span id=error><p>Password length must be atleast 6 characters</p></span></html>");
            return;  
        } 
        if (!newpass.equals(confirmpass)) { // check to see if new password and confirm password match exactly
            out.println("<html><span id=error><p>Passwords do not match</p></span></html>");
            return;
        }
        if (newpass == "") { // check if student has entered the new password or not.
            out.println("<html><span id=error><p>Please enter your new password!</p></span></html>");
            return;
        }
        String query = "Select * from student where semailid='" + emailId + "'";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if (status) {
//                we update the student password using appropriate SQL query
                String updateQuery = "Update student set spassword='" + newpass + "' where semailid='" + emailId + "'";
                Statement stmt_update = conn.createStatement();
                int i = stmt_update.executeUpdate(updateQuery);
                if (i > 0) {
                    out.println("<script>alert('Password has been updated');</script>");
                } else {
                    out.println("<script>alert('Error in updating password');</script>");
                }
                return;
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>
