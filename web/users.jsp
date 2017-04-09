<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.Dbconnection"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Online Medical Portal Management</title>
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
    if(request.getParameter("rights")!=null){
        out.println("<script>alert('Updated...')</script>");
    }
    
    %>
        <div class="row">
            <div class="large-12 " id="menu">
                <div class="sticky">
                    <div class="fixed">
                        <nav class="top-bar" data-topbar role="navigation">
                            <section class="top-bar-section" >
                                <ul>
                                    <li ><a href="pcloud_page.jsp">HOME</a></li>
                                    <li ><a href="users.jsp">USERS</a></li>
                                    <li ><a href="user_request.jsp">REQUESTS</a></li>
                                    <li><a href="p_cloud.jsp">LOGOUT</a></li>
                                  
                                    <li ><a href="#">CONTACT US</a></li>


                                </ul>
                            </section>
                        </nav>
                    </div>
       </div>
            </div>
        </div> 
        <div class="row">
            <div class="large-6 medium-6 small-4 columns large-centered" style="margin-top: 50px;">
               <p class="text-center" style="font-size:25px;color: brown;font-weight: bold"> Welcome to Private Cloud</p>
            </div>
        </div>
<%
 Connection con=Dbconnection.getConn();
 Statement st=con.createStatement();
 ResultSet rt=st.executeQuery("select * from user_reg order by activate asc");


%>
    
       
<div class="row">
    <div class="large-12">
        
          <center>
               
                        <form action="" method="get">
                        <table style="border-style: solid">
                           <p class="text-center" style="font-weight: bold;">User Details Here</p>
                    <hr style="border: 1px solid green;">
                            <tr STYLE="background-color: yellowgreen;font-size: 15px;">                                
                                <td>S.No</td><td>NAME</td> <td>USERNAME</td><td>PASSWORD</td><td style="text-align: center">MAIL</td><td>STATUS</td><td>ACTION</td>
                            </tr>
                            <%
                            int count=0;
                            while(rt.next()){
                                String name=rt.getString("name");
                                String uname=rt.getString("username");
                                String pass=rt.getString("password");
                                String mail=rt.getString("mail");
                                String status=rt.getString("activate");
                            %>
                            <TR>
                                <td><%=++count%></td><td><%=name%></td> <td><%=uname%></td> <td style="text-align: center">****</td> <td><%=mail%></td><td style="text-align: center"><%=status%></td>
                                                                                        <%
if(status.equalsIgnoreCase("no")){
    %>
    <td><a href="activate.jsp?<%=uname%>" >Activate</a></td>
                                                            <%
}    
else{
    %>
                                                            
    <td><a href="deativate.jsp?<%=uname%>" >Deactivate</a></td>
    <%
}                                                       
%>
   
                            </TR>    
                            <%
                            }
                            %>
                        </table>
                        </form>
            </center> 
       
    </div>
    
</div>
        <!--<div class="row">
            <div class="large-12 columns medium-6 small-4">-->

        

        <div class="row footer-section" style="margin-top: 200px">

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
