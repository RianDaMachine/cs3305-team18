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
public class EditRemoveServlet extends HttpServlet {

    private DataManager dataManager = new DataManager();
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
        String remove = request.getParameter("remove");
        String edit = request.getParameter("edit");
        
        String uid = request.getParameter("uid");
        String day = request.getParameter("day");
        String time = request.getParameter("time");
        
        int numDay = Integer.parseInt( day );
        int numTime = Integer.parseInt( time );
        
        if( remove != null  && remove.equals("remove")) {
            //remove
            System.out.println("removing!");
            dataManager.removeEvent( uid , numDay , numTime );
            
        }else {
            //edit
            System.out.println("editing!");
        }
        
        response.sendRedirect("/timeFinder/main");
    }
}
