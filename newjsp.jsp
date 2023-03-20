<%-- 
    Document   : newjsp
    Created on : Mar 20, 2023, 10:19:07 AM
    Author     : test05
--%>
 
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/employees");
        Statement st=c.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM employees");
        out.println("<table border=2>");
        out.println("<th>empid</th>");
        out.println("<th>firstname</th>");
        out.println("<th>lastname</th>");
        out.println("<th>salary</th>");
        while(rs.next())
        {
           out.println("<tr><td>"+rs.getInt(1)+"</td>");
           out.println("<td>"+rs.getString(2)+"</td>");
           out.println("<td>"+rs.getString(3)+"</td>");
           out.println("<td>"+rs.getDouble(4)+"</td></tr>");
        }
        out.println("</table>");
        ResultSet rs1=st.executeQuery("select count(*)from employees");
         while(rs1.next())
        {
           out.println("total number of employees"+rs1.getInt(1)+"<br>");
        }
        ResultSet rs2=st.executeQuery("select avg(salary)from employees");
        while(rs2.next())
        {
            out.println("average salary of all employees"+rs2.getDouble(1)+"<br>");
        }
        ResultSet rs3=st.executeQuery("select max(salary)from employees");
        while(rs3.next())
        {
            out.println("highest salary among all the employees"+rs3.getDouble(1)+"<br>");
        }
        %>
    </body>
</html>
