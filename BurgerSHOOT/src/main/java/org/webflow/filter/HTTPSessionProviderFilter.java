package org.webflow.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class HTTPSessionProviderFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
//		HttpServletRequest httpRequest = (HttpServletRequest) request;
//		
//		
//		HttpSession session= httpRequest.getSession(false);
//		
//		if(session==null){
//			if(!request.isSecure()){
//				HttpSession s = httpRequest.getSession();
//			}
//			else
//			{
//				HttpServletResponse httpResponse = (HttpServletResponse) response;
//				httpResponse.sendRedirect(httpResponse.encodeRedirectURL(httpRequest.getContextPath()+"/spring/intro"));
//			}
//		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}
