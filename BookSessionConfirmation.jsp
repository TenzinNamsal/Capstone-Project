<%-- 
    Document   : BookSessionConfirmation
    Created on : Apr 22, 2023, 10:25:10 PM
    Author     : tnams
--%>

<%@page import="java.util.Base64.Encoder"%>
<%@page import="java.util.Base64"%>
<%@page import="java.security.SecureRandom"%>
<%@page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Zest || Book Session Confirmation</title>
    </head>
    <body>        

        <!-- Database -->
        <%

            //Use a try/catch block to catch any database exceptions
            try {
                //Create a connection to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/zest", "root", "admin");
                
                SecureRandom random = new SecureRandom();
    byte bytes[] = new byte[20];
    random.nextBytes(bytes);
    Encoder encoder = Base64.getUrlEncoder().withoutPadding();
    String confirmationNumber = encoder.encodeToString(bytes);
                
                
                String newSession = "INSERT INTO bookedsessions (userID, tutorID, sessionDate, duration, confirmationNumber) "
                        + "VALUES "
                        + "(1, '"
                        + request.getParameter("tutor") + "', '"
                        + request.getParameter("sessionDate") + "', '"
                        + request.getParameter("duration") + "', '"
                        + confirmationNumber + "')";

                Statement stmt = con.createStatement();

                stmt.executeUpdate(newSession);

        %>


        <h1>A session has been booked with [tutor name].</h1>
        <p>Your confirmation number is <%out.print(confirmationNumber);%></p>

        <%                          // close the connection to the database
                con.close();
            } catch (Exception e) {
                out.println(e);
                // end try catch
            }
        %>


    </body>
</html>
