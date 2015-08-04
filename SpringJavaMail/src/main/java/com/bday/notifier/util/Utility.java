package com.bday.notifier.util;

import java.util.Collection;
import java.util.Iterator;

 

public class Utility {

	   public static String join(Collection<String> col, String delim) {
	        StringBuilder sb = new StringBuilder();
	        Iterator<String> iter = col.iterator();
	        if (iter.hasNext())
	            sb.append(iter.next().toString());
	        while (iter.hasNext()) {
	            sb.append(delim);
	            sb.append(iter.next().toString());
	        }
	        return sb.toString();
	    }

}
