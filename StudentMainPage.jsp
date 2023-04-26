<%-- 
    Document   : StudentMainPage
    Created on : Apr 20, 2023, 11:18:23 AM
    Author     : brian
--%>

<%@page import = "java.sql.*"%>
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

            /*            .button {
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
                            margin-right: 68%;
                        }*/
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
                            <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right">

                                </i> My Appointments </button>

                            <div id="Demo1" class="w3-hide w3-container">

                                <! Java - Query Database -->
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
                                        ResultSet rs = stmt.executeQuery("SELECT * FROM bookedSessions ;");
                                %>

                                <a href="BookSession.jsp">Book new session</a>
                                <table class="table border">
                                    <tr>
                                        <th>Tutor</th>
                                        <th>Date</th>
                                        <th>Duration</th>

                                    </tr>

                                    <%
                                        while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%out.print(rs.getString(3));%></td>
                                        <td><%out.print(rs.getString(4));%></td>
                                        <td><%out.print(rs.getString(5));%> Minutes</td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>

                                <%
                                        //Close the connection to the database
                                        con.close();
                                    } catch (Exception e) {
                                        out.println(e);
                                    } //end try catch
                                %>
                            </div>
                            <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> <div class="w3-container">
                                    
                                    <button onclick="document.getElementById('id01').style.display = 'block'" class="w3-button w3-black">Open appointment summery</button>

                                    <div id="id01" class="w3-modal">
                                        <div class="w3-modal-content w3-card-4">
                                            <header class="w3-container w3-teal"> 
                                                <span onclick="document.getElementById('id01').style.display = 'none'" 
                                                      class="w3-button w3-display-topright">&times;</span>
                                            <!-- modal> <-->
                                            </header>
                                            <h></h>
                                            <div class="w3-container">
                                                <p>Please note you have an Tutorial session From Time:10:pm -11:30 Pm on 5/23/23 from Dr. Merry.</p>
                                                <p>Confirmation No.123456</p>
                                            </div>
                                            <footer class="w3-container w3-teal">
                                                <p></P>
                                            </footer>
                                        </div>
                                    </div>
<!--                                <div>My Tutors </button>
                            <div id="Demo2" class="w3-hide w3-container">
                                <p>Some other text..</p>
                            </div>
                            <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> TBD </button>
                            <div id="Demo3" class="w3-hide w3-container">
                                <div class="w3-row-padding">
                                    <br>
                                    
                            
                        </div>      
                    </div>
                    <br>-->

                    <!-- End Left Column -->
                </div>



                <img src="Cover Page Image.png" class="w3-opacity-max"style="width:980px; height:160px>
                     <a href="BookSessionConfirmation.jsp">Book new session</a>

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
