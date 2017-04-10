package stock.mgmt

import grails.transaction.Transactional

/**
 * Transactional service with business logic for managing the articles.
 */
@Transactional
class ArticleService {

    /**
     * Returns all articles that are running low (less than 5 items).
     *
     * @return list of articles
     */
    def getShortages() {
        Article.where { amount < 5 }
    }

    /**
     * Saves a new or detached article.
     */
    def save(Article article) {
        article.save()
    }

}
