using CatalogService as pos from './cat-service';


annotate pos.Partner with @( // header-level annotations
    // ---------------------------------------------------------------------------
    // List Report
    // ---------------------------------------------------------------------------
    // PO Items List
    UI        : {
        LineItem            : [
        {
            $Type             : 'UI.DataField',
            Value             : name,
            Label             : '{i18n>name}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        },
        {
            $Type             : 'UI.DataField',
            Value             : city,
            Label             : '{i18n>city}',
            ![@UI.Importance] : #High,
            ![@HTML5.CssDefaults] : {width : '100%'}  
        }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]}
    },
    // ---------------------------------------------------------------------------
    // Object Page
    // ---------------------------------------------------------------------------
    // Page Header
    UI        : {
        HeaderInfo              : {
            TypeName       : '{i18n>poPartnerService}',
            TypeNamePlural : '{i18n>poPartnerServices}',
            Title          : {Value : ID},
        },
        SelectionFields  : [
            name
        ],
        HeaderFacets            : [{
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
        Facets : [
            {
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>Details}', 
                Target: '@UI.FieldGroup#Details'
            },
        ],
        FieldGroup #Description : {Data : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : '{i18n>ID}'
        },
        ]},
        FieldGroup #Details     : {Data : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>name}'
        },
        {
            $Type : 'UI.DataField',
            Value : city,
            Label : '{i18n>city}'
        },
        {
            $Type : 'UI.DataField',
            Value : country_code,
            Label : '{i18n>country_code}'
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
);