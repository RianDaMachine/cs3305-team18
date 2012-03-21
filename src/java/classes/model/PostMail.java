/*
 * Author : Luke Murphy
 */

package classes.model;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

//responsible for sending emails
public class PostMail {
    
    //Credit to the Mkyong Enterprise website for this one
    //http://www.mkyong.com/java/javamail-api-sending-email-via-gmail-smtp-example/
    public void postMail(String from, String to, String subject, String text, String uName , String pwd) {
        
        Properties props = new Properties();
        
        final String user = uName;
        final String pass = pwd;
        
        //config details for mail
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        //password auth necessary to use smtp.gmail
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    final String u = user;
                    final String p = pass;
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(u,p);
                    }
                });
        try {
            //setup
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);

            //send it
            Transport.send(message);

        } catch (MessagingException e) {
            //horror
            throw new RuntimeException(e);
        }
    }
}
