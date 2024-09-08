<!-- 41. Write a JSP program to check whether it is a leap year or not using JSTL. -->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Leap Year Checker</title>
</head>
<body>
    <h2>Leap Year Checker</h2>
    <form action="leapYearCheck.jsp" method="get">
        Enter Year: <input type="number" name="year" required><br><br>
        <input type="submit" value="Check">
    </form>

    <c:choose>
        <c:when test="${param.year != null}">
            <c:set var="year" value="${param.year}" scope="request"/>
            <c:choose>
    
                <c:when test="${(year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)}">
                    <p>${year} is a leap year.</p>
                </c:when>
                <c:otherwise>
                    <p>${year} is not a leap year.</p>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <p>Please enter a year to check if it is a leap year.</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
