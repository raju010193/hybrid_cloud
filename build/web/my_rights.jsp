<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>




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
if(request.getParameter("no")!=null){
    out.println("<script>alert('your not having permission to update files...')</script>");
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
          <%
HttpSession user=request.getSession();
String uname=user.getAttribute("username").toString();   
String name=user.getAttribute("name").toString();      

Connection con=Dbconnection.getConn();
Statement st1=con.createStatement();
ResultSet rt1=st1.executeQuery("select * from rights where username_='"+uname+"'");
if(rt1.next()){
    String up=rt1.getString("update_");
 
%>
        <div class="row">
            <div class="large-6 medium-6 small-4 columns large-centered" style="margin-top: 50px;">
                <p class="text-center" style="font-size:25px;color: brown;font-weight: bold"> Welcome to! <%= name.toUpperCase()%></p>
            </div>
        </div>


        <div class="row" style="margin-top:10px;">
            <div class="large-8 medium-8 small-4 columns large-centered" style="margin-top: 50px;">



                <p class="text-center" style="font-weight: bold;">My Permissions Here</p>
                <hr style="border: 1px solid green;">


                <center>
                   <table>
 
    <tr style="font-size: 20px; color: cadetblue">
       <td width="100px">S.No</td> <td width="250px">ACTION</td><td width="250px">RIGHTS</td><td width="250px">REQUEST</td>
    </tr>
    <tr>
        <td>1</td><td>UPLOAD </td><td><%=rt1.getString("upload_")%></td><td><a href="request?upload">request</a></td>
    </tr>
    <tr>
       <td>2</td> <td>UPDATE </td><td><%=rt1.getString("update_")%></td><td><a href="request?update">request</a></td>
    </tr>
    <tr>
       <td>3</td> <td>DOWNLOAD </td><td><%=rt1.getString("download_")%></td><td><a href="request?download">request</a></td>
    </tr>
    <%
}    
%>
</table>
                </center>
            </div>
        </div>




<div class="row footer-section"style="margin-top: 150px">

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
