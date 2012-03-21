<!--
 * Author : Luke Murphy
 -->
 
<%@page import="classes.beans.UserBean"%>
<% UserBean userBean = (UserBean) session.getAttribute("userBean");%>
<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    session.removeAttribute("uid");
    session.invalidate();
%>


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
                <h1 class="alignCenter">Thank you for using our service!</h1>
            </div>
            <p class="marginTop" >We hope to see you again.</p>
            <p class="alignCenter" >Redirecting you now...</p>
        </div>
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>