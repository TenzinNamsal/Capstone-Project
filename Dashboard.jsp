<%-- 
    Document   : Dashboard
    Created on : Apr 26, 2023, 9:25:30 AM
    Author     : brian
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>

<%
    String studentID = "";
    String studentName = "";
    String studentUserName = "";
    String studentEmail = "";

    // Check if the user has submitted the login form
    if (request.getParameter("studentID") != null) {
        studentID = request.getParameter("studentID");

        try {
            // Set up the database connection
            String jdbcUrl = "jdbc:mysql://localhost:3306/zest";
            String jdbcUsername = "root";
            String jdbcPassword = "admin";

            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

            // Prepare the SQL statement to retrieve the user credentials
            String sql = "SELECT * FROM students WHERE studentID = " + studentID;

            PreparedStatement statement = connection.prepareStatement(sql);

            // Execute the query and check if the result set is not empty
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                studentName = resultSet.getString("studentFirstName") + " " + resultSet.getString("studentLastName");
                studentUserName = resultSet.getString("studentUserName");
                studentEmail = resultSet.getString("studentEmail");
            }

            // Close the database connection and return the authentication result
            resultSet.close();
            statement.close();
            connection.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zest || Dashboard</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>


            body{
                background-image: url('Cover Page Image.png');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-position: top right;
                background-size: cover;

            }

            html, body, h1, h2, h3, h4, h5 {
                font-family: "Open Sans", sans-serif
            }

            .button {
                padding: 15px 25px;
                font-size: 24px;
                text-align: center;
                cursor: pointer;
                outline: none;
                color: #fff;
                background-color: red;
                border: none;
                border-radius: 15px;
                box-shadow: 0 9px #999;
            }
            .button:hover {
                background-color: green
            }
            .button:active {
                background-color: #3e8e41;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }
        </style>

    </head>


    <body 

        class="w3-theme-l5">


        <!-- Navbar -->
        <div class="w3-top">
            <div class="w3-bar w3-theme-d2 w3-left-align w3-large">

                <a href="http://localhost:8080/CapstoneProject/Dashboard.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><img src="ZestLogo1.png" alt="Logo" height="50px"></a>



                <div class="w3-dropdown-hover w3-hide-small w3-right">

                    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
                        <img src="avatar3.png" class="w3-circle" style="height:23px;width:23px" alt="Avatar">
                        <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px ; height: 200px">
                            <a href="#" class="w3-bar-item w3-button"></a>
                            <a href="#" class="w3-bar-item w3-button"></a>
                            <a href="#" class="w3-bar-item w3-button">Sign Out</a>
                        </div>
                </div>

                </a>
            </div>
        </div>

        <!-- Page Container -->
        <div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
            <!-- The Grid -->
            <div class="w3-row">
                <!-- Left Column -->
                <div class="w3-col m3">
                    <!-- Profile -->
                    <div class="w3-card w3-round w3-white">
                        <div class="w3-container">
                            <h4 class="w3-center">My Profile</h4>
                            <p class="w3-center"><img src="avatar3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
                            <hr>
                            <p>
                                <!--<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> -->
                                Username: <%=studentUserName%><br/>
                                Name: <%=studentName%><br/>
                                Email: <%=studentEmail%>
                            </p>
                            <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> Summit Academy OIC </p>
                            <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> <%=LocalDate.now() %> </p>
                        </div>
                    </div>
                    <br>

                    <!-- Accordion -->
                    <div class="w3-card w3-round">
                        <div class="w3-white">
                            <a href="BookingSession.jsp?studentID=<%=studentID%>" class="w3-button w3-block w3-theme-l1 w3-left-align">
                                <i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i>Book a Session
                            </a>
                            <a href="myAppointments.jsp?studentID=<%=studentID%>" class="w3-button w3-block w3-theme-l1 w3-left-align">
                                <i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Appointments
                            </a>
                        </div>
                        <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align">
                            <div id="Demo1" class="w3-hide w3-container">
                                <p>Some text..</p>
                            </div>
                    </div>      
                </div>
                <br>

                <!-- End Left Column -->
            </div>



        </div>

        <!-- End Page Container -->
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <!-- Footer -->
    <footer class="w3-container w3-theme-d3 w3-padding-16">

    </footer>

    <footer class="w3-container w3-theme-d5">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </footer>

</body>
</html>
