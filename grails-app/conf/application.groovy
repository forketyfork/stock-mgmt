// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'stock.mgmt.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'stock.mgmt.UserRole'
grails.plugin.springsecurity.authority.className = 'stock.mgmt.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        [pattern: '/', access: ['permitAll']],
        [pattern: '/error', access: ['permitAll']],
        [pattern: '/index', access: ['permitAll']],
        [pattern: '/index.gsp', access: ['permitAll']],
        [pattern: '/shutdown', access: ['permitAll']],
        [pattern: '/assets/**', access: ['permitAll']],
        [pattern: '/**/js/**', access: ['permitAll']],
        [pattern: '/**/css/**', access: ['permitAll']],
        [pattern: '/**/images/**', access: ['permitAll']],
        [pattern: '/**/favicon.ico', access: ['permitAll']],

        [pattern: '/article/list', access: ['ROLE_MANAGER', 'ROLE_ADMIN']],
        [pattern: '/article/search', access: ['ROLE_MANAGER', 'ROLE_ADMIN']],
        [pattern: '/article/export', access: ['ROLE_MANAGER', 'ROLE_ADMIN']],
        [pattern: '/article/add', access: ['ROLE_ADMIN']],
        [pattern: '/article/save', access: ['ROLE_ADMIN']],
        [pattern: '/article/edit/**', access: ['ROLE_ADMIN']],
        [pattern: '/article/upload', access: ['ROLE_ADMIN']],
        [pattern: '/article/shortage', access: ['ROLE_ADMIN', 'ROLE_MANAGER']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
        [pattern: '/assets/**', filters: 'none'],
        [pattern: '/**/js/**', filters: 'none'],
        [pattern: '/**/css/**', filters: 'none'],
        [pattern: '/**/images/**', filters: 'none'],
        [pattern: '/**/favicon.ico', filters: 'none'],
        [pattern: '/**', filters: 'JOINED_FILTERS']
]
