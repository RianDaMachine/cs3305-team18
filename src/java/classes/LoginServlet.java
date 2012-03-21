/*
 * Author : lwm1
 * Student Number : 109765255
 */

package classes;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.logging.*;

import classes.beans.UserBean;
import classes.model.DataManager;

// responsible for getting parameters for login
public class LoginServlet extends HttpServlet {

    //database vars
    private String dbResult = null;
    private String myException = null;
    private String strError = null;
    private boolean dbOK = false;
    private String loginURL = "";
    
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
    
    // errors stored here
    private Hashtable loginErr = new Hashtable();
  
    private UserBean userBean;
    private DataManager dataManager;
    
    // check if XML config for Database strings works
    public void setLoginURL(String valueSupplied) {
        this.loginURL = valueSupplied;
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dataManager = new DataManager();

        // Better to get Strings from XML config
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");
        setLoginURL(config.getInitParameter("loginURL"));
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Cannot Connect to DB @ LoginServlet init method!");
        }
    }

    // return errors for login
    public Hashtable getLoginErr() {
        return this.loginErr;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession(true);

        if (validLogin(userName, password)) {
            //should be a DataManager.x() lookup method
            if (userName.equals("000000000")) {
                response.sendRedirect("/timeFinder/superUser");
            } else {

                userBean = new UserBean();
                userBean = dataManager.getUserData(userName, password);

                session.setAttribute("userBean", userBean);
                session.setAttribute("uid", userBean.getUid());

                response.sendRedirect("/timeFinder/main"); // Unconfigured...
                //Better practice?
                //RequestDispatcher dispatcher = request.getRequestDispatcher( loginURL );
                //dispatcher.forward(request, response);
            }
        } else {
            session.setAttribute("loginErr", loginErr);
            response.sendRedirect("/timeFinder/");
            
            //RequestDispatcher dispatcher = request.getRequestDispatcher("/");
            //dispatcher.forward(request, response);
        }
    }

    //checks for valid login parameters
    public boolean validLogin(String uid, String pwd) {
        boolean isValid = true;
        // check username
        if (!dataManager.checkUid(uid)) {
            //not valid!
            if (!dataManager.checkVerified()) {
                loginErr.put("username", dataManager.getNotVerified());
                loginErr.put("userReturn", "");
            } else {
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
