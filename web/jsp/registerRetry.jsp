<!--
 * Author : Luke Murphy
-->

<%@page language="java" contentType="text/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@page import="classes.beans.UserBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>Registration page</title>
        <meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_reset.css">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">
            
        <% 
                   //Get errors for registration
                   Hashtable errors = (Hashtable) session.getAttribute("errors");
                   String uid = (String) errors.get("uid");
                   String pwd = (String) errors.get("password");
                   String fname = (String) errors.get("fname");
                   String lname = (String) errors.get("lname");
                   String email = (String) errors.get("email");
                   
                   UserBean bean = (UserBean) session.getAttribute("regBean");
                   String valUid = bean.getUid();
                   String valFname = bean.getFirstName();
                   String valLname = bean.getLastName();
                   String valPwd = bean.getPassword();
                   String valEmail = bean.getEmail();
       %>    
    </head>
    <body>
        <form action="register" method="POST" class="box registration">
            <fieldset class="boxBody">
                
                <label>User ID</label>
                <input type="text" name="username" value="<% if(valUid != null) out.println(valUid); %>" tabindex="1" placeholder="UserName" required>
                <p class="errorReg"><% if( ! uid.equals("") ){ out.println( uid );} %></p>
                    
                <label>Password</label>
                <input type="password" name="password" value="<% if(valPwd != null) out.println(valPwd); %>" placeholder="Password" tabindex="2" required>
                <p class="errorReg"><% if( ! pwd.equals("") ){ out.println( pwd );} %></p>
                    
                <label>First Name</label>
                <input type="text" name="firstname" value="<% if(valFname != null) out.println(valFname); %>" tabindex="1" placeholder="First name" required>
                <p class="errorReg"><% if( ! fname.equals("") ){ out.println( fname );} %></p>
                    
                <label>Last Name</label>
                <input type="text" name="lastname" value="<% if(valLname != null) out.println(valLname); %>" tabindex="1" placeholder="Last name" required>
                <p class="errorReg"><% if( ! lname.equals("") ){ out.println( lname );} %></p>
                    
                <label>Email Address</label>
                <input type="text" name="email" value="<% if(valEmail != null) out.println(valEmail); %>" tabindex="1" placeholder="Email" required>
                <p class="errorRegMail"><% if( ! email.equals("") ){ out.println( email );} %></p>
                
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



