<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="classes.SuperUser" %>
<%@ page import="java.util.*;" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>TimeFinder - Admin</title>
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/sec_style.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/menu.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">

    </head>
    <body>
        <div id="wrapper_menu"><!-- BEGIN MENU WRAPPER -->
            <ul class="menu menu_black"><!-- BEGIN MENU -->
                <li class="nodrop"><a href="Logout">Logout</a></li><!-- No Drop Down Item -->
            </ul><!-- END MENU -->
        </div><!-- END MENU WRAPPER -->
        
        <div  class="box admin">
            <div class="boxBody">
                <h1 class="alignCenter">SuperUser admin panel</h1>
            </div>
            <%
                SuperUser su = new SuperUser();
                su.queryLecturers();
            %>
                        
            <table>
         
                
            </table>
            <table>
                <tr><td><% out.println("There are no lecturers awaiting validation :)"); %> </td></tr>
            </table>
        </div>
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>
