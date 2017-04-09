

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
    out.println("<script>alert('your not having permission to do this...')</script>");
}    
if(request.getParameter("status")!=null){
    out.println("<script>alert('Your request sent to private cloud')</script>");
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
%>
        <div class="row">
            <div class="large-6 medium-6 small-4 columns large-centered" style="margin-top: 50px;">
                <p class="text-center" style="font-size:25px;color: brown;font-weight: bold"> Welcome to! <%= name.toUpperCase()%></p>
            </div>
        </div>

       
      <div class="row" style="margin-top:10px;">
            <div class="large-12 medium-6 small-4 columns owl-carousel">
<!--                <div class="owl-item"><img src="images/c3.jpg"></div>-->
                <div class="owl-item"><img src="images/c2.jpg"></div>
                <div class="owl-item"><img src="images/c4.jpg"></div>

            </div>
        </div>




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
