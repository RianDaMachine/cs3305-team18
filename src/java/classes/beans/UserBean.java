/*
 * Author : Luke Murphy
 */

package classes.beans;

//user session bean information
public class UserBean {

    private String uid;         //Username
    private String password;    //Password    
    private String firstName;   //First Name
    private String lastName;    //Last Name
    private String email;       //Email
    private String userGroup;   //User group

    public UserBean() {
    }

    public void setUid(String valueSupplied) {
        this.uid = valueSupplied;
    }

    public String getUid() {
        return uid;
    }

    public void setPassword(String valueSupplied) {
        this.password = valueSupplied;
    }

    public String getPassword() {
        return password;
    }

    public void setFirstName(String valueSupplied) {
        this.firstName = valueSupplied;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setLastName(String valueSupplied) {
        this.lastName = valueSupplied;
    }

    public String getLastName() {
        return lastName;
    }

    public void setEmail(String valueSupplied) {
        this.email = valueSupplied;
    }

    public String getEmail() {
        return email;
    }

    public void setUserGroup(String valueSupplied) {
        this.userGroup = valueSupplied;
    }

    public String getUserGroup() {
        return userGroup;
    }
}
