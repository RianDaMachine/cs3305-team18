<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="classes.beans.UserBean"%>
<%@page import="classes.model.DataManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_reset.css">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">
        <title>Woops!</title>
    </head>
    <body>
        <%
            UserBean bean = new UserBean();
            DataManager dataManager = new DataManager();

            bean = dataManager.getIsPresentBean();
        %>
        <div  class="box login">
            <div class="boxBody">
                <h1 class="alignCenter">Woops!</h1>
            </div>
            <p class="alignCenter" >You have already registered , you silly billy!</p>
            <p class="alignCenter" >The user with these details was retrieved from our system!</p>
            <p class="alignCenter" > <% out.println(bean.getUid());%></p>
            <p class="alignCenter" > <% out.println(bean.getFirstName());%></p>
            <p class="alignCenter" > <% out.println(bean.getLastName());%></p>
            <p class="alignCenter" > <% out.println(bean.getEmail());%></p>
            <footer class="notBox">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>" class="btnLogin"  tabindex="4">Back To Login</a>
            </footer>
        </div>
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>

    </body>
</html>
