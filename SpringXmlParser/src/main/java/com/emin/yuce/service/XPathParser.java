package com.emin.yuce.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/***
 * 
 * @author eminy 27-02-2012
 */
public class XPathParser {

	private static final Logger logger = Logger.getLogger(XPathParser.class);

	private String commandOutput;
	private Document dom;
	private String errorMessage;

	public XPathParser(String commandOutput) {
		this.commandOutput = commandOutput;
		this.dom = this.createDocument();
	}

	public boolean validateXmlOutput() {

		XPath xpath = XPathFactory.newInstance().newXPath();
		XPathExpression expr = null;
		NodeList nodes = null;
		try {
			expr = xpath.compile(String.format("//parent::%s", "ResponseBatch/Response"));
			nodes = (NodeList) expr.evaluate(this.dom, XPathConstants.NODESET);
			for (int i = 0; i < nodes.getLength(); i++) {
				Node node = nodes.item(i);
				NamedNodeMap namedNodeMap = node.getAttributes();
				String status = namedNodeMap.getNamedItem("Status").getNodeValue();
				if (status.equals("OKAY")) {
					return true;
				} else if (status.equals("WARNING")) {
					NodeList childNodes = node.getChildNodes();
					for (int j = 0; j < childNodes.getLength(); j++) {
						Node warningNode = childNodes.item(j);
						if (warningNode.getNodeName().equals("Warning")) {
							NamedNodeMap warningNodeMap = warningNode.getAttributes();
							String message = warningNodeMap.getNamedItem("Message").getNodeValue();
							this.errorMessage = message;
						}
					}
					return false;

				}
			}
		} catch (XPathExpressionException e) {
			e.printStackTrace();
		}

		return false;
	}

	public Map<String, String> parseXmlOutput(String xPathExpression, int index) throws XPathExpressionException {
		List<Map<String, String>> list = this.parseXmlOutput(xPathExpression);
		if (list != null && !list.isEmpty()) {
			if (index <= list.size()) {
				return list.get(index);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	public List<Map<String, String>> parseXmlOutput(String xPathExpression) throws XPathExpressionException {

		List<Map<String, String>> resultMap = null;

		if (this.dom != null) {
			resultMap = this.parseDocument(xPathExpression);

			if (resultMap != null && !resultMap.isEmpty()) {
				return resultMap;
			} else {
				logger.error("No result map is created from the command output " + this.commandOutput
						+ " with expression " + xPathExpression);
				return null;
			}
		} else {
			logger.error("No Document instance is created for the command output " + this.commandOutput);
			return null;
		}
	}
	
	public Map<String, List<String>> parseXmlOutput(String xPathExpression, boolean returnMap) throws XPathExpressionException {
		if (this.dom != null) {
			Map<String, List<String>> map = this.parseDocument(xPathExpression, returnMap);

			if (map != null && !map.isEmpty()) {
				return map;
			} else {
				logger.error("No result map is created from the command output " + this.commandOutput
						+ " with expression " + xPathExpression);
				return null;
			}
		} else {
			logger.error("No Document instance is created for the command output " + this.commandOutput);
			return null;
		}
	}

	private Document createDocument() {
		InputStream inputStream = null;

		if (this.commandOutput == null || this.commandOutput.trim().equals("")) {
			logger.error("The command output can not be NULL or EMPTY " + this.commandOutput);
			return null;
		}

		try {
			inputStream = new ByteArrayInputStream(this.commandOutput.trim().getBytes("UTF-8"));
			Document dom = this.parseXmlFile(inputStream);
			return dom;

		} catch (UnsupportedEncodingException e) {
			logger.error("UTF-8 Encoding Exception is occured for the command output " + this.commandOutput, e);
		}
		return null;
	}

	private Document parseXmlFile(InputStream inputStream) {
		// get the factory
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

		try {
			// Using factory get an instance of document builder
			DocumentBuilder db = dbf.newDocumentBuilder();
			// parse using builder to get DOM representation of the XML file
			Document dom = db.parse(inputStream);
			logger.info("A instance of Document class is created");
			return dom;
		} catch (ParserConfigurationException pce) {
			logger.error("ParserConfigurationException is occured for the command output " + this.commandOutput, pce);
		} catch (SAXException se) {
			logger.error("SAXException is occured for the command output " + this.commandOutput, se);
		} catch (IOException ioe) {
			logger.error("IOException is occured for the command output " + this.commandOutput, ioe);
		}
		return null;
	}

	private List<Map<String, String>> parseDocument(String xPathExpression) throws XPathExpressionException {
		// create a list to hold result map of the parameter.
		List<Map<String, String>> resultMap = new ArrayList<Map<String, String>>();
		NodeList nodes = getNodeList(xPathExpression);
		for (int i = 0; i < nodes.getLength(); i++) {
			Node node = nodes.item(i);
			String nodeName = node.getNodeName();
			Node n = node.getFirstChild();
			if (n != null) {
				String nodeValue = node.getChildNodes().item(0).getNodeValue();
				// System.out.println(nodeName + "=" + nodeValue);
				Map<String, String> map = new HashMap<String, String>();
				map.put(nodeName, nodeValue);
				resultMap.add(map);

				logger.info(nodeName + "=" + nodeValue);

			} else {
				Map<String, String> map = new HashMap<String, String>();
				map.put(nodeName, "");
				resultMap.add(map);
				logger.error(nodeName + " has no child node");
			}

		}
		return resultMap;
	}
	
	
	private Map<String, List<String>> parseDocument(String xPathExpression, boolean returnMap) throws XPathExpressionException {
		// create a list to hold result map of the parameter.
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		NodeList nodes = getNodeList(xPathExpression);
		for (int i = 0; i < nodes.getLength(); i++) {
			Node node = nodes.item(i);
			String nodeName = node.getNodeName();
			Node n = node.getFirstChild();
			if (n != null) {
				String nodeValue = node.getChildNodes().item(0).getNodeValue();
				// System.out.println(nodeName + "=" + nodeValue);
				List<String> values = null;
				if (!map.containsKey(nodeName)) {
					values = new ArrayList<String>();
					values.add(nodeValue);
					map.put(nodeName, values);
				} else {
					values = map.get(nodeName);
					values.add(nodeValue);
				}
				
				logger.info(nodeName + "=" + values);

			} else {
				map.put(nodeName, null);
				logger.error(nodeName + " has no child node");
			}

		}
		return map;
	}
	
	
	public NodeList getNodeList(String xPathExpression) {
		XPath xpath = XPathFactory.newInstance().newXPath();
		XPathExpression expr = null;
		NodeList nodes = null;
		try {
			expr = xpath.compile(String.format("//parent::%s", xPathExpression));
			nodes = (NodeList) expr.evaluate(this.dom, XPathConstants.NODESET);
			return nodes;
		} catch (XPathExpressionException e) {
			logger.error("XPathExpressionException is occured for the command output " + this.commandOutput, e);
		}

		return null;
	}
	

	public String getErrorMessage() {
		return errorMessage;
	}

//	public static void main(String[] args) {
//		try {
//
//			// Open the file that is the first
//			// command line parameter
//			FileInputStream fstream = new FileInputStream("ISC.xml");
//			// Get the object of DataInputStream
//			DataInputStream in = new DataInputStream(fstream);
//			BufferedReader br = new BufferedReader(new InputStreamReader(in));
//			String strLine;
//
//			StringBuilder stringBuilder = new StringBuilder();
//
//			// Read File Line By Line
//			while ((strLine = br.readLine()) != null) {
//				strLine = strLine.trim();
//				stringBuilder.append(strLine + "\r\n");
//			}
//
//			// Close the input stream
//			in.close();
//			String commandOutput = stringBuilder.toString();
//
//			XPathParser parser = new XPathParser(commandOutput);
//			Boolean validXml = parser.validateXmlOutput();
//			if (validXml) {
//				List<Map<String, String>> listMap = parser.parseXmlOutput("ResponseBatch/Response/MMASProfileTable/ID");
//				String id = listMap.get(0).get("ID");
//			} else {
//				System.out.println(parser.getErrorMessage());
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
}
