<!--
 * Author : Luke Murphy
-->

<%@page language="java" contentType="text/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Welcome!</title>
        <meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_reset.css">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">
    </head>
    <body>
        <form action="mailPassword" method="POST" class="box login">
            <fieldset class="boxBody">
                <label>Email Address</label>
                <input type="text" name="email" value="" tabindex="1" placeholder="Email" required>  
            </fieldset>
            <p id="specify">Please specify your email address.</p>
            <p class="alignCenter">If this is a valid email address in the system ,  </p>
            <p class="clearBottom"> your NEW password will be sent to you promptly</p>
            <footer class="notBox">
               <input type="submit" class="btnLogin" value="Send!" tabindex="4">
                   <a href="<c:out value="${pageContext.servletContext.contextPath}"/>" class="btnLogin"  tabindex="4">Back To Login</a>
            </footer>
        </form>
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>


