<%--
  Created by IntelliJ IDEA.
  User: Melon
  Date: 16/11/7
  Time: 下午5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>JMS-Producer</title>
</head>
<body>
<h1>JMS-Producer!!!</h1>
<form action="onsend" method="post">

  MessageText:<textarea name="message">${time }</textarea>

  <input type="submit" value="提交" />
</form>
<h2><a href="welcome">返回主页</a></h2>
</body>
</html>