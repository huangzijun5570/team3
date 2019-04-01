<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>

<html>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<head>
    <title>Title</title>
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <style type="text/css">
        tbody > tr:nth-child(odd) {
            background: #CCF6CE;
        }</style>
</head>
<body>
<center>
    <table border="1" width="500px" style="text-align: center">
        <thead>
        <tr>
            <th colspan="5" style="text-align: center"><h1>回复列表</h1></th>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <a href="javascript:void(0)" class="add" InvId="${param.id}">新增回复</a>
                <a href="javascript:location.href='<%=basePath%>'">返回帖子列表</a>
            </td>
        </tr>

        <tr>
            <th>回复内容</th>
            <th>回复昵称</th>
            <th>发布时间</th>


        </tr>
        </thead>
        <tbody>
        <c:forEach var="inv" items="${requestScope.list}">
        <tr>
            <td>${inv.content}</td>
            <td>${inv.author}</td>
            <td>${inv.createdate}</td>
        </tr>
        </c:forEach>
    </table>
    </tbody>
</center>
<script type="text/javascript">
$(function () {
   $(".add").click(function () {
       var id = $(this).attr("InvId");
       window.open("<%=basePath%>/pages/admin/addInv.jsp?invid=" + id, "", "width=800,height=400,left=350,top=200,resizable:no");
   })
})


</script>
</body>
</html>