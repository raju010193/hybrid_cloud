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



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Secure Data Dedeplication in the cloud</title>
        <link href="css/foundation.css" rel="stylesheet" type="text/css">
        <link href="css/foundation.min.css" rel="stylesheet" type="text/css">
        <link href="css/normalize.css" rel="stylesheet" type="text/css">
        <link href="foundation-icons/foundation-icons.css" rel="stylesheet" type="text/css">
        <link href="css/base.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="owlcarousel/assets/owl.carousel.css" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

        <script src="js/js/vendor/jquery.js" type="application/javascript"></script>
        <script src="js/js/foundation/foundation.js" type="application/javascript"></script>
        <script src="js/js/foundation.min.js" type="application/javascript"></script>
        <script src="js/js/foundation/foundation.topbar.js" type="application/javascript"></script>
        <script src="js/js/foundation/foundation.orbit.js" type="application/javascript"></script>
        <script src="js/js/foundation/foundation.reveal.js" type="application/javascript"></script>
        <script src="js/js/foundation/foundation.abide.js" type="application/javascript"></script>
        <script src="owlcarousel/owl.carousel.min.js"></script>

        <style>
            .owl-item{
                width: 1000px;
            }
            .owl-item > img{
                height: 350px;

            }
        </style>
    </head>
    <body>
        <%
HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   
String name=user.getAttribute("name").toString();     

Connection con=Dbconnection.getConn();
Statement st1=con.createStatement();
ResultSet rt1=st1.executeQuery("select * from rights where username_='"+uname+"'");
if(rt1.next()){
    String up=rt1.getString("update_");
    if(up.equalsIgnoreCase("yes")){
        
    }
       else{
        response.sendRedirect("user_page1.jsp?no='yes'");
       }
}   

%>
        <div class="row">
            <div class="large-12 " id="menu">
                <div class="sticky">
                    <div class="fixed">
                        <nav class="top-bar" data-topbar role="navigation">
                            <section class="top-bar-section" >
                                <ul>
                                    <li><a href="user_page1.jsp">HOME</a></li>
                                    <li ><a href="update.jsp">UPDATE</a></li>
                                    <li><a href="upload.jsp">UPLOAD</a></li>
                                    <li><a href="download.jsp">DOWNLOAD</a></li>
                                    <li><a href="my_rights.jsp">MY RIGHTS</a></li>
                                    <li><a href="index.html">LOGOUT</a></li>




                                </ul>
                            </section>
                        </nav>
                    </div>
                </div>
            </div>
        </div> 
       
        <div class="row">
            <div class="large-6 medium-6 small-4 columns large-centered" style="margin-top: 50px;">
                <p class="text-center" style="font-size:25px;color: brown;font-weight: bold"> Welcome to! <%= name.toUpperCase()%></p>
            </div>
        </div>


        <div class="row" style="margin-top:10px;">
            <div class="large-12 medium-6 small-4 columns">
                <center>
                      <%
//HttpSession user=request.getSession();
//String uname=user.getAttribute("username").toString();   
//String name=user.getAttribute("name").toString();  
  
String id=request.getQueryString();
String fname=null;


String file_name=request.getParameter("key");
String data=null;
Blob file2= null,file1= null,blob=null;
try
{
Connection con1=Dbconnection.getConn();

PreparedStatement ps=con1.prepareStatement("select * from file where idfiles='"+id+"'");
ResultSet rs=ps.executeQuery();
	
while(rs.next())
 {
 file2=rs.getBlob(1);
 data=rs.getString("filename");
session.setAttribute("fname1",data);
}
byte[] bdata = file2.getBytes(1, (int)file2.length());
String data1 = new String(bdata);
//out.print(data1);

%>
                    
                       <p class="text-center" style="font-weight: bold;">Files Details Here</p>
                        <hr style="border: 1px solid green;">
                        <form action="updating.jsp?<%=id%>" name="name" method="post" onsubmit="return validation()">
                            
                            
                             <div class="name-field text-left">
                        <label >File Name: <font style="color: tomato"> <%=data%></font>
                            <textarea name="content" style="height: 300px"><%=data1%></textarea>
                        </label>
                       
                     </div>
                   
                  
                    
                   <div class="button-field">

                            <div class="row">
                                <div class="large-12a columns">

                                </div>

                                <div class="large-12 columns">

                                    <button type="submit" class="button radius expand" >UPDATE</button>

                                </div>
                            </div>
                        </div>

                            
                            
                            
                            


<%
}
catch(Exception e1)
{
out.println(e1.getMessage());

}
%>
                                                                    
</form>
                  
                </center>

            </div>
        </div>




        <div class="row footer-section" style="margin-top: 150px">

            <p class="text-center" style="font-size: 12px;color: red">
                Copyright © 2017. Privacy Policy. All Rights Reserved
            </p>
        </div>


        <script type="text/javascript">
            $(document).ready(function(){
                $(document).foundation();
                $('.owl-carousel').owlCarousel({
                    items:1,
                    loop:true,
                    margin:10,
                    autoplay:true,
                    autoplayTimeout:2000,
                    autoplayHoverPause:true,
                    responsiveClass:true
                });
            });
        </script>


    </body>
</html>
