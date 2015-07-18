<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page session="true" %>
<%

Integer i = (Integer) session.getAttribute("count");


if (i == null){
	i=1;
}else{
	i++;
}

session.setAttribute("count", i);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel = "shortcut icon" href="img/test.ico">
</head>
<body>
<img src="images/jboss.png" width="20%"/><br/>
<b><font color="blue">Welcome!</font></b><br/>
JBoss EAP Server is up and running!<br/>
<hr size="1" width="100%"/>
<%= new java.util.Date() %><br/>
<br/>
Host: <%= Inet4Address.getLocalHost() %> <br/>
Service IP: <%= System.getProperty("jboss.bind.address") %><br/>
Base Dir: <%= System.getProperty("jboss.server.base.dir") %><br/>
<br/>
Session Id: <%= session.getId() %><br/>
Visit Count: <%= i %> <br/>
<br/>

<%

String dbIp = System.getenv("MYSQL_55_CENTOS7_SERVICE_HOST");
String dbPort = System.getenv("MYSQL_55_CENTOS7_SERVICE_PORT");
String dbUser = "nico";
String dbPwd = "welcome1";
String dbName = "nico";
String dbUrl = "jdbc:mysql://" + db_ip + ":" +db_port + "/" + db_name;

%>
Database Connection String: <%=dbUrl %>
</br>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("select * from os");
rs.next();
String name = rs.getString("name");
conn.close();
%>
Result: <%=name %>

</body>
</html>