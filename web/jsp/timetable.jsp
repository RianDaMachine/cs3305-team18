<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="classes.beans.UserBean"%>
<%@page import="classes.SoloScheduleServlet"%>
<% UserBean userBean = (UserBean) session.getAttribute("userBean");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>TimeFinder - Home</title>
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/sec_style.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/themes/base/jquery.ui.all.css">
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">

        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/jquery-1.7.1.js"></script>
        <!--<script> var jq171 = jQuery.noConflict(true); </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
        <script> var jq144 = jQuery.noConflict(); </script>-->

        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/external/jquery.bgiframe-2.1.2.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.core.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.widget.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.mouse.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.button.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.draggable.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.position.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.resizable.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.ui.dialog.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/ui/jquery.effects.core.js"></script>
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/development-bundle/demos/demos.css">
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/timetable.js"></script>
        <script src="<c:out value="${pageContext.servletContext.contextPath}"/>/jquery/tumblrtags.js"></script>

        <%  SoloScheduleServlet sched = new SoloScheduleServlet();
            String[] info = new String[4];
        %>


        <script type="text/javascript" charset="utf-8">

            $(document).ready(function () {
                $('.tag-editor').tumblertags();
            });

        </script>

    </head>
    <body>


        <div id="wrapper_menu"><!-- BEGIN MENU WRAPPER -->
            <ul class="menu menu_black"><!-- BEGIN MENU -->
                <li><a href="main" class="drop">Home</a> </li>
                <li><a href="Admin" class="drop">Admin</a></li>
                <li><a href="Help" class="drop">Help</a></li>
                <li class="nodrop"><a href="Logout">Logout</a></li>
                <li class="right"><a href="#" class="drop">Contact</a>
                    <div class="dropdown_2columns align_right"><!-- Begin right aligned container -->
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


        <table id="table">

            <thead>
                <tr>
                    <!-- MONTH , DATE , SCROLL BARS , DIFFERENT VIEWS -->
                    <th></th>
                    <th></th>
                    <th></th>
                    <th>March </th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th>GMT+0 </th>
                    <th>Monday 19th </th>
                    <th>Tuesday 20th</th>
                    <th>Wednesday 21st</th>
                    <th>Thursday  22nd</th>
                    <th>Friday  23rd</th>
                    <th>Saturday  24th</th>
                    <th>Sunday  25th</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>08.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 0)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 0)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 0)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 0)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 0)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 0)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 0)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 0)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 0)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 0)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 0)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 0)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 0)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 0)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>

                </tr>
                <tr>
                    <th>09.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 1)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 1)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 1)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 1)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 1)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 1)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 1)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 1)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 1)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 1)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 1)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 1)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 1)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 1)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>

                </tr>
                <tr>
                    <th>10.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 2)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 2)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 2)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 2)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 2)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 2)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 2)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 2)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 2)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 2)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 2)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 2)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 2)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 2)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>11.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 3)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 3)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 3)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 3)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 3)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 3)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 3)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 3)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 3)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 3)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 3)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 3)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 3)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 3)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>12.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 4)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 4)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 4)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 4)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 4)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 4)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 4)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 4)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 4)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 4)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 4)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 4)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 4)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 4)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>13.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 5)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 5)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 5)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 5)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 5)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 5)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 5)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 5)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 5)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 5)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 5)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 5)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 5)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 5)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>14.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 6)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 6)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 6)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 6)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 6)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 6)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 6)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 6)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 6)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 6)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 6)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 6)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 6)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 6)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>15.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 7)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 7)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 7)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 7)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 7)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 7)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 7)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 7)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 7)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 7)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 7)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 7)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 7)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 7)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>16.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 8)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 8)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 8)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 8)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 8)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 8)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 8)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 8)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 8)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 8)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 8)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 8)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 8)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 8)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>17.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 9)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 9)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 9)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 9)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 9)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 9)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 9)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 9)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 9)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 9)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 9)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 9)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 9)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 9)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>18.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 10)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 10)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 10)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 10)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 10)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 10)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 10)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 10)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 10)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 10)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 10)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 10)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 10)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 10)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>19.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 11)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 11)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 11)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 11)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 11)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 11)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 11)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 11)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 11)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 11)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 11)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 11)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 11)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 11)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>20.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 12)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 12)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 12)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 12)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 12)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 12)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 12)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 12)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 12)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 12)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 12)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 12)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 12)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 12)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
                <tr>
                    <th>21.00</th>
                    <td <% if (sched.testSlot(userBean.getUid(), 1, 13)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 1, 13)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 2, 13)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 2, 13)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 3, 13)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 3, 13)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 4, 13)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 4, 13)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 5, 13)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 5, 13)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 6, 13)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 6, 13)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                    <td <% if (sched.testSlot(userBean.getUid(), 0, 13)) {%> class="occupied" <%} else {%> class="selection" <%}%> >
                        <% if (sched.checkSlot(userBean.getUid(), 0, 13)) {
                                info = sched.getInfo();
                                out.println("<p>Title : " + info[0] + "</p>");
                                out.println("<p>Note : " + info[1] + "</p>");
                            }
                        %> 
                    </td>
                </tr>
            </tbody>
        </table>

    </div>

    <div class="demo">

        <div id="editRemove" title="Choose Type">
            <button class="edit">Edit?</button>
            <button class="remove">Remove?</button>
        </div> 

        <div class="removeForm">  
            <form action="editRemove" method="POST">
                <div class="scheduleInfo">
                    <label for="when">Time</label>
                    <select name="time" >
                        <option value="0">08.00</option>
                        <option value="1">09.00</option>
                        <option value="2">10.00</option>
                        <option value="3">11.00</option>
                        <option value="4">12.00</option>
                        <option value="5">13.00</option>
                        <option value="6">14.00</option>
                        <option value="7">15.00</option>
                        <option value="8">16.00</option>
                        <option value="9">17.00</option>
                        <option value="10">18.00</option>
                        <option value="11">19.00</option>
                        <option value="12">20.00</option>
                        <option value="13">21.00</option>
                    </select>

                    <!-- Jscript no ready yet ,here is vanilla solution -->
                    <label for="when">Day</label>
                    <select name="day" >
                        <option value="0">Sun</option>
                        <option value="1">Mon</option>
                        <option value="2">Tue</option>
                        <option value="3">Wed</option>
                        <option value="4">Thurs</option>
                        <option value="5">Fri</option>
                        <option value="6">Sat</option>
                    </select>
                    <div class="scheduleInfo">
                        <input type="submit" class="btnLogin" value="Remove!" tabindex="4">
                    </div>
                    <input type="hidden" name="remove" value="remove">
                </div>
            </form>
        </div>

        <div class="editForm">  
            <form action="editRemove" method="POST">
                <div class="scheduleInfo">
                    <input type="submit" class="btnLogin" value="Edit" tabindex="4">
                    <input type="hidden" name="edit" value="edit">
                </div>
            </form>
        </div>




        <div id="formOption" title="Choose Type">
            <button class="groupForm">Group / Several</button>
            <button class="self">Personal</button>
        </div>

        <!-- PERSONAL -->
        <div class="meeting">  
            <form action="soloServlet" method="POST">
                <label for="where">Title</label>
                <input type="text" name="title" id="when" class="text ui-widget-content ui-corner-all" required/>

                <label for="when">Duration</label>
                <label for="when">(Determined in hours)</label>
                <select name="duration" >
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>

                <label for="Comments">Comments</label>
                <input type="text" name="comments" id="comments" class="text ui-widget-content ui-corner-all" />

                <input type="hidden" name="uid" value="<%= userBean.getUid()%>"/>

                <label for="when">Will this be a recurring event ?</label>
                <label for="when">(Determined in weeks)</label>
                <select name="recurring" >
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>

                <!-- Jscript no ready yet ,here is vanilla solution -->
                <label for="when">Time</label>
                <select name="time" >
                    <option value="0">08.00</option>
                    <option value="1">09.00</option>
                    <option value="2">10.00</option>
                    <option value="3">11.00</option>
                    <option value="4">12.00</option>
                    <option value="5">13.00</option>
                    <option value="6">14.00</option>
                    <option value="7">15.00</option>
                    <option value="8">16.00</option>
                    <option value="9">17.00</option>
                    <option value="10">18.00</option>
                    <option value="11">19.00</option>
                    <option value="12">20.00</option>
                    <option value="13">21.00</option>
                </select>

                <!-- Jscript no ready yet ,here is vanilla solution -->
                <label for="when">Day</label>
                <select name="day" >
                    <option value="0">Sun</option>
                    <option value="1">Mon</option>
                    <option value="2">Tue</option>
                    <option value="3">Wed</option>
                    <option value="4">Thurs</option>
                    <option value="5">Fri</option>
                    <option value="6">Sat</option>
                </select>
                <div class="scheduleInfo">
                    <input type="submit" class="btnLogin" value="Schedule!" tabindex="4">
                </div>
            </form>
        </div>

        <!-- GROUP / SEVERAL -->
        <div id="dialog-form">
            <form action="DECIDE WHAT TO DO HERE" method="POST">
                <label for="where">Title</label>
                <input type="text" name="when" id="when" class="text ui-widget-content ui-corner-all" />

                <label for="when">Duration</label>
                <label for="when">(Determined in hours)</label>
                <select>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="3">4</option>
                    <option value="3">5</option>
                    <option value="3">6</option>
                    <option value="3">7</option>
                    <option value="3">8</option>
                    <option value="3">9</option>
                    <option value="3">10</option>
                </select>

                <label for="where">Choose a group?</label>
                <input type="text" name="when" id="when" class="text ui-widget-content ui-corner-all" />

                <label for="when">Choose an individual?</label>
                <input type="text" name="where" id="where" class="text ui-widget-content ui-corner-all" />

                <div class="tag-editor">
                    <label for="attending">Attending</label>
                    <p>Will show who is attending here...</p>

                    <div class="tags-container">
                        <input type="text" name="attending" id="attending" class="text ui-widget-content ui-corner-all"/>
                        <div class="visualClear"><!-- clear floats --></div>
                    </div>
                </div>
                <label for="when">Will this be a recurring event ?</label>
                <label for="when">(Determined in weeks)</label>
                <select>
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="3">4</option>
                    <option value="3">5</option>
                    <option value="3">6</option>
                    <option value="3">7</option>
                    <option value="3">8</option>
                    <option value="3">9</option>
                    <option value="3">10</option>
                </select>
                <div class="scheduleInfo">
                    <input type="submit" class="btnLogin" value="Schedule!" tabindex="4">
                </div>
            </form>
        </div>   


        <footer id="main">
            <a href="/">@ TimeFinder Corp. 2012</a>
        </footer>



</body>
</html>
