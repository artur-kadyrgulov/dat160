using CatalogService as pos from './cat-service';
using CatalogService.POItems from './po-item-fiori';

annotate pos.POHeaders with @( // header-level annotations
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // POs List
    UI        : {
        LineItem            : [
        {
            $Type             : 'UI.DataField',
            Value             : ID,
            Label             : '{i18n>ID}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}                                  
        },
        {
            $Type             : 'UI.DataField',
            Value             : grossAmount,
            Label             : '{i18n>grossAmount}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        },
        {
            $Type             : 'UI.DataField',
            Value             : tax,
            Label             : '{i18n>tax}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        },        
        {
            $Type             : 'UI.DataField',
            Value             : taxAmount,
            Label             : '{i18n>taxAmount}',
            ![@HTML5.CssDefaults] : {width : '100%'}
        },        
        {
            $Type             : 'UI.DataField',
            Value             : netAmount,
            Label             : '{i18n>netAmount}',
            ![@HTML5.CssDefaults] : {width : '100%'}             
        },
        {
            $Type             : 'UI.DataField',
            Value             : currency_code,
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        },
        ],
        PresentationVariant : {SortOrder : [
        {
            $Type      : 'Common.SortOrderType',
            Property   : ID,            
            Descending : false
        },
        {
            $Type      : 'Common.SortOrderType',
            Property   : partner_ID,
            Descending : false
        }
        ]}
    },

    // ---------------------------------------------------------------------------
    // Object Page
    // ---------------------------------------------------------------------------
    // Page Header
    UI        : {
        HeaderInfo                     : {
            TypeName       : '{i18n>poService}',
            TypeNamePlural : '{i18n>poServices}',
            Title          : {Value : ID},
        },
        HeaderFacets                   : [
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #Medium
        },
        {
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#AdministrativeData',
            ![@UI.Importance] : #Medium
        }
        ],
        FieldGroup #Description        : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>ID}'
        }
        ]},
        FieldGroup #Details            : {Data : [
        {
            $Type : 'UI.DataField',
            Value : partner_ID,
            Label : '{i18n>partner}'
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
            Label : '{i18n>currency_code}'            
        }, 
        {
            $Type : 'UI.DataField',
            Value : tax,
            Label : '{i18n>tax}'
        },                
        {
            $Type : 'UI.DataField',
            Value : grossAmount,
            Label : '{i18n>grossAmount}'
        },
        {
            $Type : 'UI.DataField',
            Value : netAmount,
            Label : '{i18n>netAmount}',
            ![@Common.FieldControl] : #ReadOnly 
        },
        {
            $Type : 'UI.DataField',            
            Value : taxAmount,
            Label : '{i18n>taxAmount}',
            ![@Common.FieldControl] : #ReadOnly 
        }
        ]},
        FieldGroup #AdministrativeData : {Data : [
        {
            $Type : 'UI.DataField',
            Value : createdBy
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt
        }
        ]}
    },
    // Page Facets
    UI.Facets : [
    {
        $Type  : 'UI.CollectionFacet',
        ID     : 'PODetails',
        Label  : '{i18n>details}',
        Facets : [{
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>details}',
            Target : '@UI.FieldGroup#Details'
        }]
    },
    {
        $Type  : 'UI.ReferenceFacet',
        Label  : '{i18n>po_items}',
        Target : 'item/@UI.LineItem'
    }
    ]
);