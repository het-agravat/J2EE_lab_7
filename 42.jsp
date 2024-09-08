<!-- 42. Write a JSP program to check whether it is an even or odd number using JSTL. -->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Even or Odd Checker</title>
</head>
<body>
    <h2>Even or Odd Checker</h2>
    <form action="evenOddCheck.jsp" method="get">
        Enter a Number: <input type="number" name="number" required><br><br>
        <input type="submit" value="Check">
    </form>

    <c:choose>
        <c:when test="${param.number != null}">
            <c:set var="number" value="${param.number}" scope="request"/>
            <c:choose>
                
                <c:when test="${number % 2 == 0}">
                    <p>${number} is an even number.</p>
                </c:when>
                <c:otherwise>
                    <p>${number} is an odd number.</p>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <p>Please enter a number to check if it is even or odd.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
