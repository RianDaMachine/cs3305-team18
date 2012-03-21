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
            <p class="marginTop" >FAQ section coming...</p>
        </div>
        
        
        
        
        
        
        
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>
