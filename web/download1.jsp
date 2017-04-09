<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;" language="java" import="java.sql.*"  %>
<html>
<head>
<title>Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%@page import="pack.Dbconnection"%>
<body>
<%String fn=request.getQueryString();session.setAttribute("fid",fn);
   //String fn1=(String)session.getAttribute("fname");

java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "MM/dd/yyyy HH:mm";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
         String strDateNew1 = sdf1.format(now);

HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   
String name=user.getAttribute("name").toString();     

java.util.Date now1 = new java.util.Date();
try
{
   Connection con=Dbconnection.getConn();
   Statement st=con.createStatement();
   // PreparedStatement ps=con.prepareStatement("insert into downloads (iddownload,filename,username,time)values(?,?,?,?)");
ResultSet rs=st.executeQuery("select * from file where idfiles='"+fn+"' ");









         if(rs.next())
                {
                   String fname=rs.getString("filename");
                  Connection con1=Dbconnection.getConn();   
                    
                 PreparedStatement ps=con1.prepareStatement("insert into downloads (iddownload,filename,username,time)values(?,?,?,?)");   
                    ps.setString(1,fn);
ps.setString(2,fname);
ps.setString(3,name);
ps.setString(4,strDateNew1);
                 int s = ps.executeUpdate();   
                    
                response.sendRedirect("download2.jsp?success");}
            else
                {
			response.sendRedirect("download.jsp");
				
                }
        }
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
        
%>

</body>
</html>
