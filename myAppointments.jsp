<%-- 
    Document   : myAppointments
    Created on : Apr 26, 2023, 9:03:52 PM
    Author     : tnams
--%>

<%@page import= "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String studentName = "";
    String studentID = "";

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
                studentName = resultSet.getString("studentUserName");
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
        <title>My Appointments</title>

        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
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
/*            .button:hover {
                background-color: green
            }*/
            .button:active {
                background-color: #3e8e41;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
            }

            header {
                background-color: #1a202c; /* Set header color to blue */
                color: #fff; /* Set text color to white */
                padding: 20px;
                text-align: center;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border: 2px solid #ccc;
            }

            th {
                background-color: #1a202c;
                color: #fff;
            }
        </style>
    </head>
    <body class="w3-theme-l5">

        <!-- Navbar -->
        <div class="w3-top">
            <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
                <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Logo</a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-globe"></i></a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user"></i></a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>



                <div class="w3-dropdown-hover w3-hide-small w3-right">

                    <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">
                        <img src="avatar3.png" class="w3-circle" style="height:23px;width:23px" alt="Avatar">
                        <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                            <a href="#" class="w3-bar-item w3-button">One new friend request</a>
                            <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
                            <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
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
                            <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> <%=studentName%> </p>
                            <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> Summit Academy OIC </p>
                            <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> Today's Date </p>

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
                    </div>
                </div>
                <!-- End Left Column -->

                <!-- Middle Column -->
                <div class="w3-col m9">

                    <div class="w3-row-padding">
                        <div class="w3-col m10">
                            <div class="w3-card w3-round w3-white">
                                <div class="w3-container w3-padding">

                                    <header>
                                        <h1>My Appointments</h1>
                                    </header>

                                    <table width="100%">
                                        <tr>
                                            <th>Tutor </th>
                                            <th>Date</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                            <th>Meeting Link</th>
                                        </tr>

                                        <!-- Database Code -->
                                        <%
// Import JDBC packages
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zest", "root", "admin");

// Query the database for all available tutorial sessions
                                                PreparedStatement stmt = con.prepareStatement(""
                                                        + "SELECT b.tutorName, b.Date, b.startTime, b.endTime, t.meetingLink "
                                                        + "FROM zest.bookedsessions b "
                                                        + "JOIN tutorialsessions t ON b.sessionID = t.sessionID "
                                                       + "WHERE b.studentID = " + request.getParameter("studentID"));

                                                ResultSet rs = stmt.executeQuery();

                                                // Loop through the result set and display each session in a table row
                                                while (rs.next()) {
                                                    String tutorName = rs.getString("tutorName");
                                                    String Date = rs.getString("Date");
                                                    String startTime = rs.getString("startTime");
                                                    String endTime = rs.getString("endTime");
                                                    String meetingLink = rs.getString("meetingLink");
                                        %>

                                        <tr>
                                            <td><%= tutorName%></td>
                                            <td><%= Date%></td>
                                            <td><%= startTime%></td>
                                            <td><%= endTime%></td>
                                         <td  class=button><%= meetingLink%></button></td>
                                        </tr>

                                        <%
                                                }//end while loop
                                                //
                                                con.close();
                                            } catch (Exception e) {
                                                out.println(e);
                                            }//

                                        %>

                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- End Middle Column -->

                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>
        <br>

        <!-- Footer -->
        <footer class="w3-container w3-theme-d3 w3-padding-16">
            <h5>Footer</h5>
        </footer>

        <footer class="w3-container w3-theme-d5">
            <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
        </footer>

        <script>
            // Accordion
            function myFunction(id) {
                var x = document.getElementById(id);
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                    x.previousElementSibling.className += " w3-theme-d1";
                } else {
                    x.className = x.className.replace("w3-show", "");
                    x.previousElementSibling.className =
                            x.previousElementSibling.className.replace(" w3-theme-d1", "");
                }
            }

            // Used to toggle the menu on smaller screens when clicking on the menu button
            function openNav() {
                var x = document.getElementById("navDemo");
                if (x.className.indexOf("w3-show") == -1) {
                    x.className += " w3-show";
                } else {
                    x.className = x.className.replace(" w3-show", "");
                }
            }
        </script>

    </body>
</html>