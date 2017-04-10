<!doctype html>
<html>
<head>
    <title><g:message code="article.list.title"/></title>
    <meta name="layout" content="main">
</head>

<body>

<div class="container">
    <h1><g:message code="article.list.title"/></h1>
    <hr class="title-divider"/>

    <div class="btn-group">
        <g:form controller="article" action="search" class="form-inline form-search">
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:link controller="article" action="add" class="link-button">
                    <div class="btn btn-info">
                        <i class="fa fa-plus"></i>&nbsp;<g:message code="article.button.create"/>
                    </div>
                </g:link>
            </sec:ifAllGranted>
            <g:link controller="article" action="export" params="[name: name, brand: brand]" class="link-button">
                <div class="btn btn-info">
                    <i class="fa fa-share-square"></i>&nbsp;<g:message code="article.button.export"/>
                </div>
            </g:link>
            <div class="form-group">
                <label for="name" class="control-label"><g:message
                        code="article.form.field.name"/></label>
                <g:textField id="name" name="name" value="${name}" class="form-control"/>
            </div>

            <div class="form-group">
                <label for="brand" class="control-label"><g:message
                        code="article.form.field.brand"/></label>
                <g:textField id="brand" name="brand" value="${brand}" class="form-control"/>
            </div>
            <g:actionSubmit action="search" value="${message(code: 'article.list.button.search')}"
                            class="btn btn-success"/>
            <g:link class="btn btn-warning link-button button-right" action="list"><g:message
                    code="article.list.button.clear"/></g:link>
        </g:form>
    </div>
    <table class="article-list">
        <tr>
            <th><g:message code="article.table.column.externalId"/></th>
            <th><g:message code="article.table.column.name"/></th>
            <th><g:message code="article.table.column.brand"/></th>
            <th><g:message code="article.table.column.price"/></th>
            <th><g:message code="article.table.column.volume"/></th>
            <th><g:message code="article.table.column.amount"/></th>
        </tr>
        <g:each var="article" in="${articles}">
            <tr>
                <td>${article.externalId}</td>
                <td>
                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <g:link controller="article" action="edit" params="[id: article.id]">${article.name}</g:link>
                    </sec:ifAllGranted>
                    <sec:ifAllGranted roles="ROLE_MANAGER">${article.name}</sec:ifAllGranted>
                </td>
                <td>${article.brand}</td>
                <td><g:formatNumber number="${article.price}" type="currency" currencyCode="USD"/></td>
                <td>${article.volume}</td>
                <td>${article.amount}</td>
            </tr>
        </g:each>
    </table>

    <div class="pagination center-block">
        <g:paginate total="${articleCount}"/>
    </div>
</div>
</body>
</html>
