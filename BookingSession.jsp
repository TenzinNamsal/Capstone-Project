
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Zest || Booking Session</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="style.css">

        <style>
            .container {
                width: 80%;
                margin: 0 auto;
                text-align: center;
                padding: 20px;
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
                font-size
            </style>

        </head>
        <body>
            <header>
                <h1>Tutorial Sessions</h1>
            </header>
            <div class="container">

                <table>
                    <tr>
                        <th>Session ID</th>
                        <th>Tutor Name</th>
                        <th>Tutor Email</th>
                        <th>Meeting Link</th>
                        <th>Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Action</th>
                    </tr>

                    <%
                        String studentID = request.getParameter("studentID");
                        session.setAttribute("studentID", studentID);
                        try {

                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zest", "root", "admin");

                            PreparedStatement stmt = con.prepareStatement("SELECT * FROM tutorialsessions WHERE availability = true");
                            ResultSet rs = stmt.executeQuery();

                            while (rs.next()) {
                                int sessionID = rs.getInt("sessionID");
                                String tutorName = rs.getString("tutorName");
                                String Date = rs.getString("Date");
                                String email = rs.getString("tutorEmail");
                                String meetingLink = rs.getString("meetingLink");
                                String startTime = rs.getString("startTime");
                                String endTime = rs.getString("endTime");

                    %>

                    <tr>
                        <td><%= sessionID%></td>
                        <td><%= tutorName%></td>
                        <td><%= email%></td>
                        <td><%= meetingLink%></td>
                        <td><%= Date%></td>
                        <td><%= startTime%></td>
                        <td><%= endTime%></td>
                        <!-- comment 
                        <td><a href="ConfirmationProcess.jsp" onclick="bookSession(<%= sessionID%>)"><button>BOOK NOW</button></a></td>-->
                        <td>   
                            <form action ="ConfirmationProcess.jsp">
                                <input type = "hidden" id = "sessionid" name="sessionID" value=<%=sessionID%>>
                                <input type = "hidden" id = "studentID" name="studentID" value=<%=studentID%>>
                                <input type="submit" id="submit" value="BOOK NOW">
                            </form>
                        </td>
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


                    <body>             

                        </html>
