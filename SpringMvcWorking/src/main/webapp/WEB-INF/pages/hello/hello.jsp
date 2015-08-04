<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<body>
	<h1>${message}</h1>

    <h2>Students</h2>
    <c:forEach items="${students}" var="item">
        ${item}<br>
    </c:forEach>

<h2>Mobiles</h2>
    <c:forEach  items="${mobiles}" var="mobile">
        ${mobile}<br>
    </c:forEach>
</body>
</html>