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
    String id=request.getQueryString();session.setAttribute("id1",id);
String da=request.getParameter("content");
//String data=request.getParameter("file_name");session.setAttribute("fname1",data);
//out.print(da);
//out.print(data);

String keyyy=(String)session.getAttribute("a");

File f = new File(da);

//out.print(image);
try
{
Connection con=Dbconnection.getConn();
PreparedStatement ps=con.prepareStatement("update file set content='"+f+"' where  idfiles='"+id+"'");

ps.executeUpdate();

response.sendRedirect("updating1.jsp?updated");
}
catch(Exception e1)
{
    response.sendRedirect("updating1.jsp?fail");
out.println(e1.getMessage());
}


%>

</body>
</html>
