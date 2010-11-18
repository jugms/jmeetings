package jmeetings

import javax.mail.*
import javax.mail.internet.*
import javax.mail.Authenticator
import javax.mail.PasswordAuthentication


class JmeetingsMailService {

    static transactional = false

    def config = org.codehaus.groovy.grails.commons.ConfigurationHolder.config
    Session sessionmail
    Transport transport
    int tentativa = 0;

    def connect(){

        if(this.transport != null){
            return
        }

        Properties props = new Properties()
        props.setProperty("mail.transport.protocol", "smtp")
        props.setProperty("mail.smtp.host", config.grails.mail.host)
        props.setProperty("mail.smtp.port", ""+config.grails.mail.port)

        props.setProperty("mail.smtp.auth", "true")
        props.setProperty("mail.mime.charset", "ISO-8859-1")
        props.setProperty ("mail.smtp.starttls.enable", "true")
        props.setProperty ("mail.smtp.socketFactory.port", ""+config.grails.mail.port)
        props.setProperty ("mail.smtp.socketFactory.fallback", "false")
        props.setProperty ("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory")


        this.sessionmail = Session.getInstance(props, null)
        this.transport = sessionmail.getTransport("smtp")
        this.transport.connect(config.grails.mail.host, config.grails.mail.username, config.grails.mail.password)


    }

    def disconnect(){

        if(this.transport == null){
            return
        }

        transport.close()
        transport = null
        sessionmail = null
    }


    def sendMail(String subject, String text, String to){

        connect()

        // Setando as propriedadas da Message
        Message msg = new MimeMessage(sessionmail)
        msg.setHeader("X-Mailer","JMeetings")
        msg.setSentDate(new Date())
        msg.setFrom(new InternetAddress(config.grails.mail.username))
        msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to, false))
        msg.setSubject(subject)
        msg.setText(text)

        // Enviando a mensagem
        try {
            transport.sendMessage(msg, msg.getAllRecipients())
        }
        catch(java.lang.IllegalStateException e)
        {
            if (tentativa < 3)
            {
                tentativa++;
                println("Forçar Fechamento..:"+tentativa)
                transport = null;
                sendMail(subject, text,to)
            }
            else{
                tentativa = 0
                throw e
            }

        }
    }

}
