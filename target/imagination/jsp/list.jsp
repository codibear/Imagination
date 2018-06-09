<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- User: codiibear   Date: 2018/3/13  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.conteztPath}/js/jquery.min.js"/>
    <script type="text/javascript">

    </script>
</head>
<body>
this is list
<table cellpadding="1" cellspacing="1" border="1">
    <c:forEach items="${testeds}" var="testeds" begin="0" step="1" varStatus="index">
        <tr>
            <td>${index.index+1}</td>
            <td>${testeds.somename}</td>
            <td>${testeds.somepwd}</td>
            <td><fmt:formatDate value="${testeds.somedate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
