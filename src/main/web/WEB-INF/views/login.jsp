<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <script type="text/javascript" src="${ctx }/static/js/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="text-center">
    <form id="login_form" action="${ctx}/login" method="post">
        <br>
        <br>
        <br>
        <div style="font-size: 120px">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bootstrap-fill" fill="currentColor"
                 xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                      d="M4.002 0a4 4 0 0 0-4 4v8a4 4 0 0 0 4 4h8a4 4 0 0 0 4-4V4a4 4 0 0 0-4-4h-8zm1.06 12h3.475c1.804 0 2.888-.908 2.888-2.396 0-1.102-.761-1.916-1.904-2.034v-.1c.832-.14 1.482-.93 1.482-1.816 0-1.3-.955-2.11-2.542-2.11H5.062V12zm1.313-4.875V4.658h1.78c.973 0 1.542.457 1.542 1.237 0 .802-.604 1.23-1.764 1.23H6.375zm0 3.762h1.898c1.184 0 1.81-.48 1.81-1.377 0-.885-.65-1.348-1.886-1.348H6.375v2.725z"/>
            </svg>
        </div>
        <h1>Please sign in</h1>
        <table>
            <tr>
                <div class="form-group">
                    <label for="username">
                        <input type="text" name="username" class="form-control" id="username" placeholder="Username">
                        <small style="color: red" id="sign_username"
                               class="form-text text-muted">${fail_login_username}</small>
                    </label>
                </div>
            </tr>
            <tr>
                <div class="form-group">
                    <label for="password">
                        <input type="password" name="password" class="form-control" id="password"
                               placeholder="Password">
                        <small style="font-color: red" id="sign_password"
                               class="form-text text-muted">${fail_login_password}</small>
                    </label>
                </div>
            </tr>
            <tr>
                <button type="submit" class="btn btn-primary">登录</button>
            </tr>
        </table>
    </form>
    <br>
<%--    <a href="" class="btn btn-sm">中文</a>--%>
<%--    <a href="" class="btn btn-sm">English</a>--%>
<%--    &lt;%&ndash;<label class="sr-only">Username</label>&ndash;%&gt;--%>
<%--    &lt;%&ndash;<label class="sr-only">Password</label>&ndash;%&gt;--%>
<%--    &lt;%&ndash;<p class="mt-5 mb-3 text-muted">© 2020-2021</p>--%>
<%--    &ndash;%&gt;--%>
</div>
</body>
</html>
