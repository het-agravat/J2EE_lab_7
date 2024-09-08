<!-- 40. Write a JSP program that calculates addition, subtraction, multiplication and division using expression language. -->

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
    <h2>Simple Calculator</h2>
    <form action="calculator.jsp" method="get">
        Enter First Number: <input type="number" name="num1" step="any" required><br>
        Enter Second Number: <input type="number" name="num2" step="any" required><br><br>
        <input type="submit" value="Calculate">
    </form>

    <%
        // Retrieving the input values from the form
        String num1Str = request.getParameter("num1");
        String num2Str = request.getParameter("num2");

       
        double num1 = (num1Str != null && !num1Str.isEmpty()) ? Double.parseDouble(num1Str) : 0;
        double num2 = (num2Str != null && !num2Str.isEmpty()) ? Double.parseDouble(num2Str) : 0;
    %>

    <%
        // Check if both numbers are entered
        if (num1Str != null && num2Str != null) {
    %>
        <h3>Results:</h3>
        <p>Addition: ${num1 + num2}</p>
        <p>Subtraction: ${num1 - num2}</p>
        <p>Multiplication: ${num1 * num2}</p>
        <p>
            Division: 
            <%
                // Handling division by zero scenario
                if (num2 == 0) {
                    out.print("Cannot divide by zero");
                } else {
            %>
                    ${num1 / num2}
            <%
                }
            %>
        </p>
    <%
        }
    %>
</body>
</html>
