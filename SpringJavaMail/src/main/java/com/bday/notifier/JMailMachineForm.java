package com.bday.notifier;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.swing.*;
import java.io.File;

/**
 * Created by EMINYUCE on 12/21/13.
 */
public class JMailMachineForm {
    public JPanel JPanelMain;
    public JPanel BottomPanel;
    public JButton buttonRetrieveEmails;
    public JButton buttonSendMails;
    public JButton buttonFileChooser;
    public JList listBoxEmails;
    private JPanel Tab1;
    private JPanel Tab2;
    private JTabbedPane JMailnTabbedPane;
    public JTextArea textAreaPageLinks;
    public File fileToBeSent;
    public JFileChooser jFileChooser;

    public JMailMachineForm(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        jFileChooser = new JFileChooser();
        buttonRetrieveEmails.addActionListener(new ButtonActionListener(context, this));
        buttonSendMails.addActionListener(new ButtonActionListener(context, this));
        buttonFileChooser.addActionListener(new ButtonActionListener(context, this));


    }




    public static void main(String[] args) {
        JFrame frame = new JFrame("JMailMachineForm");
        frame.setContentPane(new JMailMachineForm().JMailnTabbedPane);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }


}
