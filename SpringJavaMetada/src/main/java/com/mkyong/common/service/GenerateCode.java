package com.mkyong.common.service;

import com.mkyong.customer.model.TableMetaData;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

/**
 * Created with IntelliJ IDEA.
 * User: Emin
 * Date: 12/25/12
 * Time: 8:49 PM
 * To change this template use File | Settings | File Templates.
 */

public interface GenerateCode {
    public void generateScript();
}
