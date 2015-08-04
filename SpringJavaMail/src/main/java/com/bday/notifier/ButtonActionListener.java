package com.bday.notifier;

import com.bday.notifier.pojos.Email;
import com.bday.notifier.regex.EmailValidator;
import com.bday.notifier.service.EmailService;
import com.bday.notifier.service.impl.HttpClientImpl;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.context.ApplicationContext;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * Created by EMINYUCE on 12/22/13.
 */
public class ButtonActionListener implements ActionListener {

    private static final Logger logger = Logger
            .getLogger(ButtonActionListener.class);
    private ApplicationContext context;
    private JMailMachineForm frame;

    public ButtonActionListener(ApplicationContext context, JMailMachineForm frame) {
        this.context = context;
        this.frame = frame;
    }


    @Override
    public void actionPerformed(ActionEvent e) {
        EmailService emailService = context.getBean(EmailService.class);
        if (e.getSource() == frame.buttonSendMails) {
            if (frame.fileToBeSent != null) {

                List list =  frame.listBoxEmails.getSelectedValuesList();

                for (int i = 0; i < list.size(); i++) {
                    String email =  (String)list.get(i);

                    Email mail = new Email();
                    mail.setTo(email);
                    mail.setFrom("newyorktayurdumuz@gmail.com");
                    mail.setSubject("Amity Öğrenci Yurdu");
                    try {
                        mail.setText(readUsingApacheCommonsIO(frame.fileToBeSent));
                        emailService.sendEmail(mail);
                        logger.info("Email is sent to "+email);
                        Thread.sleep(1000);
                        System.out.println("Email is sent to "+email);
                        String textAreaLinks = frame.textAreaPageLinks.getText();
                        String text = textAreaLinks+"\nEmail is sent to "+email;
                        frame.textAreaPageLinks.setText(text);
                    } catch (IOException ex) {
                        logger.error(ex);
                        logger.error("Email could be sent to " + email);
                    } catch (Exception ex) {
                        logger.error(ex);
                        logger.error("Email could be sent to " + email);
                    }

                }

            }else{
                logger.error("Select a file to send it.");
            }

        } else if (e.getSource() == frame.buttonFileChooser) {
            int x = frame.jFileChooser.showOpenDialog(null);
            if (x == JFileChooser.APPROVE_OPTION) {
                frame.fileToBeSent = frame.jFileChooser.getSelectedFile();
            }
        } else if (e.getSource() == frame.buttonRetrieveEmails) {

            javax.swing.SwingUtilities.invokeLater(new Runnable() {

                public void run() {



            HttpClientImpl httpClientImpl = context.getBean(HttpClientImpl.class);

            //LoadFromFile v = context.getBean(LoadFromFile.class);
            EmailValidator emailValidator = context.getBean(EmailValidator.class);
            String pageLinks = frame.textAreaPageLinks.getText().trim();
            List<String> vLinks = new ArrayList<String>(Arrays.asList(pageLinks.split(";")));;
            List<String> uniqueEmails = new ArrayList<String>();
            for (String siteUrl : vLinks) {
                logger.info("site url = " + siteUrl);
                httpClientImpl.setUrl(siteUrl);
                HashMap<String, String> response = httpClientImpl.getGetResponse();
                String text1 = response.get("html");


                Document doc;
                try {

                    // need http protocol
                    doc = Jsoup.parse(text1);

                    // get all links
                    Elements links = doc.select("a[href]");
                    for (Element link : links) {
                        String mailTo = link.attr("href");
                        if (mailTo.contains("mailto:")) {
                            String email = mailTo.replace("mailto:", "");
                            if (emailValidator.validate(email)) {
                                logger.info("Link found: " + email);
                                System.out.println("Link found: " + email);
                                if (!uniqueEmails.contains(email)) {
                                    uniqueEmails.add(email);
                                }
                            }
                        }
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            frame.listBoxEmails.setListData(uniqueEmails.toArray());

                }

            });

        }
    }

    private String readUsingApacheCommonsIO(File file) throws IOException {
        return FileUtils.readFileToString(file, "windows-1254");
    }
}
