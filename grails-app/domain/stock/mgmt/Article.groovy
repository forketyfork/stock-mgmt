package stock.mgmt

/**
 * A product article.
 */
class Article {

    static constraints = {
        brand nullable: true
        volume nullable: true
        price nullable: true
    }

    String externalId
    String name
    String brand
    Integer price
    Integer volume
    Integer amount = 0

}
