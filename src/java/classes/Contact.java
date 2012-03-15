package classes;

import classes.model.PostMail;
import classes.beans.UserBean;
import classes.model.DataManager;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
