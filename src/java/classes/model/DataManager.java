/*
 * Author : Luke Murphy
 */

package classes.model;

import classes.beans.UserBean;

import java.sql.*;
import java.util.*;
import java.util.logging.*;

//All Database connectivity handled here
public class DataManager {

    //DB strings
    private String dbURL = "";
    private String dbUserName = "";
    private String dbPassword = "";
    //select from 'chars' for random string
    private String chars = "ABCDEFGHIJKLMNOPQRSTUVWYXZ12345678910";
    private static final Logger logger = Logger.getLogger(DataManager.class.getName());
    private static final UserBean isPresentBean = new UserBean();
    private static boolean verified;
    private static String notVerified = "";

    // DATABASE CONNECTION / CONFIGURATION METHODS
    
    public void setDbURL(String dbURL) {
        this.dbURL = dbURL;
    }

    public String getDbURL() {
        return dbURL;
    }

    public void setDbUserName(String dbUserName) {
        this.dbUserName = dbUserName;
    }

    public String getDbUserName() {
        return dbUserName;
    }

    public void setDbPassword(String dbPassword) {
        this.dbPassword = dbPassword;
    }

    public String getDbPassword() {
        return dbPassword;
    }

    public Connection getConnection() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(getDbURL(), getDbUserName(),
                    getDbPassword());
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Connection error @ DataManager.getConnection");
        }
        return conn;
    }

    public void putConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                logger.log(Level.WARNING, "Unable to close DB connection!");
            }
        }
    }
    
     // END
    
    //non verified lecturer error message
    public String getNotVerified() {
        return this.notVerified;
    }

    //lecturer verified - true/false
    public boolean checkVerified() {
        return this.verified;
    }

    //is user already in the DB?
    //return bean with info if present
    public UserBean getIsPresentBean() {
        return this.isPresentBean;
    }

    public int getUserGroupId(String userType) {
        Connection conn = getConnection();
        int groupId = 0;
        if (conn != null) {

            Statement stmt = null;
            ResultSet rs = null;

            try {
                String strQuery = " SELECT groupId "
                        + " FROM usergroup "
                        + " WHERE groupName = '" + userType + "';";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                while (rs.next()) {
                    groupId = rs.getInt("groupId");
                }

            } catch (SQLException ex) {
                logger.log(Level.WARNING, "SQL getUserGroupId error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }
        return groupId;
    }

    public String getUserGroupName(String uid, String userType) {
        String group = "";
        Connection conn = getConnection();
        if (conn != null) {

            Statement stmt = null;
            ResultSet rs = null;

            try {
                String strQuery = " SELECT DISTINCT groupName "
                        + " FROM usergroup , groupmapping "
                        + " WHERE usergroup.groupId IN ("
                        + " SELECT groupmapping.groupId FROM "
                        + " groupmapping WHERE userId = '"
                        + uid + "');";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                while (rs.next()) {
                    group = rs.getString("groupName");
                }

            } catch (SQLException ex) {
                logger.log(Level.WARNING, "SQL getUserGroupName error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }
        return group;
    }

    //MD5 a password String
    //Borrowed from somewhere on StackOverflow
    //lost this URL again..shoot me...
    public String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }

    public void resetPassword(String password, String uid) {
        String md5 = MD5(password);
        Connection conn = getConnection();

        if (conn != null) {

            ResultSet rs = null;
            Statement stmt = null;

            try {
                String strQuery = " UPDATE users "
                        + " SET password = '" + md5 + "'"
                        + " WHERE users.uid = '" + uid + "';";
                stmt = conn.createStatement();
                int row = stmt.executeUpdate(strQuery);

            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                putConnection(conn);
            }
        }
    }

    //Registration details insertion into database
    public void putDetails(UserBean regBean) {
        Connection conn = getConnection();
        Statement stmt = null;

        String encrpytedPwd = this.MD5(regBean.getPassword());
        int userGroupId = getUserGroupId(regBean.getUserGroup());

        if (conn != null) {
            int insertRow;
            int insertGroup;

            try {
                String strQuery = "INSERT INTO users  VALUES ( " + regBean.getUid() + " ,'"
                        + regBean.getFirstName() + "','" + regBean.getLastName()
                        + "','" + regBean.getEmail() + "','" + encrpytedPwd + "');";

                String setGroup = "INSERT INTO groupmapping VALUES( " + regBean.getUid() + " , " + userGroupId + " );";

                stmt = conn.createStatement();
                insertRow = stmt.executeUpdate(strQuery);
                insertGroup = stmt.executeUpdate(setGroup);

                if (regBean.getUserGroup().equals("lecturer")) {
                    // make an entry in the 'yet to be validated table'
                    String strLecturer = " INSERT INTO validlecturer "
                            + " VALUES ( " + regBean.getUid() + " , " + 0 + " );";
                    stmt = conn.createStatement();
                    insertRow = stmt.executeUpdate(strLecturer);
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
                logger.log(Level.WARNING, "SQL putDetails error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }
    }

    public boolean checkPassword(String password) {
        boolean isValid = true;
        Connection conn = getConnection();
        String pwd = MD5(password);
        
        if (conn != null) {

            ResultSet rs = null;
            Statement stmt = null;

            try {
                String strQuery = " SELECT users.password "
                        + " FROM users "
                        + " WHERE users.password = '" + pwd + "'; ";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                if (!rs.next()) {
                    System.out.println("password is INVALID @ DATAMANAGER");
                    isValid = false;
                }

            } catch (SQLException ex) {
                logger.log(Level.WARNING, "SQL checkPassword error!");
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Resultset variable!");
                }
                putConnection(conn);
            }
        }
        return isValid;
    }

    public boolean isLecturerVerified(String uid) {
        boolean isValid = false;
        Connection conn = getConnection();
        if (conn != null) {

            Statement stmt = null;
            ResultSet rs = null;

            try {
                String strQuery = "SELECT valid "
                        + " FROM validlecturer "
                        + " WHERE uid = '" + uid + "';";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                while (rs.next()) {
                    int val = rs.getInt("valid");
                    if (val != 0) {
                        isValid = true;
                    }
                }

            } catch (SQLException ex) {
                logger.log(Level.WARNING, "SQL isLecturerVerified error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }
        return isValid;
    }

    public boolean checkUid(String userName) {
        boolean isValid = true;
        Connection conn = getConnection();
        System.out.println("CHECKING UID HERE");
        if (conn != null) {

            ResultSet rs = null;
            Statement stmt = null;

            try {
                String strQuery = " SELECT users.uid "
                        + " FROM users "
                        + " WHERE users.uid = '" + userName + "'; ";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                if (!rs.next()) {
                    //is not valid
                    System.out.println("uid is INVALID! @ DATAMANAGER");
                    isValid = false;
                } else {
                    // username is valid , but is userGroup = lecturer?
                    if (getUserGroupName(userName, "lecturer").equals("lecturer")) {
                        System.out.println("This should fail!");
                        if (!isLecturerVerified(userName)) {
                            // has not been verified by admin
                            isValid = false;
                            notVerified = "You have not been verified by the system admin";
                            verified = false;
                        }
                    } else if (getUserGroupName(userName, "student").equals("student")) {
                        // is a student
                        System.out.println("Here as EXPECTED");
                        verified = true;
                    } /*
                     * else is the superUser account , must implement this.
                     *
                     */
                }
            } catch (SQLException ex) {
                logger.log(Level.WARNING, "SQL checkUid error!");
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Resultset variable!");
                }
                putConnection(conn);
            }
        }
        return isValid;
    }

    public UserBean getUserData(String userName, String password) {
        UserBean userBean = new UserBean();
        String mdCompare = MD5(password);

        Connection conn = getConnection();

        if (conn != null) {

            ResultSet rs = null;
            Statement stmt = null;

            try {
                String strQuery =
                        " SELECT users.uid, fName, lName, email, password, usergroup.groupName as userGroup "
                        + " FROM users, usergroup "
                        + " WHERE uid = " + userName + " AND password = '" + mdCompare + "'"
                        + " AND groupName IN ( SELECT groupName "
                        + " FROM usergroup "
                        + " WHERE groupId =( SELECT groupId FROM groupmapping WHERE userId = users.uid ) ) ; ";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                System.out.println("Here\n");


                while (rs.next()) {
                    userBean.setUid(rs.getString("uid"));
                    System.out.println("\nNot Here\n");
                    userBean.setFirstName(rs.getString("fName"));
                    userBean.setLastName(rs.getString("lName"));
                    userBean.setEmail(rs.getString("email"));
                    userBean.setUserGroup(rs.getString("usergroup"));
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                putConnection(conn);
            }
        }
        return userBean;
    }

    //get a random string
    //StackOverflow again...lost again...
    public static String generateString(Random rng, String characters, int length) {
        char[] text = new char[length];
        for (int i = 0; i < length; i++) {
            text[i] = characters.charAt(rng.nextInt(characters.length()));
        }
        return new String(text);
    }

    //check if user is already registered
    public boolean alreadyInDb(UserBean regBean) {
        boolean isPresent = false;

        Connection conn = getConnection();
        ResultSet rs = null;

        if (conn != null) {
            Statement stmt = null;

            try {
                String strQuery = "SELECT * FROM users WHERE uid = '" + regBean.getUid() + "';";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                if (rs.next()) {
                    // already registered
                    isPresent = true;
                    //getDetails to enlighten user
                    isPresentBean.setUid(rs.getString("uid"));
                    isPresentBean.setFirstName(rs.getString("fName"));
                    isPresentBean.setLastName(rs.getString("lName"));
                    isPresentBean.setEmail(rs.getString("email"));
                }

            }//end of try
            catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                putConnection(conn);
            }
        }
        return isPresent;
    }

    //when resetting password , all we have is email
    public UserBean getDetailsFromEmail(String email) {
        UserBean bean = new UserBean();
        Connection conn = getConnection();
        Random r = new Random();

        String newPassword = generateString(r, chars, 8);


        System.out.println(newPassword);

        if (conn != null) {

            ResultSet rs = null;
            Statement stmt = null;

            try {
                String strQuery = " SELECT uid "
                        + " FROM users "
                        + " WHERE users.email = '" + email + "';";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                while (rs.next()) {
                    bean.setUid(rs.getString("uid"));
                    resetPassword(newPassword, rs.getString("uid"));
                }
                bean.setPassword(newPassword);
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                putConnection(conn);
            }
        }
        return bean;
    }

    public void insertSoloSchedule(int uid, int muid, String title, int duration, String comments,
            int recurring, int time, int day, int week) {
        Connection conn = getConnection();
        if (conn != null) {
            Statement stmt = null;

            try {
                String strMeetingList = " INSERT INTO meetinglist"
                        + " VALUES (" + uid + " ," + muid + " )";

                stmt = conn.createStatement();
                int one = stmt.executeUpdate(strMeetingList);
                //duration
                for (int i = 0; i < duration; i++) {
                    String strSoloSched = " INSERT INTO schedules(uid , week , day , time , note , title , muid) "
                            + " VALUES (" + uid + " , " + week + " , "
                            + day + " , " + (time + i) + " , ' " + comments + " ' , ' " + title + " ' , " + muid + " )";
                    int two = stmt.executeUpdate(strSoloSched);
                }
            } catch (SQLException ex) {
                logger.log(Level.WARNING, "SQL insertSoloSchedule error!");
            } finally {
                putConnection(conn);
            }
        }
    }

    //get event information for calendar slot
    public String[] getSlot(String uid, int day, int time) {
        String[] info = new String[4];

        Connection conn = getConnection();

        if (conn != null) {
            Statement stmt = null;
            ResultSet rs = null;

            try {
                String strQuery = " SELECT DISTINCT day , time , title , note "
                        + " FROM schedules , meetinglist "
                        + " WHERE meetinglist.uid = " + uid + " AND " + uid + " = schedules.uid"
                        + " AND time = " + time + " AND day = " + day + ";";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(strQuery);

                while (rs.next()) {

                    String dayStr = Integer.toString(rs.getInt("day"));
                    String timeStr = Integer.toString(rs.getInt("time"));

                    info[0] = rs.getString("title");
                    info[1] = rs.getString("note");
                    info[2] = dayStr;
                    info[3] = timeStr;
                }

            } catch (SQLException ex) {
                logger.log(Level.WARNING, "SQL getSlot error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }

        return info;
    }

    public void removeEvent(String uid, int day, int time) {
        Connection conn = getConnection();

        if (conn != null) {
            Statement stmt = null;
            ResultSet rs = null;
            String muid = "";

            try {

                String getMuid = " SELECT muid "
                        + " FROM schedules "
                        + " WHERE schedules.day = " + day + " AND schedules.time = " + time + ";";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(getMuid);

                while (rs.next()) {
                    muid = rs.getString("muid");
                }

                System.out.println("MUID : " + muid);

                String meetListRemove = " DELETE FROM meetinglist "
                        + " WHERE meetinglist.muid = " + muid + ";";
                String schedRemove = " DELETE FROM schedules "
                        + " WHERE schedules.muid = " + muid + ";";

                int rowOne = stmt.executeUpdate(meetListRemove);
                int rowTwo = stmt.executeUpdate(schedRemove);

            } catch (SQLException ex) {
                ex.printStackTrace();
                logger.log(Level.WARNING, "SQL removeEvent error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }
    }

    public ArrayList<String> getNonVerifiedLecturers() {
        Connection conn = getConnection();
        ArrayList<String> lecturers = new ArrayList<String>();

        if (conn != null) {
            Statement stmt = null;
            ResultSet rs = null;

            try {

                String getLect = " SELECT users.uid , fname , lname , email "
                        + " FROM users , validlecturer "
                        + " WHERE users.uid = validlecturer.uid AND valid = 0 ; ";

                stmt = conn.createStatement();
                rs = stmt.executeQuery(getLect);

                while (rs.next()) {
                    int uid = rs.getInt("uid");
                    String strUid = Integer.toString(uid);

                    String info = strUid + " , " + rs.getString("fname") + " , "
                            + rs.getString("lname") + " , " + rs.getString("email");
                    lecturers.add(info);
                }

            } catch (SQLException ex) {
                ex.printStackTrace();
                logger.log(Level.WARNING, "SQL getNonVerifiedLecturers error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }
        return lecturers;
    }

    public void validateLecturer(int uid) {
        Connection conn = getConnection();

        if (conn != null) {
            Statement stmt = null;
            ResultSet rs = null;

            try {

                String valLect = " UPDATE validlecturer "
                        + " SET valid = 1 "
                        + " WHERE uid = " + uid + " ; ";

                stmt = conn.createStatement();
                int row = stmt.executeUpdate(valLect);

            } catch (SQLException ex) {
                ex.printStackTrace();
                logger.log(Level.WARNING, "SQL validateLecturer error!");
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    logger.log(Level.WARNING, "Could not close the Statement variable!");
                }
                putConnection(conn);
            }
        }
    }
}
