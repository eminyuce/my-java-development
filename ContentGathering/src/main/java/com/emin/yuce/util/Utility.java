package com.emin.yuce.util;

import java.util.Collection;
import java.util.Iterator;

/**
 * Created with IntelliJ IDEA.
 * User: Emin
 * Date: 6/23/13
 * Time: 11:23 PM
 * To change this template use File | Settings | File Templates.
 */
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
