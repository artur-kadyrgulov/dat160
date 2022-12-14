using CatalogService as service from '../../srv/cat-service';

annotate service.Partner with {
    name @Common.Label : '{i18n>name}'
};
