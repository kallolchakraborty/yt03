using my.bookshop as my from '../db/data-model';


service CatalogService {
    /**
     * adding authorization using "requires" & restricting the data access using
     * "grant" & "where"
     */
    @requires : 'Admin'
    @restrict : [{
        grant : 'READ',
        where : 'ID = ''2'''
    }]
    entity Books as projection on my.Books;
}
