<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Perfume Stock"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/#"><i class="fa fa-flask"></i>&nbsp;Perfume Stock</a>
        </div>


        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">
                <g:pageProperty name="page.nav"/>
                <sec:ifLoggedIn>
                    <li><g:link controller="article" action="list"><g:message code="article.list.title"/></g:link></li>
                    <li><g:link controller="article" action="shortage"><g:message
                            code="article.shortage.title"/></g:link></li>
                    <sec:ifAllGranted roles="ROLE_ADMIN"><li><g:link controller="article" action="upload"><g:message
                            code="article.upload.title"/></g:link></li>
                    </sec:ifAllGranted>
                    <li><p class="navbar-text"><g:message
                            code="security.username.comment"/>&nbsp;<sec:username/></p></li>
                </sec:ifLoggedIn>
                <li>
                    <sec:ifNotLoggedIn><a href="/login/auth"><g:message code="security.login"/></a></sec:ifNotLoggedIn>
                    <sec:ifLoggedIn><a href="/logoff"><g:message code="security.logoff"/></a></sec:ifLoggedIn>
                </li>
            </ul>
        </div>
    </div>
</div>

<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

<asset:javascript src="application.js"/>

</body>
</html>
