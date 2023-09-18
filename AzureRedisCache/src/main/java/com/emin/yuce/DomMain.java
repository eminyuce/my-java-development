package com.emin.yuce;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URL;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class DomMain {

    public static void main(String[] args) {

        SAXBuilder builder = new SAXBuilder();
        URL uri = DomMain.class.getResource("/xml/domFile.xml");

        Resource resource = new ClassPathResource("/xml/domFile.xml");
        try {
            System.out.println(resource.getURL().getPath());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        File xmlFile = new File(uri.getPath());

        try {

            Document document = (Document) builder.build(xmlFile);
            Element rootNode = document.getRootElement();
            List list = rootNode.getChildren("staff");

            for (int i = 0; i < list.size(); i++) {

                Element node = (Element) list.get(i);

                System.out.println("First Name : "
                        + node.getChildText("firstname"));
                System.out.println("Last Name : "
                        + node.getChildText("lastname"));
                System.out.println("Nick Name : "
                        + node.getChildText("nickname"));
                System.out.println("Salary : " + node.getChildText("salary"));

            }

        } catch (IOException io) {
            System.out.println(io.getMessage());
        } catch (JDOMException jdomex) {
            System.out.println(jdomex.getMessage());
        }
    }

}
