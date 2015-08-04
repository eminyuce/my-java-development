package com.bday.notifier.util;

/**
 * @author nyadav
 * 
 */

import com.bday.notifier.pojos.User;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

public final class LoadFromProperty {
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

    

	public List<User> getAllNotifiableUsers() {
		List<User> listOfUsers = new ArrayList();
		try {
			Resource resource = new ClassPathResource("/bDayList.properties");
			Properties props = PropertiesLoaderUtils.loadProperties(resource);
			for (String key : props.stringPropertyNames()) {
				String name = key.replace("_", " ");
				String value = props.getProperty(key);
				String[] sArray = value.split(",");
				Date bdate = dateFormat.parse((value.split(",")[0]));
				String email = value.split(",")[1];
				User user = new User(name, email, bdate);
				listOfUsers.add(user);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return listOfUsers;
	}
}
