package classes;

import classes.beans.UserBean;
import java.sql.*;
import classes.model.DataManager;
import java.io.IOException;
import java.util.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SuperUserServlet extends HttpServlet {

    private DataManager dataManager = new DataManager();
    private ArrayList<String> info = new ArrayList<String>();

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // Will have to use web.xml to define these when we deploy .WAR
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception ex) {
            System.out.println("Initialize connector string");
            ex.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String info = request.getParameter("info");

        String str = info;
        //get uid from string
        String[] tokens = str.split(",");
        // remove whitespaces
        String strUid = tokens[0].replaceAll("\\s","");
        
        int uid = Integer.parseInt( strUid );
        
        System.out.println("ITS AN INT ; " + uid);
        
        dataManager.validateLecturer( uid );
        
        response.sendRedirect("/timeFinder/superUser");

    }

    public ArrayList<String> queryLecturers() {
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");

        info = dataManager.getNonVerifiedLecturers();

        for (String str : info) {
            System.out.println(str);
        }

        return info;

    }
}
