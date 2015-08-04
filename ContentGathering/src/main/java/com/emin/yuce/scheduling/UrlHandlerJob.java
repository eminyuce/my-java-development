package com.emin.yuce.scheduling;

import com.emin.yuce.service.IHttpClientInterface;
import com.emin.yuce.service.impl.HtmlDiffCompare;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;

public class UrlHandlerJob {
	
	
	private static final Logger logger = Logger
			.getLogger(UrlHandlerJob.class);
	
	private IHttpClientInterface httpClient;
	
	public void downloadUrlAndSave(){
		
		this.httpClient.setUrl("http://www.haberturk.com/");
		HashMap<String, String>  response = this.httpClient.getPostResponse();
		logger.info("1 Downloading!!! "+response.size());
        String text1 =  response.get("html");

        this.httpClient.setUrl("http://www.zaman.com/");
        HashMap<String, String>  response2 = this.httpClient.getPostResponse();
        logger.info("2 Downloading!!! "+response.size());
        String text2 =  response.get("html");



        String [] arg={"http://www.zaman.com/","http://www.haberturk.com/"};
        try{
            HtmlDiffCompare.compare(arg);

            FileInputStream fisTargetFile = new FileInputStream(new File("daisydiff.htm"));
            String targetFileStr = IOUtils.toString(fisTargetFile, "UTF-8");
            Document doc =  Jsoup.parse(targetFileStr);
            Elements elements =  doc.getElementsByClass("diff-html-removed");

            logger.info("DONE........ ");
        }  catch (Exception e){
            logger.error("", e);
        }




        //DaisyDiff.diffTag(text1,text2);

    }

 

	public void setHttpClient(IHttpClientInterface httpClient) {
		this.httpClient = httpClient;
	}

}
