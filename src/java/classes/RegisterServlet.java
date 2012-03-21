/*
 * Author : lwm1
 * Student Number : 109765255
 */

package classes;

import classes.model.PostMail;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.logging.*;

import classes.beans.UserBean;
import classes.model.*;


//responsible for processing registrations
public class RegisterServlet extends HttpServlet {

    // DB strings
    private String dbResult = null;
    private String myException = null;
    private String strError = null;
    // class instances
    UserBean regBean;
    private DataManager dataManager;
    private Validation val = new Validation();
    private PostMail pMail = new PostMail();
    //if user is present/correct user in database
    boolean isValid;
    boolean isPresent;
    //email information
    private String from = "reg.time.finder@gmail.com";
    private String admin = "superUser.timefinder@gmail.com";
    private String mailUser = "reg.time.finder";
    private String mailPass = "adminReg99";
    
    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());

    @Override
    //Initialise servlet parameters for connecting to DataManager class
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dataManager = new DataManager();

        // Better to get Strings from XML config
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "Cannot Connect to DB @ RegisterServlet init method!");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("username");
        String fName = request.getParameter("firstname");
        String lName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("usertype");

        regBean = new UserBean();
        regBean.setUserGroup(userType);

        // validate the parameters
        isValid = val.validate(regBean, uid, password, fName, lName, email, userType);

        //if valid  
        if (isValid) {
            //check that the user is not already in the DB
            isPresent = dataManager.alreadyInDb(regBean);

            if (!isPresent) {

                if (userType.equals("student")) {
                    //student
                    dataManager.putDetails(regBean);
                    //redirect to success page
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/success");
                    //send success email
                    pMail.postMail(this.from, regBean.getEmail(),
                            "TimeFinder Registration Confirmation",
                            "Thank you for registering with TimeFinder!\n\n"
                            + " Your details are as follows : \n\n"
                            + "Your userId : " + regBean.getUid() + "\n"
                            + "Your password : " + regBean.getPassword() + "\n\n"
                            + "Please take care to keep these details confidential!",
                            mailUser,
                            mailPass);
                    dispatcher.forward(request, response);
                } else {
                    //lecturer
                    // insert details , not validated yet though
                    dataManager.putDetails(regBean);
                    // send confirmation email
                    pMail.postMail(this.from, admin,
                            "TimeFinder Lecturer Verification Necessary!",
                            "There is a lecturer verification pending.\n\n"
                            + " The details are as follows : \n\n"
                            + "User Id : " + regBean.getUid() + "\n"
                            + "First Name : " + regBean.getFirstName() + "\n"
                            + "Last Name : " + regBean.getLastName() + "\n"
                            + "Email : " + regBean.getEmail() + "\n\n"
                            + "Please login and administer this account.",
                            mailUser,
                            mailPass);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("/lecturerWait");
                    dispatcher.forward(request, response);
                }

            } else {
                //the user has already registered , redirect   
                HttpSession session = request.getSession(true);
                session.setAttribute("regBean", regBean);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/alreadyReg");
                dispatcher.forward(request, response);
            }
        } else {
            //not valid , send back parameters
            Hashtable errors = val.getvalidationErr();

            HttpSession session = request.getSession(true);
            session.setAttribute("errors", errors);
            session.setAttribute("regBean", regBean);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/retry");
            dispatcher.forward(request, response);
        }
    }
}
