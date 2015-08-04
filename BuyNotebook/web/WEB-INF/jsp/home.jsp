<%-- 
    Document   : home
    Created on : 27.Tem.2010, 10:35:56
    Author     : Administrator
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Avilable Notebooks are Listed Below:</h1>
        <c:forEach items="${notebooks}" var="notebook" >
            <p><c:out value="${notebook.id}" />-<c:out value="${notebook.mark}" />-<c:out value="${notebook.model}" /></p>
        </c:forEach>
    </body>
</html>
