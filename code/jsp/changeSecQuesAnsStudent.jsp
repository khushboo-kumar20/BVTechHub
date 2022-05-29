<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/changeSecQuesAnsStudent.css?version2" />
        <link
            href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap"
            rel="stylesheet"
            />
        <title>Change Security QnA</title>
    </head>

    <body>
        <header class="class">
            <!-- Left Box for logo -->
            <div class="left">
                <div class="left"><img src="../images/logobg.png" alt="" /></div>
            </div>
        </header>
        <!--HTML code for the student change security question and answer form-->
        <form>
            <div class="form-box">
                <div class="header-text">Change your Security Question and Answer</div>
                <select name="newSecurityQuesID">
                    <option id="one" value="" disabled selected>
                        Choose new security question
                    </option>
                    <option value="What is the name of your college?">
                        What is the name of your college?
                    </option>
                    <option value="What was your first school?">
                        What was your first school?
                    </option>
                    <option value="What is the last name of your father?">
                        What is the last name of your father?
                    </option>
                    <option value="Which city do you live in?">
                        Which city do you live in?
                    </option>
                </select>
                <input
                    type="text"
                    name="newSecurityAns"
                    placeholder="Enter new Security Answer"
                    />
                <button type="submit" class="btn" name="save">Save</button>
            </div>
        </form>
        <!-- HTML Code for the Footer -->
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
<!--Java code to update the student security question and answer in the database-->
<%
    if (request.getParameter("save") != null) {
        String newSecQues, newSecAns, emailId;
        newSecQues = request.getParameter("newSecurityQuesID");// we get the new security question selected by the student
        newSecAns = request.getParameter("newSecurityAns"); // we get the new security answer entered by the student
        emailId = (String) session.getAttribute("mailid"); // we get the emailid of the student through the session set
        String query = "Select * from student"; // Now, if this student actually exists then only we update the security question and answer

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub", "root", "*Khushboo20*");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            boolean status = rs.next();
            if (status) { // if status is true we update the student security question and answer
                String updateQuery = "Update student set ssecurityques='" + newSecQues + "',ssecurityans='" + newSecAns + "' where semailid='" + emailId + "'";
                Statement stmt_update = conn.createStatement();
                int i = stmt_update.executeUpdate(updateQuery);
                if (i > 0) {
//                    Proper popup message displayed when the student profile is successfully updated with security question and answer
                    out.println("<script>alert('Profile upated with new security question and answer.');</script>");
                } else {
//                    If there is some error in updating student security question and answer then this message is displayed
                    out.println("<script>alert('Error in updating security question and answer.');</script>");
                }
                return;
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>