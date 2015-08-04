<%--
    Document   : home
    Created on : Jul 28, 2010, 4:17:19 PM
    Author     : Administrator
--%>

<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Notebook</title>
    </head>
    <body>
        <h1>Available Products Are:</h1>
        <c:forEach items="${notebooks}" var="notebook" >
            <p><c:out value="${notebook.id}" /> - <c:out value="${notebook.mark}" /> - <c:out value="${notebook.model}" /> - <c:out value="${notebook.quantity}" />  String <c:out value="${notebook.string}" /> <a href="buynotebook.htm?model=<c:out value="${notebook.model}" />">Buy</a>
            </c:forEach>
    </body>
</html>
