/*
 * Author : Luke Murphy
 */

package classes;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import java.util.logging.*;

import classes.model.*;

//Insert calendar event for personal schedule
public class SoloScheduleServlet extends HttpServlet {

    private DataManager dataManager = new DataManager();
    private static final Logger logger = Logger.getLogger(SoloScheduleServlet.class.getName());
    //event information
    private String[] info = new String[4];

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
            logger.log(Level.SEVERE, "Cannot Connect to DB @ SoloScheduleServlet init method!");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String duration = request.getParameter("duration");
        String comments = request.getParameter("comments");
        String recurring = request.getParameter("recurring");
        String time = request.getParameter("time");
        String day = request.getParameter("day");
        String uid = request.getParameter("uid");

        // VANILLA - calendar UI does not scroll week/month.
        // STATIC WEEK configured
        int week = 3;

        //*IMPORTANT* - must be sure this is unique
        Random r = new Random();
        String chars = "0123456789101112131415161718192021222324252627282930";
        String muid = dataManager.generateString(r, chars, 9);

        //refactor database types?
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

    //check if slot is occupied and retriev information
    public boolean checkSlot(String uid, int day, int time) {
        boolean isOccupied = false;

        //this method is not called by a form
        //must set parameters here
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");

        // get event information , and store
        info = dataManager.getSlot(uid, day, time);

        // is there an event?
        if (info[0] != null) {
            //an event is in this slot
            isOccupied = true;
        }
        return isOccupied;
    }

    // check if a slot in calendar is occupied without returning data
    public boolean testSlot(String uid, int day, int time) {
        boolean isOccupied = false;

        //this method is not called by a form
        //must set parameters here
        dataManager.setDbURL("jdbc:mysql://localhost/2012_roc1");
        dataManager.setDbUserName("root");
        dataManager.setDbPassword("password");

        String[] test = {"", "", "", ""};
        test = dataManager.getSlot(uid, day, time);

        //quick fix...
        if (test[0] != null) {
            isOccupied = true;
        }

        return isOccupied;
    }

    //return the event information
    public String[] getInfo() {
        return this.info;
    }
}
