<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Requests" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.groupnine.travelbuddy.Co_Traveller.Co_Traveller_Info" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 5/23/2023
  Time: 2:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/co-traveller-retrieve-user-request"/>

<%ArrayList<Co_Traveller_Requests> coTravellerUserRequests = (ArrayList<Co_Traveller_Requests>) request.getSession().getAttribute("coTravellerUserRequests");
    if(coTravellerUserRequests.isEmpty()) {
        System.out.println("Yessss");
    }
ArrayList<Co_Traveller_Info> coTravelersList = (ArrayList<Co_Traveller_Info>) session.getAttribute("coTravelersList");%>

<html>
<head>

</head>
<body>
<div class="class_contents_title">
    Requests
</div>
<div class="class_contents_requests_container">
    <c:forEach var="data" items="${coTravellerUserRequests}">
        <div class="class_contents_request">
            <div class="class_contents_request_name"><span style="font-weight: bold">Name</span><br>${data.getFullname()}</div>
            <div class="class_contents_request_email"><span style="font-weight: bold">Email</span><br>${data.getEmail()}</div>
            <c:set var="dataStatus" value="${data.getStatus()}"/>
            <c:choose>
                <c:when test="${dataStatus == 'pending'}">
                    <div class="class_contents_request_accept"><a href="${pageContext.request.contextPath}/co-traveller-manipulate-user-requests?status=accept&other_user_email=${data.getEmail()}&serviceno=${data.getServiceno()}">Accept</a></div>
                    <div class="class_contents_request_reject"><a href="${pageContext.request.contextPath}/co-traveller-manipulate-user-requests?status=reject&other_user_email=${data.getEmail()}&serviceno=${data.getServiceno()}">Reject</a></div>
                </c:when>
                <c:otherwise>
                    <div class="class_contents_request_text"><span style="color:limegreen">Joined</span></div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:forEach>
</div>
</body>
</html>
