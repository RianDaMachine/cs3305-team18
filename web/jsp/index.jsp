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
            
               <% 
                String userErr="";
                String passErr="";
                String userReturn="";
                String passReturn="";
                
               if( session.getAttribute("loginErr") != null ){
                    Hashtable errors = (Hashtable) session.getAttribute("loginErr");
                    userErr = (String) errors.get("username");
                    passErr = (String) errors.get("password"); 
                    userReturn = (String) errors.get("userReturn");
                    passReturn = (String) errors.get("passReturn");
                }
                 %> 
    </head>
    <body>
        <form action="login" method="POST" class="box login">
            <fieldset class="boxBody">
                
                <label>User ID</label>
                <input type="text" name="username" value="<%out.println(userReturn);%>" tabindex="1" placeholder="UserName" required>
                <p class="error"><% if( ! userErr.equals("") ){ out.println( userErr);} %></p>
                    
                
                <label>Password</label>
                <input type="password" name="password" value="<%out.println(passReturn);%>" placeholder="Password" tabindex="2" required>
                <p class="error"><% if( ! passErr.equals("") ){ out.println( passErr);}%></p>
                     
            </fieldset>
            <footer>
               <input type="submit" class="btnLogin" value="Login" tabindex="4">
                <a href="registerPage" class="lLink"><strong>Haven't registered yet?</strong></a>
                <a href="forgot" class="lLink"><strong>Forget your password?</strong></a>
            </footer>
        </form>
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ Time Corp. 2012</a>
        </footer>
    </body>
</html>


