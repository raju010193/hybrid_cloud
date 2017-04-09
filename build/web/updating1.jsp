<%@page import="java.util.HashMap"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>
<%@ page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 

<html>
<head>
<title>dpaas</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
    String id=(String)session.getAttribute("id1");
String ifn=(String)session.getAttribute("fname1");
String data=(String)session.getAttribute("file_name");
//out.print(da);
//out.print(data);
HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   
String name=user.getAttribute("name").toString();     


String keyyy=(String)session.getAttribute("a");

java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy HH:mm";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
         String strDateNew1 = sdf1.format(now);
//out.print(image);
try
{
Connection con=Dbconnection.getConn();
PreparedStatement ps=con.prepareStatement("insert into updates (filename,username,time)values(?,?,?)");
 ps.setString(1,id);
  ps.setString(1,ifn);
   ps.setString(2,name);
    ps.setString(3,strDateNew1);
ps.executeUpdate();

response.sendRedirect("update.jsp?updated");
}
catch(Exception e1)
{
out.println(e1.getMessage());
}


%>

</body>
</html>
