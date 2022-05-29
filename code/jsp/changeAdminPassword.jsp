<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/changeAdminPassword.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap"
            rel="stylesheet"
            />
        <title>Change Password</title>
    </head>

    <body>
        <header class="class">
            <!-- Left Box for logo -->
            <div class="left">
                <div class="left"><img src="../images/logobg.png" alt="" /></div>
            </div>
        </header>

        <%
//            we get the admin emailid set through session
            String emailId = (String) session.getAttribute("mailid");
        %>

        <form>
            <!--form box for change password details-->
            <div class="form-box">
                <div class="header-text">Change your Password</div>
                <!--input for new password-->
                <input
                    type="password"
                    name="newpassword"
                    placeholder="Enter new password"
                    maxlength="20"
                    />
                <!--input to confirm the new password entered-->
                <input
                    type="password"
                    name="confirmpassword"
                    placeholder="Confirm password"
                    maxlength="20"
                    />
                <!--button to submit details-->
                <button type="submit" class="btn" name="save">Save</button>
            </div>
        </form>
        <!-- div for responsive footer-->

        <footer class="ct-footer">
            <div class="inner-right">
                <p>
                    Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to
                    BVTechHub<br />
                    Web Design by CS10 of Banasthali Vidyapith
                </p>
            </div>
        </footer>
    </body>
</html>

<!--Java code to update the admin password in database-->
<%
    if (request.getParameter("save") != null) {
        String newpass, confirmpass;
        newpass = request.getParameter("newpassword"); // we get the new password entered in change password form
        confirmpass = request.getParameter("confirmpassword"); // we get the confirm password entered in the form
        
        if (newpass.length() < 6) { // check applied to see that the password length is >= 6 or not
            out.println("<html><span id=error><p>Password length must be atleast 6 characters</p></span></html>");
            return;
        }
        if (!newpass.equals(confirmpass)) { // check applied to see if new password and confirm password match exactly or not
            out.println("<html><span id=error><p>Passwords do not match</p></span></html>");
            return;
        }
        if (newpass == "") { // check applied to be sure that admin has entered new password and this field is not empty
            out.println("<html><span id=error><p>Please enter your new password!</p></span></html>");
            return;
        }

        String query = "Select * from admin where aemailid='" + emailId + "'";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub", "root", "*Khushboo20*");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
//            if status is true then the admin password is updated
            if (status) {
                String updateQuery = "Update admin set apassword='" + newpass + "' where aemailid='" + emailId + "'";
                Statement stmt_update = conn.createStatement();
                int i = stmt_update.executeUpdate(updateQuery);
                if (i > 0) {
//                    popup message is displayed when the password is updated
                    out.println("<script>alert('Password has been updated');</script>");
                } else {
//                    if some issue occurred while updating admin password then this popup message is displayed
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