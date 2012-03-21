package classes;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;


import classes.beans.UserBean;
import classes.model.DataManager;

public class LoginServlet extends HttpServlet {

    private String dbResult = null;
    private String myException = null;
    private String strError = null;
    private boolean dbOK = false;
    private Hashtable loginErr = new Hashtable();
    private UserBean userBean;
    private DataManager dataManager;
    private String loginURL = "";

        public void setLoginURL( String valueSupplied) {
        this.loginURL = valueSupplied;
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dataManager = new DataManager();

        // Will have to use web.xml to define these when we deploy .WAR
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");
        setLoginURL( config.getInitParameter("loginURL") );
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception ex) {
            System.out.println("Initialize connector string");
            ex.printStackTrace();
        }
    }

    public Hashtable getLoginErr() {
        return this.loginErr;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("\n\n\n");
        System.out.println("DEBUGGING STARTS HERE \n");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession(true);

        if (validLogin(userName, password)) {
            
            if( userName.equals("000000000")) {
                System.out.println("SUPER USER HERE");
                response.sendRedirect("/timeFinder/superUser");
            }else {
            
            userBean = new UserBean();
            userBean = dataManager.getUserData(userName, password);
            
            session.setAttribute("userBean", userBean);
            session.setAttribute("uid", userBean.getUid());
            
            System.out.print( "Uid is this mofucka : " + userBean.getUid() + "\n\n" );
            
            System.out.println("LOGINURL = " + loginURL );
            //RequestDispatcher dispatcher = request.getRequestDispatcher( loginURL );
            response.sendRedirect("/timeFinder/main"); // is this safe? Unconfigured...need to import context to servlet.
            //dispatcher.forward(request, response);
            }
        } else {
            System.out.println("ERRORS !");
            session.setAttribute("loginErr", loginErr);
            //RequestDispatcher dispatcher = request.getRequestDispatcher("/");
            response.sendRedirect("/timeFinder/");
            //dispatcher.forward(request, response);
        }
    }

    public boolean validLogin(String uid, String pwd) {
        boolean isValid = true;
        // check username
        if (!dataManager.checkUid(uid)) {
            //not valid!
            System.out.println("checkVerfied : " + dataManager.checkVerified());
            if ( ! dataManager.checkVerified() ) {
                System.out.println("I WENT IN HERE!");
                loginErr.put("username", dataManager.getNotVerified());
                loginErr.put("userReturn", "");
            }else {
                System.out.println("VERIFIED");
                // is a verified lecturer
                loginErr.put("username", "Invalid user ID");
                loginErr.put("userReturn", "");
            }
            loginErr.put("userReturn", "");
            isValid = false;
        } else {
            // uid is valid , send it back
            loginErr.put("userReturn", uid);
            //avoid NullPointerException
            loginErr.put("username", "");

        }

        // check password
        if (!dataManager.checkPassword(pwd)) {
            //not valid!
            loginErr.put("password", "Invalid Password!");
            loginErr.put("passReturn", "");
            isValid = false;
        } else {
            //passwod is valid , send that back
            loginErr.put("passReturn", pwd);
            //avoid NullPointerException
            loginErr.put("password", "");

        }
        return isValid;
    }
}
