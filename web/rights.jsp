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
        <script>
            function validation(){
                if(doucment.name.upload.value==0){
                    alert('select upload rights.');
                    return false;
                }
                if(doucment.name.download.value==0){
                    alert('select upload rights.');
                    return false;
                }
                if(doucment.name.update.value==0){
                    alert('select upload rights.');
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <%
            if (request.getParameter("rights") != null) {
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
                                    <li><a href="rights.jsp">ACCESS CONTROL</a></li>
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
            String token = request.getQueryString();
            Connection con = Dbconnection.getConn();
            Statement st = con.createStatement();
            ResultSet rt = st.executeQuery("select * from rights where token_='" + token + "'");


            if (rt.next()) {
        %>  

        <div class="row">
            <div class="large-6 medium-6 small-4 large-centered" style="margin-left: 230px">
                <form action="rights" name="name" method="get" onsubmit="return validation()">
                     <p class="text-center" style="font-weight: bold;">Send File Permission Here</p>
                    <hr style="border: 1px solid green;">
                <div class="name-field">
                    <label>Access Token <small>required</small>
                       <input type="text" id="id" name="token" readonly="true" value="<%=rt.getString("token_")%>"/>
                    </label>
                    
                </div>
                    <div class="name-field">
                    <label>User Name <small>required</small>
                       <input type="text" id="id"name="uname" readonly="true" value="<%=rt.getString("username_")%>"/>
                    </label>
                    
                </div>
                      <div class="name-field">
                    <label>Upload <small>required</small>
                     <select id="id" name="upload">

                                <option value="yes">yes</option>
                                <option value="no">no</option>
                            </select>
                    </label>
                    
                </div>
                     <div class="name-field">
                    <label>Download <small>required</small>
                        <select id="id" name="download">

                                <option value="yes">yes</option>
                                <option value="no">no</option>
                            </select>
                    </label>
                    </label>
                    
                </div>
                     <div class="name-field">
                    <label>Update <small>required</small>
                      <select id="id" name="update">
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                            </select>
                    </label>
                    
                </div>
<%}%>

                <div class="button-field">

                    <div class="row">
                        <div class="large-12a columns">

                        </div>

                        <div class="large-12 columns">

                            <button type="submit" class="button radius expand" >SEND</button>

                        </div>
                    </div>
                </div>

                </form>

            </div>

        </div>
        <!--<div class="row">
            <div class="large-12 columns medium-6 small-4">-->



        <div class="row footer-section">

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
