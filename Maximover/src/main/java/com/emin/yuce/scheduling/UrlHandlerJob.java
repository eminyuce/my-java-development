package com.emin.yuce.scheduling;

import org.springframework.beans.factory.annotation.Autowired;

import com.emin.yuce.service.IHttpClientInterface;

public class UrlHandlerJob {

	
	private IHttpClientInterface httpClientInterface;

	public IHttpClientInterface getHttpClientInterface() {
		return httpClientInterface;
	}

	public void setHttpClientInterface(IHttpClientInterface httpClientInterface) {
		this.httpClientInterface = httpClientInterface;
	} 
}
