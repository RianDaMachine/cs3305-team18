<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_reset.css">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">
        <meta http-equiv="refresh" content="3; URL=<c:out value="${pageContext.servletContext.contextPath}"/>">
        <title>Logout</title>
    </head>

    <body>
        <div  class="box login">
            <div class="boxBody">
                <h1 class="alignCenter">Congratulations!</h1>
            </div>
            <p class="marginTop" >Thank you for registering!</p>
            <p class="alignCenter" >The system admin will verify your account shortly</p>
            <p class="alignCenter" >You will be notified via email</p>
        </div>
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>