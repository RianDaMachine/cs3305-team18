<!--
 * Author : Luke Murphy
 * Co Author : Rian , Liz
-->

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
     <div id="wrapper_menu"><!-- BEGIN MENU WRAPPER -->
            <ul class="menu menu_black"><!-- BEGIN MENU -->
                <li><a href="main" class="drop">Home</a> </li>
                <li><a href="Admin" class="drop">Admin</a></li>
                <li><a href="Help" class="drop">Help</a></li>
                <li class="nodrop"><a href="Logout">Logout</a></li>
                <li class="right"><a href="#" class="drop">Contact</a>
                    <div class="dropdown_2columns align_right">
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
        
         <div  class="box help">
            <div class="boxBody">
                <h1 class="alignCenter">About</h1>
            </div>
             <p class="marginTop">
                This software has been developed by three UCC Computer Science  students for a team software project module. 
                The project outline given for us to complete is available <a href="http://thing.ucc.ie/cs3305/lectures/ProjectExplainedEH.ppt">thing.ucc.ie/cs3305</a></p>
              <p class="marginTop"><strong>Description of Service</strong><br></br>
            TimeFinder is a web-based meeting scheduler. We provide a service which simplifies the organisation of meetings with large groups of people.<br>

            Any new features added will be provided to all subscribers, we will not ask for any additional fees.<br>

               To use our service you must have an active web connection.</p>
             <p class="marginTop"><strong>Team Members</strong><br></br>
                Liz Hayes<br>
                Luke Murphy<br>
                Rian O Cuinneagain <a href="www.wonkywelly.com">www.wonkywelly.com</a> </p>
         </div>
             

    <div  class="box help">
        <div class="boxBody">
            <h1 class="alignCenter">Help/FAQ panel</h1>
        </div>
        <p class="marginTop" ><strong>How do I register and/or pay for the service</strong><br>
            TimeFinder is currently in free beta. Registering is simple and can be completed by visiting our home page. 
            You can simply use it to set up and arrange meetings. There is no catch i.e. it does exactly what it says 
            feel free to try it and to use it for arranging meetings.<br>

            <p class="marginTop"><strong>Is my information kept private</strong><br></br>
                Yes it is. TimeFinder Ltd. will not will not sell, share, rent, or give away this information to others in any way. 
                For more information, see our privacy statement</p>
            <p class="marginTop"><strong>Are my meeting secure</strong><br></br>
                <ul>
                    <li>Yes they are. No one can view your timetable bar you. </li>
                    <li>If there is enough demand, we can make TimeFinder available on a secure server.</li>
                    <li>If there is enough demand, we can make TimeFinder available for you to run on your own servers, e.g. behind your own institutions' firewalls.</li>
                </ul>
            
            <p class="marginTop"><strong>Can I synchronize with my personal information manager or other electronic diary (including Web-based calendars)</strong><br>
                This is currently under investigation. We are focusing on the core functionality of our service at the minute</p>

            <p class="marginTop"><strong>Can I run my own TimeFinder server</strong><br></br>
                Not directly, but if you are interested in a 'private label' version for your own company, or a capability such as 'timefinder.mycompany.com' please contact us and we can set it up for you</p>

            <p class="marginTop"><strong>Do I have to use a specific browser to access TimeFinder</strong><br></br>
            No. We have tested the latest versions of all major browsers and confirmed that TimeFinder is fully compatible. 
            We cannot guarantee that older versions of browsers will support our site, we suggest to update your browser to the latest version regularly. 
            We also cannot guarantee that functionality will not be broken by either TimeFinder or browser updates, any such breakages will be addressed ASAP by out coders. 
            Contact us if you find any problems</p>
        </div>
              
         <div  class="box help">
            <div class="boxBody">
                <h1 class="alignCenter">Terms and Conditions</h1>
            </div>
            <p class="marginTop"><strong>Termination</strong><br></br>
            TimeFinder reserve the right to cancel the accounts of any users who have been found to be knowingly attempting to abuse our system. 
            Users whose accounts have been terminated will be given the chance to get their account reactivated if they can prove it was wrongfully terminated,
            users will not lose any data in this circumstance. Users whose accounts are fully terminated will not receive and description of refund from TimeFinder.</p>
  
            <p class="marginTop"><strong>Disclaimer of Warranties</strong><br></br>
            Our software is provided <>as is<>, with no warranties whatsoever.
            TimeFinder do not accept any responsibility for any harm resulting from use of our TimeFinder meeting scheduler.
            <br></br>
            TimeFinder makes no warranty that (<strong>i</strong>) the service will meet your requirements, (<strong>ii</strong>) the service will be uninterrupted, 
            timely, secure, or error-free, (<strong>iii</strong>) the results that may be obtained from the use of the service will be accurate or reliable, 
            (<strong>iv</strong>) the quality of any products, services, information, or other material purchased or obtained by you through the service will meet your
            expectations, and (<strong>v</strong>) any errors in the software will be corrected.
            <br></br>
            TimeFinder makes no warranty that (i) the service will meet your requirements, (ii) the service will be uninterrupted, timely, secure, 
            or error-free, (iii) the results that may be obtained from the use of the service will be accurate or reliable, 
           (iv) the quality of any products, services, information, or other material purchased or obtained by you through the service will meet your expectations, 
            and (v) any errors in the software will be corrected.</p>
            <p class="marginTop"><strong>Privacy statement</strong><br></br>
            TimeFinder corp is the sole owner of the information collected on this site. We will not sell, share, rent, or give away such information,
            above and beyond what is already visible in the public domain through our sites and services, or as may be required to comply with due process of law. 
            In cases where such 'due process of law' is involved, we will assess and deal with the legal implications and advise any affected users of our services accordingly.</p>
            <p class="marginTop"><strong>Use of email addresses</strong><br></br>
            In order to use this service, a TimeFinder user must first provide his or her email address. 
            This information is only used by TimeFinder to contact that user about the meetings on this site that he or she is using, 
            or to notify the user as individual responses are accumulated from participants explicitly invited by that user, or to send out registration acknowledgements, 
            or to confirm password changes, or to contact TimeFinder users about service updates and improvements or changes to our service.</p>
            <p class="marginTop"><strong>Security</strong><br></br>
            No data transmission over the Internet can be guaranteed to be 100% secure. As a result, while we strive to protect your personal information, 
            TimeFinder cannot ensure or warrant the security of any information you transmit to us or from our online products or services, 
            and you do so at your own risk. We make our best effort to ensure its security on our systems. 
            Your TimeFinder account is password protected so that only you can access it and view the member information relevant to the account. 
            You are responsible for maintaining the secrecy of your passwords and any account information. Remember to sign out of your TimeFinder 
            account and close your browser window when you have finished your work. This is to ensure that others cannot access your personal information.</p>
             <p class="marginTop"><strong>Internet tracking</strong><br></br>
            We do not log  information sent by your web browser when it requests a web page, such the Internet ('IP') address.</p>
             <p class="marginTop"><strong>Cookies</strong><br></br>
            A cookie is a piece of information that is stored on your computer's hard drive by your web browser. We do not use cookies.
            This helps to protect your anonymity, and makes using our service on public PCs safer</p>
            <p class="marginTop"><strong></strong><br>
            </p>
            <p class="marginTop"><strong></strong><br>
            </p>                       
            
        </div>
        
        
        
        
        
        
        
        <footer id="main">
            <a href="<c:out value="${pageContext.servletContext.contextPath}"/>">@ TimeFinder Corp. 2012</a>
        </footer>
    </body>
</html>
