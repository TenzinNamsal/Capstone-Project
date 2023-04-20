<%-- 
    Document   : login
    Created on : Apr 17, 2023, 8:51:46 AM
    Author     : tnams
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>



<html>
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">

        
        <style>
            /*body {
                background:linear-gradient(to right,yellow,red,yellow)

            }
            .container{
                background-color: lightblue;
                width:700px;
                height:400px;
                border-radius:25px;
                margin:5% auto 25% auto;
            }*/
            
            body {
            background: #000 !important;
        }
        .card {
            border: 1px solid #28a745;
        }
        .card-login {
            margin-top: 130px;
            padding: 18px;
            max-width: 30rem;
        }

        .card-header {
            color: #fff;
            /*background: #ff0000;*/
            font-family: sans-serif;
            font-size: 20px;
            font-weight: 600 !important;
            margin-top: 10px;
            border-bottom: 0;
        }

        .input-group-prepend span{
            width: 50px;
            background-color: #ff0000;
            color: #fff;
            border:0 !important;
        }

        input:focus{
            outline: 0 0 0 0  !important;
            box-shadow: 0 0 0 0 !important;
        }

        .login_btn{
            width: 130px;
        }

        .login_btn:hover{
            color: #fff;
            background-color: #ff0000;
        }

        .btn-outline-danger {
            color: #fff;
            font-size: 18px;
            background-color: #28a745;
            background-image: none;
            border-color: #28a745;
        }

        .form-control {
            display: block;
            width: 100%;
            height: calc(2.25rem + 2px);
            padding: 0.375rem 0.75rem;
            font-size: 1.2rem;
            line-height: 1.6;
            color: #28a745;
            background-color: transparent;
            background-clip: padding-box;
            border: 1px solid #28a745;
            border-radius: 0;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .input-group-text {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding: 0.375rem 0.75rem;
            margin-bottom: 0;
            font-size: 1.5rem;
            font-weight: 700;
            line-height: 1.6;
            color: #495057;
            text-align: center;
            white-space: nowrap;
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            border-radius: 0;
        }
        </style> 

</head>




<body>
<!--<center>
    <div class="container"> 

        <div> 

            <form action="">
                <Br>  <br>  <br>  <br>  <br>  <br>

                USER NAME:<input type="text" name="Age" placeholder=" email">
                <br><br>

                PASSWORD:<input type="text" name="Age" placeholder="Password">
                <br>  <br>

                ROLE:   <button class="TUTOR"> TUTOR</button>  <button class="TUTOR"> STUDENT</button>  


            </form>


        </div>
</center>-->

<div class="container">
    <div class="card card-login mx-auto text-center bg-dark">
        <div class="card-header mx-auto bg-dark">
            <span> 
                <img src="ZestLogo1.png" alt="Logo"> </span><br/><br/>
                        <span class="logo_title mt-5"> Login </span>

        </div>
        <div class="card-body">
            <form action="" method="post">
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="text" name="email" class="form-control" placeholder="Username">
                </div>

                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" name="password" class="form-control" placeholder="Password">
                </div>

                <div class="form-group">
                    <input type="submit" name="btn" value="Login" class="btn btn-outline-danger float-right login_btn">
                </div>

            </form>
        </div>
    </div>
</div>

<%

    //Use a try/catch block to catch any database exceptions
    try {
        //Create a connection to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/zest", "root", "admin");

        //Create a new SQL statement using the connection
        Statement stmt = con.createStatement();

        ResultSet rs = stmt.executeQuery("SELECT * from users  ;");

        // close the connection to the database
        con.close();
    } catch (Exception e) {
        out.println(e);
        // end try catch
    }
%>
</body>
</html>
