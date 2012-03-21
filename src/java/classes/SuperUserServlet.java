/*
 * Author : lwm1
 * Student Number : 109765255
 */
package classes;

import java.sql.*;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import classes.model.DataManager;
import classes.beans.UserBean;
import java.util.logging.Level;
import java.util.logging.Logger;

//admin function servlet
public class SuperUserServlet extends HttpServlet {

    private DataManager dataManager = new DataManager();
    private ArrayList<String> info = new ArrayList<String>();
    private static final Logger logger = Logger.getLogger(SuperUserServlet.class.getName());

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
            logger.log(Level.SEVERE, "Cannot Connect to DB @ SuperUserServlet init method!");
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String info = request.getParameter("info");

        String str = info;
        //get uid from string
        String[] tokens = str.split(",");
        // remove whitespaces
        String strUid = tokens[0].replaceAll("\\s", "");

        int uid = Integer.parseInt(strUid);
        dataManager.validateLecturer(uid);
        response.sendRedirect("/timeFinder/superUser");
    }

    // get lecturers waiting for verification
    public ArrayList<String> queryLecturers() {
        //this method is not called by a form
        //must set parameters here
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");

        info = dataManager.getNonVerifiedLecturers();
        return info;
    }
}
