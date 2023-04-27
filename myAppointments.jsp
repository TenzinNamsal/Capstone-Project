<%-- 
    Document   : myAppointments
    Created on : Apr 26, 2023, 9:03:52 PM
    Author     : tnams
--%>

<%@page import= "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .button:hover {
                background-color: green
            }
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
                            <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> Software Student </p>
                            <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> Summit Academy OIC </p>
                            <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> Today's Date </p>

                        </div>
                    </div>
                    <br>

                    <!-- Accordion -->
                    <div class="w3-card w3-round">
                        <div class="w3-white">
                            <a href="TutorialSession.jsp" class="w3-button w3-block w3-theme-l1 w3-left-align">
                                <i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> Book a Session
                            </a>

                            <a href="myAppointments.jsp" class="w3-button w3-block w3-theme-l1 w3-left-align">
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
                                            <th>Tutor Name</th>
                                            <th>Date</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                            <th>Confirmation Number</th>
                                        </tr>

                                        <!-- Database Code -->
                                        <%
// Import JDBC packages
                                            try {
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zest", "root", "admin");

// Query the database for all available tutorial sessions
                                                PreparedStatement stmt = con.prepareStatement("SELECT * FROM bookedSessions WHERE studentID = 1"); // TODO - enter logged in student's studentID 
                                                ResultSet rs = stmt.executeQuery();

                                                // Loop through the result set and display each session in a table row
                                                while (rs.next()) {
                                                    String tutorName = rs.getString("tutorName");
                                                    String Date = rs.getString("Date");
                                                    String startTime = rs.getString("startTime");
                                                    String endTime = rs.getString("endTime");
                                                    String confirmationNumber = rs.getString("confirmationNumber");
                                        %>

                                        <tr>
                                            <td><%= tutorName%></td>
                                            <td><%= Date%></td>
                                            <td><%= startTime%></td>
                                            <td><%= endTime%></td>
                                            <td><%= confirmationNumber%></td>
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