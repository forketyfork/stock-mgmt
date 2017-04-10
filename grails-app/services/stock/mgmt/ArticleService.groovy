package stock.mgmt

import grails.transaction.Transactional

@Transactional
class ArticleService {

    def getShortages() {
        Article.where { amount < 5 }
    }

    def save(Article article) {
        article.save()
    }

}
