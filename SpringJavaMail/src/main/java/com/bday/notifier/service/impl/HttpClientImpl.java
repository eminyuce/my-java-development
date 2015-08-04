package com.bday.notifier.service.impl;


import com.bday.notifier.service.IHttpClientInterface;
import com.bday.notifier.util.Utility;
import net.sf.corn.httpclient.HttpForm;
import net.sf.corn.httpclient.HttpResponse;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class HttpClientImpl implements IHttpClientInterface {


    private static final Logger logger = Logger
            .getLogger(HttpClientImpl.class);

    private String url;
    private HashMap<String, String> authenticationMap;
    private HttpForm client;

    public HttpClientImpl() {


    }

    private void createHttpClient() {
        URI gURI = null;
        try {
            gURI = new URI(this.url);
            this.client = new HttpForm(gURI);

            if (authenticationMap != null) {
                Iterator<String> iter = authenticationMap.keySet().iterator();

                while (iter.hasNext()) {
                    String key = (String) iter.next();
                    String val = (String) authenticationMap.get(key);
                    this.client.putFieldValue(key, val);
                }
            }
        } catch (URISyntaxException e) {
            logger.error("HttpClientImpl-URISyntaxException", e);
        } catch (Exception e) {
            logger.error("HttpClientImpl", e);
        }
    }

    public HashMap<String, String> getGetResponse() {

        HashMap<String, String> getResponseMap = new HashMap<String, String>();
        HttpResponse response;
        try {
            createHttpClient();
            response = this.client.doGet();
            return getResponseMap(response);
        } catch (IOException e) {
            logger.error("HttpClientImpl-doGet", e);
        }
        return getResponseMap;

    }

    private HashMap<String, String> getResponseMap(HttpResponse response) {
        HashMap<String, String> getResponseMap = new HashMap<String, String>();
        if (response.hasError()) {
            logger.error(response.getData() + ":"
                    + response.getMessage());

        }
        getResponseMap.put("html", response.getData());

        Map<String, List<String>> headerMap = response.getHeaderFields();
        Iterator<String> iter = headerMap.keySet().iterator();

        while (iter.hasNext()) {
            String key = (String) iter.next();
            List<String> val = (List<String>) headerMap.get(key);
            getResponseMap.put(key, Utility.join(val,","));
        }
        return getResponseMap;

    }

    @Override
    public HashMap<String, String> getPostResponse() {
        HashMap<String, String> getResponseMap = new HashMap<String, String>();
        HttpResponse response;
        try {
            createHttpClient();
            response = this.client.doPost();
            return getResponseMap(response);
        } catch (IOException e) {
            logger.error("HttpClientImpl-doGet", e);
        }
        return getResponseMap;
    }


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url.trim();
    }

    public HashMap<String, String> getAuthenticationMap() {
        return authenticationMap;
    }

    public void setAuthenticationMap(HashMap<String, String> authenticationMap) {
        this.authenticationMap = authenticationMap;
    }


}
