package com.emin.yuce.service;

import java.util.HashMap;

public interface IHttpClientInterface {
	public HashMap<String, String> getGetResponse();
	public HashMap<String, String> getPostResponse();
	public void setUrl(String url);
	public void setAuthenticationMap(HashMap<String, String> authenticationMap);
}
