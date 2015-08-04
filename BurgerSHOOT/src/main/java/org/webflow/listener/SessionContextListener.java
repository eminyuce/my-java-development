package org.webflow.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionContextListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
//		HttpSession session = se.getSession();
//		System.out.println("Session Created!!!!!!!:"+session.getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
//		HttpSession session = se.getSession();
//		System.out.println("Session Destroyed!!!!!!!!!:"+session.getId());
	}

}
