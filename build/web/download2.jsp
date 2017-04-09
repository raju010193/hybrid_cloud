<%-- 
    Document   : cspfiledownload
    Created on : Aug 25, 2013, 12:10:13 PM
    Author     : JOE_SAI
--%>



<%@page import="pack.Dbconnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DOWNLOADING PAGE</title>
    </head>
    <body>
         <%
                 String id=request.getQueryString();
                 
          Connection con=Dbconnection.getConn();
String date2=(String)session.getAttribute("fid");
//String fname1=request.getParameter("file");
//String fkey1=request.getParameter("key");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select content from file where  idfiles='"+date2+"'");

                 while(rs.next())
                 {
                    
                 Blob file1=rs.getBlob("content");
                 if(file1!=null)
                                         {
                     date2+=".doc";
			byte[] ba = file1.getBytes(1, (int)file1.length());
			response.setContentType("APPLICATION/DOWNLOAD");
			response.setHeader("Content-Disposition","attachment; filename=\""+date2+"\"");
			 OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
                                               }
                 }
                   
                
            
              
%>
    </body>
</html>
