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
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/menu.css" type="text/css" media="screen" />
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
                <li><a href="main" class="drop">Home</a><!-- Begin Home Item -->
                    <div class="dropdown_2columns"><!-- Begin 2 columns container -->
                        <div class="col_2 firstcolumn">
                            <h2>Welcome !</h2>
                            <p>Hi and welcome here ! This is a showcase of the possibilities of this awesome Mega Drop Down Menu.</p>             
                            <p>This item comes with a large range of prepared typographic stylings such as headings, lists, <a href="#">links</a> etc.</p>  
                            <h2 class="pusher">Cross Browser Support</h2>
                            <div class="col_1 firstcolumn">
                                <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/img/browsers.png" width="125" height="46" alt="" />
                            </div>
                            <div class="col_1">
                                <p>This mega menu has been tested in all major browsers.</p>
                            </div>
                            <h2 class="pusher">Compatible Browsers</h2>
                            <div class="col_1 firstcolumn">
                                <ul class="plus">
                                    <li>Internet Explorer</li>
                                    <li>Firefox</li>
                                    <li>Opera</li>
                                </ul>
                            </div>
                            <div class="col_1">
                                <ul class="plus">
                                    <li>Chrome</li>
                                    <li>Safari</li>
                                    <li>What else ?</li>
                                </ul>
                            </div>
                        </div>
                    </div><!-- End 2 columns container -->
                </li><!-- End Home Item -->
                <li><a href="Admin" class="drop">Admin</a><!-- Begin 5 columns Item -->
                    <div class="dropdown_5columns"><!-- Begin 5 columns container -->
                        <div class="col_5 firstcolumn">
                            <h2>This is an example of a large container with 5 columns</h2>
                            <div class="col_1 firstcolumn">
                                <p class="dark_grey_box">This is a dark grey box text.nia vitae a arcu. Sed sed lacus nulla mollis porta quis.</p>
                            </div>
                            <div class="col_1">
                                <p>Phasellus vitae sapien ac leo mollis porta quis sit amet nisi. Mauris hendrerit, metus cursus accumsan tincidunt.</p>
                            </div>
                            <div class="col_1">
                                <p class="italic">This is a sample of an italic text.  at arcu mollis accumsan at nec nisi porta quis sit amet.</p>
                            </div>
                            <div class="col_1">
                                <p>Curabitur euismod gravida ante nec commodo. Nunc dolor nulla, semper in ultricies vitae, vulputate porttitor neque.</p>
                            </div>
                            <div class="col_1">
                                <p class="strong">This is a sample of a bold text. Aliquam sodales nisi nec felis hendrerit ac eleifend lectus feugiat scelerisque.</p>
                            </div>
                        </div>
                        <div class="col_5 firstcolumn">
                            <h2>Here is some content with side images</h2>
                            <div class="col_3 firstcolumn">
                                <img src="../img/01.jpg" width="70" height="70" class="img_left imgshadow_light" alt="" />
                                <p>Maecenas eget eros lorem,  in sem mauris. Aenean a commodo mi. Praesent augue lacus.<br /><a href="#">Read more...</a></p>
                                <img src="../img/02.jpg" width="70" height="70" class="img_left imgshadow_light" alt="" />
                                <p>Aliquam elementum felis  urna, eget varius metus. Aliquam sodales nisi.<br /><a href="#">Read more...</a></p>
                            </div>
                            <div class="col_2">
                                <p class="black_box">This is a black box,rci. Donec interdum lacus at velit varius gravida. Nulla ipsum risus.</p>
                            </div>
                        </div>
                    </div><!-- End 5 columns container -->
                </li><!-- End 5 columns Item -->
                <li><a href="Help" class="drop">Help</a><!-- Begin 4 columns Item -->
                    <div class="dropdown_4columns"><!-- Begin 4 columns container -->
                        <div class="col_4 firstcolumn">
                            <h2>This is a heading title</h2>
                            <div class="col_2 firstcolumn">
                                <p class="favorite">This is a paragraph with a favorite icon. Donec tortor sem, venenatis vitae lobortis ac, cursus vel lacus. </p>
                                <p class="help">This is a paragraph with a help icon. Donec tortor sem, venenatis vitae lobortis ac, cursus vel lacus. </p>
                            </div>
                            <div class="col_2">
                                <p class="mail">This is a paragraph with a mail icon. Donec tortor sem, venenatis vitae lobortis ac, cursus vel lacus. </p>
                                <p class="print">This is a paragraph with a print icon. Donec tortor sem, venenatis vitae lobortis ac, cursus vel lacus. </p>
                            </div>
                        </div>
                        <div class="col_1 firstcolumn">
                            <h3>Some Links</h3>
                            <ul>
                                <li><a href="#">ThemeForest</a></li>
                                <li><a href="#">GraphicRiver</a></li>
                                <li><a href="#">ActiveDen</a></li>
                                <li><a href="#">VideoHive</a></li>
                                <li><a href="#">3DOcean</a></li>
                            </ul>   
                        </div>
                        <div class="col_1">
                            <h3>Useful Links</h3>
                            <ul>
                                <li><a href="#">NetTuts</a></li>
                                <li><a href="#">VectorTuts</a></li>
                                <li><a href="#">PsdTuts</a></li>
                                <li><a href="#">PhotoTuts</a></li>
                                <li><a href="#">ActiveTuts</a></li>
                            </ul>   
                        </div>
                        <div class="col_1">
                            <h3>Other Stuff</h3>
                            <ul>
                                <li><a href="#">FreelanceSwitch</a></li>
                                <li><a href="#">Creattica</a></li>
                                <li><a href="#">WorkAwesome</a></li>
                                <li><a href="#">Mac Apps</a></li>
                                <li><a href="#">Web Apps</a></li>
                            </ul>   
                        </div>
                        <div class="col_1">
                            <h3>Misc</h3>
                            <ul>
                                <li><a href="#">Design</a></li>
                                <li><a href="#">Logo</a></li>
                                <li><a href="#">Flash</a></li>
                                <li><a href="#">Illustration</a></li>
                                <li><a href="#">More...</a></li>
                            </ul>   
                        </div>
                    </div><!-- End 4 columns container -->
                </li><!-- End 4 columns Item -->
                <li class="nodrop"><a href="Logout">Logout</a></li><!-- No Drop Down Item -->
                <li class="right"><a href="#" class="drop">Contact</a><!-- Begin Contact Item -->
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
                        <div class="col_2 firstcolumn">
                            <h2>Find us on social networks</h2>
                            <ul class="social">
                                <li><a href="#"><img src='../img/twitter.png' alt="" /><span>Twitter</span></a></li>
                                <li><a href="#"><img src='../img/facebook.png' alt="" /><span>Facebook</span></a></li>
                                <li><a href="#"><img src='../img/flickr.png' alt="" /><span>Flickr</span></a></li>
                                <li><a href="#"><img src='../img/rss.png' alt="" /><span>RSS Feed</span></a></li>
                                <li><a href="#"><img src='../img/technorati.png' alt="" /><span>Technorati</span></a></li>
                                <li><a href="#"><img src='../img/delicious.png' alt="" /><span>Delicious</span></a></li>
                            </ul>
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
                    <th></th>
                </tr>
                <tr>
                    <!-- MONTH , DATE , SCROLL BARS , DIFFERENT VIEWS -->
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th>GMT+0 </th>
                    <th>Monday 19th </th>
                    <th>Tuesday 20th</th>
                    <th>Wednesday 21rst</th>
                    <th>Thursday  22nd</th>
                    <th>Friday  23rd</th>
                    <th>Saturday  24th</th>
                    <th>Sunday  25th</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th>08.00</th>
                    <td class="selection"> </td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>

                </tr>
                <tr>
                    <th>09.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>

                </tr>
                <tr>
                    <th>10.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>11.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>12.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>13.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td <% if(sched.testSlot( userBean.getUid() , 4 , 5)){%> class="occupied" <%}else{%> class="selection" <%}%> >
                        <% if( sched.checkSlot( userBean.getUid() , 4 , 5) ) {
                            info = sched.getInfo();
                            out.println( "<p>Title : " + info[0] + "</p>");
                            out.println( "<p>Note : " + info[1] + "</p>");
                           }
                        %> 
                    </td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>14.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>15.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>16.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>17.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>18.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>19.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>20.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                </tr>
                <tr>
                    <th>21.00</th>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
                    <td class="selection"></td>
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
                    <input type="submit" class="btnLogin" value="Remove" tabindex="4">
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
                    <option value="3">4</option>
                    <option value="3">5</option>
                    <option value="3">6</option>
                    <option value="3">7</option>
                    <option value="3">8</option>
                    <option value="3">9</option>
                    <option value="3">10</option>
                </select>

                <label for="Comments">Comments</label>
                <input type="text" name="comments" id="comments" class="text ui-widget-content ui-corner-all" />
                
                <input type="hidden" name="uid" value="<%= userBean.getUid() %>"/>
                
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
