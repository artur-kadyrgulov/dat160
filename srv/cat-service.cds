using teched.PurchaseOrder as PO from '../db/data-model';

service CatalogService {
    entity POHeaders @(
        title               : '{i18n>poService}',
        restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'POViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'POManager' ]
            }
        ],
        odata.draft.enabled : true
    ) as projection on PO.Headers;

    entity POItems @(
        title               : '{i18n>poService}',
        restrict : [
            {
                grant : [ 'READ' ],
                to : [ 'POViewer' ]
            },
            {
                grant : [ '*' ],
                to : [ 'POManager' ]
            }
      ]
    ) as projection on PO.Items;
}