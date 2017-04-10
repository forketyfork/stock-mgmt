<!doctype html>
<html>
<head>
    <title><g:message code="article.shortage.title"/></title>
    <meta name="layout" content="main">
</head>

<body>

<div class="container">
    <h1><g:message code="article.shortage.title"/></h1>
    <hr class="title-divider"/>

    <table>
        <tr>
            <th><g:message code="article.table.column.name"/></th>
            <th><g:message code="article.table.column.brand"/></th>
            <th><g:message code="article.table.column.price"/></th>
            <th><g:message code="article.table.column.volume"/></th>
            <th><g:message code="article.table.column.amount"/></th>
        </tr>
        <g:each var="article" in="${articles}">
            <tr>
                <td>${article.name}</td>
                <td>${article.brand}</td>
                <td><g:formatNumber number="${article.price}" type="currency" currencyCode="USD"/></td>
                <td>${article.volume}</td>
                <td>${article.amount}</td>
            </tr>
        </g:each>
    </table>
</div>
</body>
</html>
