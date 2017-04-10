package stock.mgmt

import org.springframework.web.multipart.MultipartRequest
import org.springframework.web.servlet.support.RequestContextUtils

class ArticleController {

    def excelService

    def articleService

    def upload() {
        if (params.file) {
            (request as MultipartRequest).getFile('file').inputStream
                    .withCloseable { excelService.load(it) }
            redirect(action: 'list')
        } else {
            render(view: 'upload')
        }
    }

    def add() {
        render(view: 'edit')
    }

    def edit() {
        [article: Article.get(params.id as Long)]
    }

    def list() {
        [articles: Article.list([offset: params.offset ?: 0, max: params.max ?: 10]), articleCount: Article.count()]
    }

    def export() {
        def locale = RequestContextUtils.getLocale(request)
        response.setContentType("application/octet-stream")
        response.setHeader("Content-disposition", "attachment; filename=\"export.xlsx\"")
        excelService.export(
                Article.findAllByNameIlikeAndBrandIlike("${params.name}%", "${params.brand}%", params),
                locale,
                response.outputStream
        )
    }

    def search() {
        render(view: 'list', model: params + [
                articles    : Article.findAllByNameIlikeAndBrandIlike("${params.name}%", "${params.brand}%", params),
                articleCount: Article.countByNameIlikeAndBrandIlike("${params.name}%", "${params.brand}%")
        ])
    }

    def shortage() {
        [articles: articleService.getShortages()]
    }

    def save(Article article) {
        articleService.save(article)
        redirect(action: 'list')
    }

}
