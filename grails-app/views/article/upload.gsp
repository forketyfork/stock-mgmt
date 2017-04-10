<!doctype html>
<html>
<head>
    <title><g:message code="article.upload.title"/></title>
    <meta name="layout" content="main">
</head>

<body>

<div class="container">
    <h1><g:message code="article.upload.title"/></h1>
    <hr class="title-divider"/>

    <div class="row">
        <g:uploadForm action="upload" class="form-inline">
            <label for="file" class="control-label"><g:message code="article.upload.field.file"/></label>

            <g:field id="file" name="file" type="file"
                     accept="text/csv,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                     required="true" class="form-control"/>
            <g:actionSubmit action="upload" value="${message(code: 'article.upload.button')}"
                            class="btn btn-success"/>
            <g:link class="btn btn-warning link-button" action="list"><g:message
                    code="article.upload.button.cancel"/></g:link>
        </g:uploadForm>
    </div>
</div>
</body>
</html>
