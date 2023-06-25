/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaClasses;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMail {
    public static void SendMail(String to_email, String subject, String message){
        String from_email ="f41gammers@gmail.com";
        String email_password ="zushhxmnceekvtav"; //irzswzuczfbhytji
        
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        
        Session session = Session.getInstance(prop, new Authenticator() {
           @Override
           protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(from_email,email_password);
            }
        });
        try {
            
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(from_email));
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);
            Transport.send(mimeMessage);
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
