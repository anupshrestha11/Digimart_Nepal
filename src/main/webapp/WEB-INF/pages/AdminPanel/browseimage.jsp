<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>file browser</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>

    <style>
        #fileExplorer{
            float: left;
            width: 680px;
            border-left: 1px solid #dff0ff;
        }
        .thumbnail{
            float: left;
            margin: 3px;
            padding: 3px;
            border: 1px solid #dff0ff;
        }

        li{
            padding: 0;
        }
    </style>
</head>
<body>
<div id="fileExplorer">
    <c:forEach var="fileInfo" items="${fileInfos}">
        <div class="thumbnail">
            <img src="/upload/<c:out value="${fileInfo.name}"></c:out>" alt="${fileInfo.name}" title="${fileInfo.name}" width="120" height="100">
            <br>${fileInfo.name}
        </div>
    </c:forEach>
</div>

<script>

    var funcNum = <%=request.getParameter("CKEditorFuncNum") %>;
    $('#fileExplorer').on('click','img',function () {
        var fileUrl = '/upload/'+$(this).attr('title');
        window.opener.CKEDITOR.tools.callFunction(funcNum,fileUrl);
        window.close();
    }).hover(function () {
        $(this).css('cursor','pointer');
    });

</script>

</body>
</html>