<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jp:mondrianQuery id="query01" 
    jdbcDriver="com.mysql.jdbc.Driver" 
    jdbcUrl="jdbc:mysql://localhost/diecastnew?user=root&password=" 
    catalogUri="/WEB-INF/queries/diecast.xml">
    
 SELECT 
    {[Measures].[TotalAmount]} ON COLUMNS,
    {[Customer].[CustomerID].Members} * {[Product].[ProductID].Members, [Product].[ProductName].Members} ON ROWS
FROM [Sales]


</jp:mondrianQuery>

<c:set var="title01" scope="session">die cast</c:set>
