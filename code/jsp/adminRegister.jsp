<%@page import="java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/adminRegister.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Mochiy+Pop+One&display=swap"
            rel="stylesheet"
            />
        <title>Registration Form</title>
    </head>

    <body>
        <div class="left">
            <img src="../images/logobg.png" alt="" />
        </div>
        <!--HTML form to register an admin-->
        <form>
            <div class="form-box">
                <div class="header-text">Register Admin</div>
                <input type="email" name="emailid" placeholder="Enter Email ID" />
                <input type="text" name="name" placeholder="Enter Name" />
                <input type="password" name="password" placeholder="Enter Password" />
                <select name="securityQuesID">
                    <option value="" disabled selected>Choose a security question</option>
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
                    name="securityAns"
                    placeholder="Enter Security Answer"
                    />
                <button type="submit" class="btn" name="register">Register</button>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <footer class="ct-footer">
                    <div class="inner-right">
                        <p>
                            Copyright ©️ 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved
                            to BVTechHub<br />
                            Web Design by CS10 of Banasthali Vidyapith
                        </p>
                    </div>
                </footer>
            </div>
        </form>
    </body>
</html>

<!--Java code to update the admin database with the new registered admin-->
<%
    if (request.getParameter("register") != null) {
        String aid, aname, apwd, asq, asa;
        aid = request.getParameter("emailid"); // we get the admin emailid entered in the form
        aname = request.getParameter("name"); // we get the admin name entered in the form
        apwd = request.getParameter("password"); // we get the password entered
        asq = request.getParameter("securityQuesID"); // we get the security question selected
        asa = request.getParameter("securityAns"); // we get the security answer entered
        
        if (apwd.length() < 6) { // check applied to see if admin password length is >= 6 or not
            out.println("<html><span id=error><p>Password length must be atleast 6 characters</p></span></html>");
            return;
        }
        if (apwd.length() > 20) { // check applied to see if the admin password length doesn't exceed 20 characters
            out.println("<html><span id=error><p>Password length must not exceed 20 characters</p></span></html>");
            return;
        }
        try {
//            we check whether the admin has already registered
            String queryForCheckDuplicates = "select * from admin where aemailid='" + aid + "'";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub", "root", "*Khushboo20*");
            Statement st_check = conn.createStatement();
            ResultSet rs_dup = st_check.executeQuery(queryForCheckDuplicates);
            boolean status = rs_dup.next();
//            if status value is true it signifies that admin has already registered
            if (status) {
                out.println("<script>alert('Admin is already registered.');</script>");
            } else {
//                if status value is false then the admin is registered successfully
                String queryText = "insert into admin(aemailid,aname,apassword,asecurityques,asecurityans)values('" + aid + "','" + aname + "','" + apwd + "','" + asq + "','" + asa + "')";
                Statement st_insert = conn.createStatement();
                int i = st_insert.executeUpdate(queryText);
                if (i > 0) {
//                    popup message is displayed when admin has registered successfully
                    out.println("<script>alert('New admin has been registered successfully.');</script>");
                } else {
//                    popup message is displayed if there has been some issue while registering new admin
                    out.println("<script>alert('Unable to register new admin, try again.');</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>