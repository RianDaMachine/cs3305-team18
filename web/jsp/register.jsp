<%@page language="java" contentType="text/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Registration page</title>
        <meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_reset.css">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">
    </head>
    <body>
        <form action="register" method="POST" class="box registration">
            <fieldset class="boxBody">
                
                <label>User ID</label>
                <input type="text" name="username" value="" tabindex="1" placeholder="UserName" required>
                    
                <label>Password</label>
                <input type="password" name="password" value="" placeholder="Password" tabindex="2" required>
                    
                <label>First Name</label>
                <input type="text" name="firstname" value="" tabindex="1" placeholder="First name" required>
                    
                <label>Last Name</label>
                <input type="text" name="lastname" value="" tabindex="1" placeholder="Last name" required>
                    
                <label>Email Address</label>
                <input type="text" name="email" value="" tabindex="1" placeholder="Email" required>
                
                <label>User Type</label>
                <select name="usertype" class="selectBox" required >
                    <option value="student">Student</option>
                    <option value="lecturer">Lecturer</option>
                </select>
                     
            </fieldset>
            <footer class="notBoxReg">
               <input type="submit" class="btnLogin" value="Register Me!" tabindex="4">
                   <a href="<c:out value="${pageContext.servletContext.contextPath}"/>" class="btnLogin"  tabindex="4">Back </a>
            </footer>
        </form>
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>



