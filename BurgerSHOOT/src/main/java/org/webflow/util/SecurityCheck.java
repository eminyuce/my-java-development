package org.webflow.util;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.security.Authentication;
import org.springframework.security.GrantedAuthority;
import org.springframework.security.context.SecurityContextHolder;
import org.springframework.security.userdetails.User;
import org.springframework.stereotype.Component;

@Component("securityBean")
@Scope("session")
public class SecurityCheck implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public boolean hasRole(String... role) {
		for (int i = 0; i < role.length; i++) {
			String roles = role[i];
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			GrantedAuthority[] authorities = auth.getAuthorities();
			//System.out.println("role:"+roles.toString());
			for (int j = 0; j < authorities.length; j++) {
				GrantedAuthority grantedAuthority = authorities[j];
				//System.out.println("auth:" + grantedAuthority.getAuthority());
				if (grantedAuthority.getAuthority().equals(roles))
					return true;
			}
		}

		return false;
	}

	public boolean hasnotRole(String ... role) {
		for (int i = 0; i < role.length; i++) {
			String roles = role[i];
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			GrantedAuthority[] authorities = auth.getAuthorities();
			//System.out.println(roles);
			for (int j = 0; j < authorities.length; j++) {
				GrantedAuthority grantedAuthority = authorities[j];
				//System.out.println("auth:" + grantedAuthority.getAuthority());
				if (grantedAuthority.getAuthority().equals(roles))
					return false;
			}
		}
		return true;
	}
	
	public String getUsername(){
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//System.out.println("username:"+user.getUsername());
		return user.getUsername();
	}
	
}
