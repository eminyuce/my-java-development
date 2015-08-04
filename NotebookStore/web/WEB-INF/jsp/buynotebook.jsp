<%-- 
    Document   : buynotebook
    Created on : Aug 3, 2010, 10:55:15 AM
    Author     : habanoz
--%>

<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Buy Notebook</h1>
        <form:form modelAttribute="notebook" >
            <c:out value="${notebook.id}" />
            <c:out value="${notebook.mark}" />
            <c:out value="${notebook.model}" />
            <form:input path="quantity" />

            <input type="submit" value="gonder"/>
        </form:form>
        
    </body>
</html>
