<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- User: codiibear   Date: 2018/3/19  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
list
<table cellpadding="1" cellspacing="1" border="1">
    <c:forEach items="${customerlist}" var="company" begin="0" step="1" varStatus="index">
        <tr>
            <td>${index.index + 1}</td>
            <td>
                    ${company.username}
            </td>
            <td>
                    ${company.userpassword}
            </td>
            <td>
                <input type="button" value="编辑" class="edit" />
                <input type="button" value="查看详情" />
                <input type="button" value="删除" />
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
