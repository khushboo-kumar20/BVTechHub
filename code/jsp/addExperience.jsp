<%@page import= "java.sql.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="../css/addExperience.css">
        <title>Add Experience Form</title>
    </head>

    <body>
        <header class="class">
        <!-- Left Box for logo -->
        <div class="left">
             <div class="left"><img src="../images/logobg.png" alt=""></div> 
        </div>
        </header>
        <!--HTML form to add experience of student-->
        <form>
            <div class="form-box">
                <div class="header-text">Share your Experience</div>
                <!--input for company name-->
                <input type="text" name="Company" placeholder="Enter the company name" />
                <!--input for position or job role-->
                <input type="text" name="Position" placeholder="Enter position" />
                <!--selecting category i.e internship or placement-->
                <select name="Category">
                    <option value="" disabled selected>Choose a category</option>
                    <option value="Internship">
                        Internship
                    </option>
                    <option value="Placement">
                        Placement
                    </option>
                </select>
                <!--selecting verdict-->
                <select name="Verdict">
                    <option value="" disabled selected>Verdict</option>
                    <option value="Selected">
                        Selected
                    </option>
                    <option value="Rejected">
                        Rejected
                    </option>
                </select>
                <!--text area to add description-->
                <textarea id="share" name="Description" placeholder="Type your experience here" maxlength="970"
                style="height:200px" rows="4" cols="50"></textarea>
                <!--submit button -->
                <button type="submit" class="btn" name="Add"><b>ADD</b></button>
            </div>
        </form>
        <br>
        <br>
        <br>
        <!--Responsive footer-->
        <div class="ct-footer">     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </div>
    </body>
</html>
<%
    if (request.getParameter("Add") != null) //when add button is clicked
    {
        String company, position, category, verdict, des;
        company = request.getParameter("Company"); //company name entered by student
        position = request.getParameter("Position"); //position entered by student
        category = request.getParameter("Category"); //category entered by student
        verdict = request.getParameter("Verdict");//verdict entered by student
        des = request.getParameter("Description");//description entered by student
        
        if(company==null || position==null || category==null || verdict==null || des==null) //if any of the details are not entered popup appears
        {
           out.println("<script>alert('Please enter the details.');</script>");
        }
        else{
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bvtechhub","root","*Khushboo20*"); 
                Statement stmt = conn.createStatement();
                String semailid = (String) session.getAttribute("mailid"); //emailid taken through session
                
                ResultSet rs= stmt.executeQuery("select * from experience");
                des= des.replaceAll("\\r?\\n", "<br />"); //next line '\n' to be replaced by br tag for the html to read it
                des=des.replaceAll("&", "and"); //input of '&' to be replaced by 'and' to avoid ascii character replacement
           
                String query1 = "insert into experience(SEMAILID,COMPANY,DESCRIPTION,POSITION, CATEGORY, VERDICT) VALUES('" + semailid + "','" + company + "','" + des + "','" + position + "','" + category + "','" + verdict +"')";               
                int i=0;
                Statement stmt2 = conn.createStatement();
                i = stmt2.executeUpdate(query1);
                if (i > 0) 
                {
                    out.println("<script>alert('Your experience has been added.');</script>"); //experience successfully added
                }else{
                    out.println("<script>alert('Error in adding your experience. Try again!');</script>");//error in adding experience
                }
                conn.close();        
            } catch (Exception e) {
            e.printStackTrace();
            }
        }
    }
%>
