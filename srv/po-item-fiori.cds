using CatalogService as pos from './cat-service';


annotate pos.POItems with @( // header-level annotations
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // PO Items List
    UI        : {
        LineItem            : [
        {
            $Type             : 'UI.DataField',
            Value             : product,
            Label             : '{i18n>product}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        },
        {
            $Type             : 'UI.DataField',
            Value             : deliveryDate,
            Label             : '{i18n>deliveryDate}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        },
        {
            $Type             : 'UI.DataField',
            Value             : quantity,
            Label             : '{i18n>quantity}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : product,
            Descending : false
        }]}
    },
    // ---------------------------------------------------------------------------
    // Object Page
    // ---------------------------------------------------------------------------
    // Page Header
    UI        : {
        HeaderInfo              : {
            TypeName       : '{i18n>poItemService}',
            TypeNamePlural : '{i18n>poItemServices}',
            Title          : {Value : ID},
        },
        HeaderFacets            : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        }],
        FieldGroup #Description : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>ID}'
        },
        {
            $Type : 'UI.DataField',
            Value : product,
            Label : '{i18n>product}'
        }
        ]},
        FieldGroup #Details     : {Data : [
        {
            $Type : 'UI.DataField',
            Value : product,
            Label : '{i18n>product}'
        },
        {
            $Type             : 'UI.DataField',
            Value             : deliveryDate,
            Label             : '{i18n>deliveryDate}',
            ![@UI.Importance] : #High
        },
        {
            $Type             : 'UI.DataField',
            Value             : quantity,
            Label             : '{i18n>quantity}',
            ![@UI.Importance] : #High
        }
        ]}
    },
    // Page Facets
    UI.Facets : [{
        $Type  : 'UI.CollectionFacet',
        ID     : 'POItemsDetails',
        Label  : '{i18n>details}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>details}',
            Target : '@UI.FieldGroup#Details'
        }]
    }]
);