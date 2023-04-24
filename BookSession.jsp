<%-- 
    Document   : BookSession
    Created on : Apr 22, 2023, 9:34:50 PM
    Author     : tnams
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Zest || Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                background-color: green;
            }
            .button:active {
                background-color: #3e8e41;
                box-shadow: 0 5px #666;
                transform: translateY(4px);
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
                            <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Appointments </button>
                            <div id="Demo1" class="w3-hide w3-container">
                                <p>Some text..</p>
                            </div>
                            <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Tutors </button>
                            <div id="Demo2" class="w3-hide w3-container">
                                <p>Some other text..</p>
                            </div>
                            <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> TBD </button>
                            <div id="Demo3" class="w3-hide w3-container">
                                <div class="w3-row-padding">
                                    <br>
                                    <div class="w3-half">
                                        <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <br>

                    <!-- End Left Column -->
                </div>

                <!-- Middle Column -->
                <div class="w3-col m7">

                    <div class="w3-row-padding">
                        <div class="w3-col m12">
                            <div class="w3-card w3-round w3-white">
                                <div class="w3-container w3-padding">

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                        <div class="w3-row-padding" style="margin:0 -16px">
                            <form class="" action="BookSessionConfirmation.jsp">
                                <div class="container">
                                    <h1>Book Session</h1>
                                    <p>Please fill in this form to book a tutor session.</p>
                                    <hr>

                                    <label for="psw-repeat"><b>Select a tutor:</b></label> 
                                    <%
                                        //Use a try/catch block to catch any database exceptions
                                        try {
                                            //Create a connection to the database
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection con = DriverManager.getConnection(
                                                    "jdbc:mysql://localhost:3306/zest", "root", "admin");

                                            //Create a new SQL statement using the connection
                                            Statement stmt = con.createStatement();
                                            //Execute the SQL statement to retrieve a result set of records from the database.
                                            //This SQL query will retrieve all of the records in the products table
                                            ResultSet rs = stmt.executeQuery("SELECT tutorID, tutorFirstName, tutorLastName FROM tutors WHERE tutorFirstName != 'null';");

                                    %>

                                    <select name="tutor"></h1>
                                        <%//Use a while loop to iterate through the resultset of records
                                            while (rs.next()) {
                                                //print out the data in ProductName column in the current record
                                                //The first column contains product name so we are calling the
                                                //getString() method to retrieve it.
                                        %>
                                        <option value="<%out.print(rs.getString(1));%>">
                                            <%out.print(rs.getString(2));%> 
                                            <%out.print(rs.getString(3));%>
                                        </option>
                                        <%
                                                }//end while loop
                                                //Close the connection to the database
                                                con.close();
                                            } catch (Exception e) {
                                                out.println(e);
                                            } //end try catch
%>
                                    </select>

                                    <br/>
                                    <label for="sessionDate"><b>Select a date:</b></label> 
                                    <input type="date"  name="sessionDate" required>

                                    <br/>
                                    <label><b>Duration:</b></label> 
                                    <select name="duration">
                                        <option value="30">30 Minutes</options>
                                        <option value="60">1 Hour</options>
                                        <option value="120">2 Hours</options>
                                    </select>

                                    <br/><br/>                              
                                    <div class="clearfix">
                                        <button type="reset" class="resetbtn">Reset</button>
                                        <button type="submit" class="bookbtn">Book</button>
                                    </div>
                                    <br/>
                                </div>
                            </form>
                        </div>

                    </div>



                    <!-- End Middle Column -->
                </div>



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
