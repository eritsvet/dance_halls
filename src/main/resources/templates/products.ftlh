<!DOCTYPE html>
<html>
<head>
    <title>RhythmRoom</title>
</head>
<body>
<h1>RhythmRoom</h1><hr>
<a href="/"></a><br>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href="/login">Войти</a>
</#if>
<h4>Товары со всей России</h4>
</body>
</html>