<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>新增电子图书</title>
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/JsonHandler.js"></script>
</head>
<body>
<center>
    <form action="javascript:void(0)" id="form1">
        <table width="600px" width="400px" border="1px" cellspacing="0px" >
            <tr>
                <td colspan="2"  align="center"><h3>新增回复</h3></td>
            </tr>

                <input type="hidden" name="invid" value="${param.invid}">

            <tr>
                <td>回复内容：</td>
                <td>
                    <textarea name="content" cols="50" rows="5"></textarea>
                </td>
            </tr>
            <tr>
                <td>回复昵称：</td>
                <td><input type="text" name="author"></td>
            </tr>

            <tr>
                <td colspan="2">
                    <input type="submit" value="提交">
                    &nbsp;&nbsp;
                    <input type="button" value="返回">
                </td>
            </tr>
        </table>
    </form>
</center>

<script type="text/javascript">
  $(function(){
      $("input[type=submit]").click(function(){
              //将id=form1标签下的所有表单数据构建成JSON类型
              var jsonStr = JSON.stringify($("#form1").serializeObject());
              $.ajax({
                  url: "<%=basePath %>/inv/insertInv.do",
                  type: "POST",
                  dataType: "JSON",
                  data: jsonStr,
                  contentType: "application/json",
                  success: function (rs) {
                      if (rs) {
                          //关闭当前页面
                          window.close();
                          //需要刷新
                          window.opener.location.reload();
                      } else {
                          window.alert("添加失败，请重试");
                      }
                  }
              });
      });
  });
</script>

</body>
</html>
