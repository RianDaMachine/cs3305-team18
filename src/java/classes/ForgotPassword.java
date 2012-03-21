/*
 * Author : Luke Murphy
 */

package classes;

import classes.model.PostMail;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.util.logging.*;

import classes.beans.UserBean;
import classes.model.*;



// reset passwords , sends email 
public class ForgotPassword extends HttpServlet {

    private String from = "reg.time.finder@gmail.com";
    private String mailUser = "reg.time.finder";
    private String mailPass = "adminReg99";
    DataManager dataManager = new DataManager();
    PostMail pMail = new PostMail();
    private static final Logger logger = Logger.getLogger(ForgotPassword.class.getName());

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
            System.out.println("Initialize connector string");
            logger.log(Level.SEVERE, "Cannot Connect to DB @ ForgotPassword init method!");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        UserBean bean = dataManager.getDetailsFromEmail(email);
        
        //send mail
        pMail.postMail(this.from, email,
                "TimeFinder Email life saver!",
                "Don't worry , TimeFinder is always here to help ;)\n\n"
                + " Your details are as follows : \n\n"
                + "Your userId : " + bean.getUid() + "\n"
                + "Your NEW password : " + bean.getPassword() + "\n\n"
                + "Please take care to keep these details confidential!\n\n"
                + "You might want to change your password now...",
                mailUser,
                mailPass);
        
        //safe redirect?
        HttpSession session = request.getSession(true);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/resetSuccess");
        dispatcher.forward(request, response);
    }
}
