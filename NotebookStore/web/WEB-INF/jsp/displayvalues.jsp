<%-- 
    Document   : displayvalues
    Created on : Aug 4, 2010, 10:13:21 AM
    Author     : habanoz
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Naber Len</h1>
        <p>Notebook ID: <c:out value="${notebook.id}" /></p>
        <p>Notebook Brand: <c:out value="${notebook.mark}" /></p>
        <p>Notebook Model: <c:out value="${notebook.model}" /></p>
        <p>Notebook Quantity: <c:out value="${notebook.quantity}" /></p>
         <p>Notebook String: <c:out value="${notebook.string}" /></p>
         <br />
         <a href="listnb.htm" >Go to List Page</a>
    </body>
</html>
