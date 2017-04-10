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
        <g:uploadForm action="upload" class="form-horizontal col-md-6">
            <div class="form-group">
                <label for="file" class="col-sm-4 control-label"><g:message code="article.upload.field.file"/></label>

                <div class="col-sm-7">
                    <g:field id="file" name="file" type="file"
                             accept="text/csv,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                             required="true" class="form-control"/>
                </div>
            </div>
            <div class="btn-toolbar">
                <g:link class="btn btn-warning link-button pull-right" action="list"><g:message code="article.upload.button.cancel" /></g:link>
                <g:actionSubmit action="upload" value="${message(code: 'article.upload.button')}" class="btn btn-success pull-right"/>
            </div>
        </g:uploadForm>
    </div>
</div>
</body>
</html>
