<!doctype html>
<html>
<head>
    <title><g:message code="article.add.title"/></title>
    <meta name="layout" content="main">
</head>

<body>

<div class="container">
    <h1><g:message code="article.add.title"/></h1>
    <hr class="title-divider"/>

    <div class="row">
        <g:form action="save" class="form-horizontal">
            <div class="form-group">
                <label for="externalId" class="col-sm-2 control-label"><g:message
                        code="article.form.field.externalId"/></label>

                <div class="col-sm-4">
                    <g:textField id="externalId" name="externalId" value="${article?.externalId}" required="true"
                                 class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label for="name" class="col-sm-2 control-label"><g:message code="article.form.field.name"/></label>

                <div class="col-sm-4">
                    <g:textField id="name" name="name" value="${article?.name}" required="true" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label for="brand" class="col-sm-2 control-label"><g:message code="article.form.field.brand"/></label>

                <div class="col-sm-4">
                    <g:textField id="brand" name="brand" value="${article?.brand}" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label for="price" class="col-sm-2 control-label"><g:message code="article.form.field.price"/></label>

                <div class="col-sm-4">
                    <g:field type="number" id="price" name="price" value="${article?.price}" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label for="volume" class="col-sm-2 control-label"><g:message code="article.form.field.volume"/></label>

                <div class="col-sm-4">
                    <g:field type="number" id="volume" name="volume" value="${article?.volume}" class="form-control"/>
                </div>
            </div>

            <div class="form-group">
                <label for="amount" class="col-sm-2 control-label"><g:message code="article.form.field.amount"/></label>

                <div class="col-sm-4">
                    <g:field type="number" id="amount" name="amount" value="${article?.amount ?: 0}" required="true"
                             class="form-control"/>
                </div>
            </div>
            <g:hiddenField id="id" name="id" value="${article?.id}"/>
            <div class="col-sm-6">
                <g:link class="btn btn-warning link-button pull-right button-right" action="list"><g:message
                        code="article.add.button.cancel"/></g:link>
                <g:actionSubmit name="save" action="save" value="${message(code: 'article.add.button.save')}"
                                class="btn btn-success pull-right"/>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>
