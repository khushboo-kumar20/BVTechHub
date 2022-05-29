<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Placement Experience</title>
        <link rel="stylesheet" href="../css/expDescription.css">
        <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Acme&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&display=swap" rel="stylesheet">
    </head>
    <body>
        <!--Left Box for logo-->
        <div class="left">
            <img src="../images/logobg.png" alt="" />
        </div>
        <!--Heading for the page-->
        <div class="container">
            <h2>Placement Interview Experience</h2>
            <h3>"Experience is the teacher of all things."-Julius Caeser</h3>
            <!--Description that has been sent from the previous page expCompanyPlacement.jsp-->
            <div class="a">
                <%=request.getParameter("des")%> <!-- we get the placement interview description -->
            </div>
        </div>
        <!-- HTML Code For Footer -->
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br><br> <br> <br>
        <!-- div for responsive footer-->

        <footer class="ct-footer" >     
            <div class="inner-right">
                <p>Copyright © 2022 BVTechHub.&nbsp; Privacy Policy Rights reserved to BVTechHub<br> Web Design by CS10 of Banasthali Vidyapith</p>
            </div>
        </footer>
    </body>
</html>