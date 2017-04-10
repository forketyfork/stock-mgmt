package stock.mgmt

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
        [
                new Article(externalId: "A304", name: "Aqva Divina", brand: "Bvlgari", price: 25000, volume: 100, amount: 5),
                new Article(externalId: "C802", name: "18 La Lune", brand: "Dolce & Gabbana", price: 12000, volume: 50, amount: 8),
                new Article(externalId: "G223", name: "L'Etrog", brand: "Arquiste", price: 24000, volume: 100, amount: 12),
                new Article(externalId: "405F", name: "Bvlgari Aqva Amara EDT", brand: "Bvlgari", price: 13000, volume: 100, amount: 3),
                new Article(externalId: "829D", name: "Baiser Vole", brand: "Cartier", price: 12000, volume: 150, amount: 2),
                new Article(externalId: "CC84", name: "Cuirs", brand: "Carner Barcelona", price: 24000, volume: 50, amount: 23),
                new Article(externalId: "AF33", name: "Bvlgari Man", brand: "Bvlgari", price: 14000, volume: 100, amount: 24),
                new Article(externalId: "FF29", name: "Pour Un Homme De Caron Sport", brand: "Caron", price: 25000, volume: 150, amount: 9),
                new Article(externalId: "983F", name: "Dolce", brand: "Dolce & Gabbana", price: 23000, volume: 200, amount: 4),
                new Article(externalId: "A928", name: "Gold", brand: "Donna Karan", price: 30000, volume: 50, amount: 3),
                new Article(externalId: "DD38", name: "Stella", brand: "Tocca", price: 30000, volume: 100, amount: 8),
                new Article(externalId: "FA99", name: "Candy", brand: "Prada", price: 20000, volume: 150, amount: 15),
                new Article(externalId: "AAF2", name: "Norell", brand: "Norell Elixir", price: 40000, volume: 150, amount: 0),

        ].each { it.save() }

        def roleAdmin = new Role(authority: "ROLE_ADMIN").save()
        def roleReadonly = new Role(authority: "ROLE_MANAGER").save()

        def userAdmin = new User(username: "admin", password: springSecurityService.encodePassword("777")).save()
        def userManager = new User(username: "manager", password: springSecurityService.encodePassword("999")).save()

        new UserRole(user: userAdmin, role: roleAdmin).save()
        new UserRole(user: userManager, role: roleReadonly).save()

    }
    def destroy = {
    }
}
