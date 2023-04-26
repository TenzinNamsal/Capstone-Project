<%-- 
    Document   : SignUpPage
    Created on : Apr 18, 2023, 8:46:50 AM
    Author     : brian
--%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Zest || Sign Up</title>

        <style>


            /* Background */
            body{
                background: lightblue;
                
            }

            /* Main Divider */
            .primaryContainer{
                background-color: blue;
                width:500px;
                height:500px;
                margin:5% auto 25% auto;
                border-radius: 25px;
            }

            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 15px;
                margin: 5px 0 22px 0;
                display: inline-block;
                border: none;
                background: #f1f1f1;
            }

            /* Add a background color when the inputs get focus */
            input[type=text]:focus, input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for all buttons */
            button {
                background-color: #04AA6D;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
                opacity: 0.9;
            }

            button:hover {
                opacity:1;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                padding: 14px 20px;
                background-color: #f44336;
            }

            /* Float cancel and signup buttons and add an equal width */
            .cancelbtn, .signupbtn {
                float: left;
                width: 50%;
            }

            /* Add padding to container elements */
            .container {
                padding: 16px;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: #474e5d;
                padding-top: 50px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 80%; /* Could be more or less, depending on screen size */
            }


            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 35px;
                top: 15px;
                font-size: 40px;
                font-weight: bold;
                color: #f1f1f1;
            }

            .close:hover,
            .close:focus {
                color: #f44336;
                cursor: pointer;
            }

            /* Clear floats */
            .clearfix::after {
                content: "";
                clear: both;
                display: table;
            }

            /* Change styles for cancel button and signup button on extra small screens */
            @media screen and (max-width: 300px) {
                .cancelbtn, .signupbtn {
                    width: 100%;
                }
            }
        </style>


    </head>

    <body>
        
        

        <div class="primaryContainer">
            <div>
                <header class="w3-container" style="background-color: whitesmoke">
                    <span> 
                        <center>  <img src="ZestLogo1.png" alt="Logo"> </span><br/><br/> </center>
            </div>
            <center> 
                <br>
            <div>
            <button onclick="document.getElementById('SignUp').style.display = 'block'" style="width:auto;">User Sign Up</button>
            </div>
                <br>
                <br>
            <div>
            <button onclick="document.getElementById('Tutor').style.display = 'block'" style="width:auto;">Tutor Sign Up</button>
            </div>
            </center>
        </div>


        <!-- User Sign Up -->
        <div id="SignUp" class="modal">
            <span onclick="document.getElementById('SignUp').style.display = 'none'" class="close" title="Close Modal">&times;</span>
            <form class="modal-content" action="Login.jsp">
                
                
                <div class="container">
                    <h1>Sign Up</h1>
                    <p>Please fill in this form to create an account.</p>
                    <hr>
                    
                    <label for="psw-repeat"><b>Last Name</b></label>
                    <input type="text" name="Userlast">
                    
                    <label for="psw-repeat"><b>First Name</b></label>
                    <input type="text"  name="Userfirst" required>
                    
                    <label><b>Username</b></label>
                    <input type="text" name="usernameU" required>
                    
                    <label for="email"><b>Email</b></label>
                    <input type="text" name="Useremail" required>

                    <label for="psw"><b>Password</b></label>
                    <input type="password" name="Userpsw" required>
                    

                    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

                    <div class="clearfix">
                        <button type="button" onclick="document.getElementById('SignUp').style.display = 'none'" class="cancelbtn">Cancel</button>
                        <button type="submit" class="signupbtn">Sign Up</button>
                        
                       
                    </div>
                </div>
            </form>
        </div>


        <script>
            // Get the modal
            var modal = document.getElementById('SignUp');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>


        <!-- Tutor Sign Up -->
        <div id="Tutor" class="modal">
            <span onclick="document.getElementById('Tutor').style.display = 'none'" class="close" title="Close Modal">&times;</span>
            <form class="modal-content" action="Login.jsp">
                <div class="container">
                    <h1>Sign Up</h1>
                    <p>Please fill in this form to create an account.</p>
                    <hr>
                    
                    <label><b>First Name</b></label>
                    <input type="text" name="first" required>
                    
                    <label><b>Last Name</b></label>
                    <input type="text" name="last" required>
                    
                    <label><b>Username</b></label>
                    <input type="text" name="username" required>
                    
                    <label><b>Email</b></label>
                    <input type="text" name="email" required>

                    <label><b>Password</b></label>
                    <input type="password" name="psw" required>
                    
                    <label><b>About Me!</b></label>
                    <input type="text" name="About Me!">
                    
                    <label><b>Coding Languages</b></label>
                    <input type="text" name="Lang">

                    <label><b>Meeting Link</b></label>
                    <input type="text" name="MT">
                    
                    <label>
                        <input type="checkbox" name="remember" style="margin-bottom:15px"> Remember me
                    </label>

                    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

                    <div class="clearfix">
                        <button type="button" onclick="document.getElementById('Tutor').style.display = 'none'" class="cancelbtn">Cancel</button>
                        <button type="submit" class="signupbtn">Sign Up</button>
                    </div>
                </div>
            </form>
        </div>


        <script>
            // Get the modal
            var modal = document.getElementById('Tutor');

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
        
        
        <!-- Database -->
        <%

            //Use a try/catch block to catch any database exceptions
//            try {
//                //Create a connection to the database
//                Class.forName("com.mysql.cj.jdbc.Driver");
//                Connection con = DriverManager.getConnection(
//                        "jdbc:mysql://localhost:3306/zest", "root", "admin");
//
//                
//                
//                 try {
//            
//            String student = "INSERT INTO zest.students (studentLastName, studentFirstName, studentUserName, studentEmail, password) VALUES ('" + request.getParameter("Userlast") + "' , '" + request.getParameter("Userfirst") + "' , '" + request.getParameter("usernameU") + "' , '" + request.getParameter("Useremail") + "', '" + request.getParameter("Userpsw") + "')";
//            
//            String tutor = "INSERT INTO tutors (tutorLastName, tutorFirstName, tutorUserName, tutorEmail, password) VALUES ('" + request.getParameter("last") + "' , '" + request.getParameter("first") + "' , '" + request.getParameter("username") + "' , '" + request.getParameter("email") + "', '" + request.getParameter("psw") + "')";
//            
//            Statement stmt = con.createStatement();
//            
//            stmt.executeUpdate(student);
//            
//            stmt.executeUpdate(tutor);
//            
//        } catch (SQLException e) {
//            out.println(e);
//        }
//                // close the connection to the database
//                con.close();
//            } catch (Exception e) {
//                out.println(e);
//                // end try catch
//            }
        %>
        

    </body>
</html>
