<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="5; url=./index.html">
        <script>
            function callHomePage() {
                //同步請求
                location.href = 'index.html'
            }
        </script>
        <title>登入成功</title>
    </head>

    <body>
        <!-- 秒數倒數新增js -->
        <%
        Customer c = (Customer)request.getAttribute("member");
        %>
        <h2>
            <%= c!=null?c.getName():"<b>未</b>"%>登入成功!5秒後回<a href="javascript:callHomePage()">首頁</a>
            <%  out.print(c!=null?c.getName():"<b>未</b>");%>登入成功!5秒後回<a href="javascript:callHomePage()">首頁</a>
        </h2>
    </body>

    </html>