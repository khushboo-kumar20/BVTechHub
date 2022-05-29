<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href="../css/changeStudPassByAdmin.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap"
            rel="stylesheet"
            />
        <title>Change Student Password</title>
    </head>

    <body>
        <header class="class">
            <!-- Left div for logo -->
            <div class="left">
                <img src="../images/logobg.png" alt="" />
            </div>
        </header>
        <!--HTML code for the update student password by admin form-->
        <form>
            <div class="form-box">
                <div class="header-text">Change Password of Student</div>
                <input
                    type="text"
                    name="EmailID"
                    placeholder="Enter email ID"
                    maxlength="50"
                    />
                <input
                    type="password"
                    name="newpassword"
                    placeholder="Enter new password"
                    maxlength="20"
                    />
                <input
                    type="password"
                    name="confirmpassword"
                    placeholder="Confirm password"
                    maxlength="20"
                    />
                <button type="submit" class="btn" name="save">Save</button>
            </div>
        </form>
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

<!--Java code to update the student password via the admin-->
<%
    if (request.getParameter("save") != null) {
        String newpass, confirmpass, emailId;
        emailId = request.getParameter("EmailID"); // we get the student emailid
        newpass = request.getParameter("newpassword"); // we get the new password entered by admin
        confirmpass = request.getParameter("confirmpassword"); // we get the confirm passowrd entered by the admin
        if (newpass.length() < 6) { // check to see if password length >=6 or not
            out.println("<html><span id=error><p>Password length must be atleast 6 characters</p></span></html>");
            return;
        }
        if (!newpass.equals(confirmpass)) { // check to see if new password and confirm password match exactly or not.
            out.println("<html><span id=error><p>Passwords do not match</p></span></html>");
            return;
        }
        if (newpass == "") { // check applied to see if the new password is left empty
            out.println("<html><span id=error><p>Please enter your new password!</p></span></html>");
            return;
        }

        String query = "Select * from student where semailid='" + emailId + "'";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub", "root", "*Khushboo20*");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if (status) {
//              we update the student password corresponding to the student emailid
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
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

%>