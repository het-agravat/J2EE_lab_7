<!-- 43. Write a JSP program to print prime numbers from 1 to 100 using JSTL. -->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Prime Numbers from 1 to 100</title>
</head>
<body>
    <h2>Prime Numbers from 1 to 100</h2>

    <ul>
      
        <c:forEach var="num" begin="2" end="100">
            
            <c:set var="isPrime" value="true"/>
           
            <c:forEach var="i" begin="2" end="${num - 1}">
                <c:if test="${num % i == 0}">
                    <c:set var="isPrime" value="false"/>
                   
                    <c:break/>
                </c:if>
            </c:forEach>
            
            
            <c:if test="${isPrime}">
                <li>${num}</li>
            </c:if>
        </c:forEach>
    </ul>
</body>
</html>
