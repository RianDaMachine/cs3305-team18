/*
 * Author : lwm1
 * Student Number : 109765255
 */
package classes;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import java.util.logging.*;

import classes.model.*;

//provides edit / remove functionality
public class EditRemoveServlet extends HttpServlet {

    private DataManager dataManager = new DataManager();
    private static final Logger logger = Logger.getLogger(EditRemoveServlet.class.getName());

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
            logger.log(Level.SEVERE, "Cannot Connect to DB @ LoginServlet init method!");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String remove = request.getParameter("remove");
        String edit = request.getParameter("edit");

        String uid = request.getParameter("uid");
        String day = request.getParameter("day");
        String time = request.getParameter("time");

        int numDay = Integer.parseInt(day);
        int numTime = Integer.parseInt(time);

        if (remove != null && remove.equals("remove")) {
            //remove
            dataManager.removeEvent(uid, numDay, numTime);

        } else {
            //edit
            //* must implement * 
        }

        //is this good practice?
        response.sendRedirect("/timeFinder/main");
    }
}
