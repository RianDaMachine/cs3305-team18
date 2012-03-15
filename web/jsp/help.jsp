<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>TimeFinder - Help</title>
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/sec_style.css">
        <link rel="stylesheet" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/menu.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/login_structure.css">

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
                            <form action="/" method="POST"><!-- Begin contact form -->
                                <fieldset>
                                    <p><label>Name</label><input type="text" size="30" /></p>
                                    <p><label>Email</label><input type="text" size="30" /></p>
                                    <p><label>Subject</label><input type="text" size="30" /></p>
                                    <p><label>Message</label><textarea cols="30" rows="10"></textarea></p>		
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
        
        
        <div  class="box help">
            <div class="boxBody">
                <h1 class="alignCenter">Help/FAQ panel</h1>
            </div>
            <p class="marginTop" >Thank you for registering with our service!</p>
            <p class="alignCenter" >A confirmation email has been sent to your account with your details</p>
            <p class="alignCenter" >You will now be redirected to our login page </p>
        </div>
        
        
        
        
        
        
        
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>
