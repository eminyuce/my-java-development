<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h1>${message}</h1>

<c:forEach  items="${mobiles}" var="mobile">
    ${mobile}<br>
</c:forEach>
</body>
</html>
