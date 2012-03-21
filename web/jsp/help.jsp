<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>TimeFinder - Help</title>
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/sec_style.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/menu.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">

    </head>
     <div id="wrapper_menu"><!-- BEGIN MENU WRAPPER -->
            <ul class="menu menu_black"><!-- BEGIN MENU -->
                <li><a href="main" class="drop">Home</a> </li>
                <li><a href="Admin" class="drop">Admin</a></li>
                <li><a href="Help" class="drop">Help</a></li>
                <li class="nodrop"><a href="Logout">Logout</a></li>
                <li class="right"><a href="#" class="drop">Contact</a>
                    <div class="dropdown_2columns align_right">
                        <div class="col_2 firstcolumn">
                            <h2>Contact Us</h2>
                            <form action="/Contact" method="POST"><!-- Begin contact form -->
                                <fieldset>
                                    <p><label>Subject</label><input name="subject" type="text" size="30" /></p>
                                    <p><label>Message</label><textarea name="text" cols="30" rows="10"></textarea></p>		
                                    <button type="submit" class="submit">Send</button>
                                </fieldset>		
                            </form><!-- End contact form -->
                        </div>
                    </div><!-- End right aligned container -->
                </li><!-- End Contact Item -->
            </ul><!-- END MENU -->
        </div><!-- END MENU WRAPPER -->
        
        
        <div  class="box help">
            <div class="boxBody">
                <h1 class="alignCenter">Help/FAQ panel</h1>
            </div>
            <p class="marginTop" ><strong>How do I register and/or pay for the service</strong><br>
                TimeFinder is currently in free beta. Registering is simple and can be completed by visiting our home page. 
                You can simply use it to set up and arrange meetings. There is no catch i.e. it does exactly what it says 
                feel free to try it and to use it for arranging meetings.<br>

                In the future this product will become a paid service. The personal version will cost a one off charge of 100 for a lifetime subscription. 
                We will also be introducing enterprise payment schemes, contact us to enquire. Click here to sign up.</p>

            <p class="marginTop"><strong>Is my information kept private</strong><br>
                Yes it is. TimeFinder Ltd. will not will not sell, share, rent, or give away this information to others in any way. 
                For more information, see our privacy statement</p>
            <p class="marginTop"><strong>Are my meeting secure</strong><br>
                <ul>
                    <li>Yes they are. No one can view your timetable bar you. </li>
                    <li>If there is enough demand, we can make TimeFinder available on a secure server.</li>
                    <li>If there is enough demand, we can make TimeFinder available for you to run on your own servers, e.g. behind your own institutions' firewalls.</li>
                </p>
            <p class="marginTop"><strong>Can I synchronize with my personal information manager or other electronic diary (including Web-based calendars)</strong><br>
            This is currently under investigation. We are focusing on the core functionality of our service at the minute</p>
            
            <p class="marginTop"><strong>Can I run my own TimeFinder server</strong><br>
                Not directly, but if you are interested in a 'private label' version for your own company, or a capability such as 'timefinder.mycompany.com' please contact us and we can set it up for you</p>
            
            <p class="marginTop"><strong>Do I have to use a specific browser to access TimeFinder</strong><br>
            No. We have tested the latest versions of all major browsers and confirmed that TimeFinder is fully compatible. 
            We cannot guarantee that older versions of browsers will support our site, we suggest to update your browser to the latest version regularly. 
            We also cannot guarantee that functionality will not be broken by either TimeFinder or browser updates, any such breakages will be addressed ASAP by out coders. 
            Contact us if you find any problems</p>
            
            <p class="marginTop"><strong></strong><br>
            </p>
            <p class="marginTop"><strong></strong><br>
            </p>
            <p class="marginTop"><strong></strong><br>
            </p>
            <p class="marginTop"><strong></strong><br>
            </p>
            <p class="marginTop"><strong></strong><br>
            </p>
             <p class="marginTop"><strong></strong><br>
            </p>
             <p class="marginTop"><strong></strong><br>
            </p>
             <p class="marginTop"><strong></strong><br>
            </p>
             <p class="marginTop"><strong></strong><br>
            </p>
                        
            
        </div>
        
        
        
        
        
        
        
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>
