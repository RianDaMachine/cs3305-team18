/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import classes.model.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author liamt
 */
public class SoloScheduleServlet extends HttpServlet {

    private DataManager dataManager = new DataManager();
    private String[] info = new String[4];
    private static final Logger logger = Logger.getLogger(SoloScheduleServlet.class.getName());

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dataManager = new DataManager();

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

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String duration = request.getParameter("duration");
        String comments = request.getParameter("comments");
        String recurring = request.getParameter("recurring");
        String time = request.getParameter("time");
        String day = request.getParameter("day");
        String uid = request.getParameter("uid");

        // vanilla version
        int week = 3;

        // dont forget to check DB for duplicates!
        Random r = new Random();
        String chars = "0123456789101112131415161718192021222324252627282930";
        String muid = dataManager.generateString(r, chars, 9);

        int numDuration = Integer.parseInt(duration);
        int numRecurring = Integer.parseInt(recurring);
        int numTime = Integer.parseInt(time);
        int numDay = Integer.parseInt(day);
        int numMuid = Integer.parseInt(muid);
        int numUid = Integer.parseInt(uid);

        dataManager.insertSoloSchedule(numUid, numMuid, title, numDuration, comments,
                numRecurring, numTime, numDay, week);

        response.sendRedirect("/timeFinder/main");
    }

    public boolean checkSlot(String uid, int day, int time) {
        boolean isOccupied = false;
        
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");

        System.out.println("HERE IS : " + uid +  " , "  + day + " , " + time);
        
        info = dataManager.getSlot(uid, day, time);
        
        if(  info[0] != null ) {
            isOccupied = true;
        }
        return isOccupied;
    }
    
    public boolean testSlot(String uid, int day, int time) {
        boolean isOccupied = false;
       
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");
        
        String[] test = {"","","",""}; 
        test =  dataManager.getSlot(uid, day, time);
        
        if(  test[0] != null ) {
            isOccupied = true;
        }
        
        return isOccupied;
    }

    public String[] getInfo() {
        return this.info;
    }
}
