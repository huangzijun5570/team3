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
    <title>电子图书列表</title>
    <style type="text/css">
        tbody > tr:nth-child(odd) {
            background: #CCF6CE;
        }
    </style>
    <!-- 引入bootstrap分页 -->
    <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css"/>
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
    <script>
        $(function () {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage: ${requestScope.pageInfo.pageNum },
                totalPages: ${requestScope.pageInfo.pages },
                pageUrl: function (type, page, current) {
                    return 'inv/selectInvitation.do?pageNum=' + page;
                },
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                }
            });
        });
    </script>
</head>
<body>
<center>
    <table border="1" width="800px" style="text-align: center">
        <thead>
        <tr>
            <th colspan="5" style="text-align: center"><h1>帖子列表</h1></th>
        </tr>
        <tr>
            <td colspan="5" align="center">
                帖子标题：<input type="text" name="title">
                <button id="bnt1">查询</button>
            </td>
        </tr>

        <tr>
            <th>标题</th>
            <th>内容摘要</th>
            <th>作者</th>
            <th>发布时间</th>
            <th colspan="2">操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="inv" items="${pageInfo.list}">
        <tr>
            <td>${inv.title}</td>
            <td>${inv.summary}</td>
            <td>${inv.author}</td>
            <td>${inv.createdate}</td>
            <td><a href="javascript:void(0)" class="sel" InvId="${inv.id}">查看回复</a>||
                <a href="javascript:void(0)" class="del" InvId="${inv.id}">删除</a></td>
        </tr>
        </c:forEach>
    </table>
    </tbody>
    <!-- 把分页搞出来 -->
    <ul id="pagination"></ul>
</center>
<script type="text/javascript">
    //查询标题
    $(function () {
        $("#bnt1").click(function () {
            var title = $("input[name=title]").val();
            $.ajax({
                url: "<%=basePath%>/inv/selectTitle.do",
                type: "POST",
                dataType: "JSON",
                data: {
                    "title": title
                },
                success: function (rs) {
                    var content = "";
                    for (var i  in rs) {
                        var title1 = rs[i].title;
                        var summary = rs[i].summary;
                        var author = rs[i].author;
                        var createdate = rs[i].createdate;
                        content += "<tr> <td>" + title1 + "</td> <td>" + summary + "</td> <td>" + author + "</td> <td>" + createdate + "</td> <td><a href=''>查看回复</a>||<a href=''>删除</a></td> </tr>";
                    }
                    $("tbody").html(content);
                }
            })
        });
//查询回复
        $(".sel").click(function () {
            var id = $(this).attr("InvId")
            location.href = "<%=basePath%>/inv/selectTz.do?id=" + id;
        })

//删除帖子
        $(".del").click(function () {
            var id = $(this).attr("InvId")
            $.ajax({
                url: "<%=basePath%>/inv/deleteInv.do",
                type: "POST",
                dataType: "JSON",
                data: {
                    "id": id
                },
                success: function (rs) {
                    if (rs) {//删除成功
                        //刷新：自行解决
                        window.location.reload();
                        //$("tbody").append("<tr><td colspan='5' align='center'><span style='font-size: 12px;color: red'>删除成功</span></td></tr>");
                    } else {
                        window.alert("操作有误，删除失败，请重试");
                    }
                }
            })
        })

    })

</script>
</body>
</html>