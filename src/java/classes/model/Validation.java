/*
 * Author : lwm1
 * Student Number : 109765255
 */

package classes.model;

import classes.beans.UserBean;
import java.util.Hashtable;

//registration validation
public class Validation {

    private Hashtable validationErr = new Hashtable();
    
    //email validation - 
    //borrowed from somewhere deep in StackOverflow , link lost in the cosmos
    public static final String EMAIL_REGEX =
            "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

    //Retrieve registration validationErr Hashtable
    public Hashtable getvalidationErr() {
        return this.validationErr;
    }

    //Validate parameters for registration
    public boolean validate(UserBean regBean, String uid, String password, String fName, String lName, String email, String userType) {
        boolean validReg = true;

        if (uid.length() == 9) {
            regBean.setUid(uid);
            validationErr.put("uid", "");
        } else {
            System.out.println("A");
            validationErr.put("uid", "**Invalid User ID - Your ID must be 9 characters long");
            validReg = false;
        }

        if (password.length() > 2 && password.length() < 10) {
            regBean.setPassword(password);
            validationErr.put("password", "");
        } else {
            System.out.println("B");
            validationErr.put("password", "**Invalid password -  must be less than 10 characters");
            validReg = false;
        }

        if (fName.length() > 2 && fName.length() < 10) {
            regBean.setFirstName(fName);
            validationErr.put("fname", "");
        } else {
            System.out.println("C");
            validationErr.put("fname", "**Invalid First Name - must be less than 10 characters");
            validReg = false;
        }

        if (lName.length() > 2 && lName.length() < 15) {
            regBean.setLastName(lName);
            validationErr.put("lname", "");
        } else {
            System.out.println("D");
            validationErr.put("lname", "**Invalid Last Name - must be less than 10 characters");
            validReg = false;
        }

        if (email.matches(EMAIL_REGEX)) {
            regBean.setEmail(email);
            validationErr.put("email", "");
        } else {
            System.out.println("E");
            validationErr.put("email", "**Invalid email Address - must be valid");
            validReg = false;
        }
        return validReg;
    }
}
