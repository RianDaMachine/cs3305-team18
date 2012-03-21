/*
 * Author : lwm1
 * Student Number : 109765255
 */

package classes;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import classes.model.*;
import classes.beans.UserBean;

/*
 * Called when sending FAQ/Help email from main menu
 */
public class Contact {
    private String from = "reg.time.finder@gmail.com";
    private String mailUser = "reg.time.finder";
    private String mailPass = "adminReg99";
    DataManager dataManager = new DataManager();
    PostMail pMail = new PostMail();
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get email from sessionBean
        // get uid from sessionBean
        // get subject , and text from parameters
        
        //send the email
        
        //HttpSession session = request.getSession(true);
        //RequestDispatcher dispatcher = request.getRequestDispatcher("/Contact");
        //dispatcher.forward(request, response);

    }

}
