package stock.mgmt

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }
        "/" {
            controller = "article"
            action = "list"
        }
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
